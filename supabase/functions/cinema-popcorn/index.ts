
import "jsr:@supabase/functions-js/edge-runtime.d.ts";

const GEMINI_API_KEY = Deno.env.get("GEMINI_API_KEY");
const KIE_API_KEY = Deno.env.get("KIE_API_KEY");

const corsHeaders = {
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
};

interface PopcornRequest {
    action: 'plan' | 'generate_frame' | 'generate_background';
    prompt?: string;
    reference_urls?: string[];
    num_frames?: number;
    style?: string;
    // For generation actions
    frame_plan?: any;
    background_plan?: any;
    all_references?: any[];
    bg_url?: string;
}

Deno.serve(async (req) => {
    if (req.method === "OPTIONS") {
        return new Response("ok", { headers: corsHeaders });
    }

    try {
        const body = await req.json() as PopcornRequest;
        const { action, prompt, reference_urls = [], num_frames = 6, style = "Cinematic Realistic" } = body;

        if (action === 'plan') {
            // 1. Analyze References (Vision)
            const analyzedRefs = await Promise.all(
                reference_urls.map((url, i) => analyzeReference(url, i))
            );

            // 2. Plan Sequence (LLM)
            const plan = await planSequence(prompt || "", analyzedRefs, num_frames, style);

            return new Response(JSON.stringify({ plan, references: analyzedRefs }), {
                headers: { ...corsHeaders, "Content-Type": "application/json" },
            });
        }

        if (action === 'generate_background') {
            const { background_plan } = body;
            if (!background_plan) throw new Error("Missing background_plan");

            const bgUrl = await generateBackground(background_plan, style);
            return new Response(JSON.stringify({ url: bgUrl }), {
                headers: { ...corsHeaders, "Content-Type": "application/json" },
            });
        }

        if (action === 'generate_frame') {
            const { frame_plan, all_references, bg_url } = body;
            if (!frame_plan) throw new Error("Missing frame_plan");

            const frameUrl = await generateFrame(frame_plan, all_references || [], bg_url, style);
            return new Response(JSON.stringify({ url: frameUrl }), {
                headers: { ...corsHeaders, "Content-Type": "application/json" },
            });
        }

        return new Response(JSON.stringify({ error: "Invalid action" }), { status: 400, headers: corsHeaders });

    } catch (error: any) {
        return new Response(JSON.stringify({ error: error.message }), {
            status: 500,
            headers: { ...corsHeaders, "Content-Type": "application/json" },
        });
    }
});

// --- HELPERS ---

async function callGemini(contents: any[], options: { json?: boolean } = {}) {
    const url = `https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=${GEMINI_API_KEY}`;

    const body: any = {
        contents,
        generationConfig: {
            temperature: 0.4,
            ...(options.json ? { responseMimeType: "application/json" } : {})
        }
    };

    const res = await fetch(url, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(body)
    });

    if (!res.ok) throw new Error(`Gemini Error: ${await res.text()}`);
    const data = await res.json();
    const text = data.candidates[0].content.parts[0].text;
    return options.json ? JSON.parse(text) : text;
}

// --- KIE.AI HELPERS ---

async function generateWithKie(payload: any): Promise<string> {
    if (!KIE_API_KEY) throw new Error("Missing KIE_API_KEY");

    console.log("Starting Kie Task:", JSON.stringify(payload));

    // 1. Create Task
    const createRes = await fetch('https://api.kie.ai/api/v1/jobs/createTask', {
        method: 'POST',
        headers: {
            'Authorization': `Bearer ${KIE_API_KEY}`,
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            model: 'nano-banana-pro',
            input: payload
        })
    });

    if (!createRes.ok) {
        const errText = await createRes.text();
        console.error("Kie Create Error:", errText);
        throw new Error(`Kie Create Error: ${errText}`);
    }

    const createData = await createRes.json();
    if (createData.code !== 200) throw new Error(`Kie API Error: ${createData.msg}`);

    const taskId = createData.data.taskId;
    console.log("Kie Task Created:", taskId);

    // 2. Poll Status (Max 60s)
    let attempts = 0;
    while (attempts < 30) {
        await new Promise(r => setTimeout(r, 2000));

        try {
            const statusRes = await fetch(`https://api.kie.ai/api/v1/jobs/recordInfo?taskId=${taskId}`, {
                headers: { 'Authorization': `Bearer ${KIE_API_KEY}` }
            });

            if (!statusRes.ok) continue;
            const statusData = await statusRes.json();

            // console.log("Kie Status:", statusData.data.state);

            if (statusData.data.state === 'success') {
                const resultObj = JSON.parse(statusData.data.resultJson);
                if (resultObj.resultUrls && resultObj.resultUrls.length > 0) {
                    return resultObj.resultUrls[0];
                }
                throw new Error("Kie API returned success but no resultUrls");
            } else if (statusData.data.state === 'fail') {
                throw new Error(`Kie Task Failed: ${statusData.data.failMsg || 'Unknown error'}`);
            }
            // If 'waiting', continue loop
        } catch (e) {
            console.error("Polling error:", e);
        }

        attempts++;
    }
    throw new Error("Kie Task Timeout (60s)");
}

async function analyzeReference(url: string, index: number) {
    const res = await fetch(url);
    const blob = await res.blob();
    const arrayBuffer = await blob.arrayBuffer();
    const base64 = btoa(String.fromCharCode(...new Uint8Array(arrayBuffer)));

    const contents = [{
        role: "user",
        parts: [
            { text: "Analyze this image for a cinematic storyboard. Determine if it's a 'character', 'environment', or 'style' reference. Describe key visual features for consistency. Return JSON: { type: string, description: string, key_features: string[] }" },
            { inline_data: { mime_type: "image/jpeg", data: base64 } }
        ]
    }];

    return await callGemini(contents, { json: true });
}

async function planSequence(prompt: string, references: any[], numFrames: number, style: string) {
    const refContext = references.map((r, i) => `Ref ${i + 1} (${r.type}): ${r.description}. Features: ${r.key_features.join(", ")}`).join("\n");

    const systemPrompt = `You are a professional Storyboard Director.
Plan a coherent ${numFrames}-frame sequence for: "${prompt}"
Style: ${style}

References:
${refContext}

Background Handling:
- Define 1-3 backgrounds needed for this sequence.
- Descriptions should NOT mention the character/subject.

Frame Planning:
- Each frame should have a shot_type, camera_angle, and visual description.
- Ensure natural progression.

Return JSON:
{
  "backgrounds": [ { "id": "bg1", "description": "..." } ],
  "frames": [
    {
      "frame_number": 1,
      "shot_type": "wide/medium/close-up",
      "camera_angle": "eye-level/low/high",
      "description": "Action/Subject description",
      "background_id": "bg1",
      "consistency_rules": "Specific details to keep (e.g. 'holding a red book')"
    }
  ]
}
`;

    const contents = [{ role: "user", parts: [{ text: systemPrompt }] }];
    return await callGemini(contents, { json: true });
}

async function generateBackground(bgPlan: any, style: string) {
    const prompt = `Cinematic background, ${style}. ${bgPlan.description}. NO characters. Photorealistic, high quality, 8k resolution.`;

    return await generateWithKie({
        prompt: prompt,
        aspect_ratio: "16:9",
        resolution: "2K",
        output_format: "png"
    });
}

async function generateFrame(framePlan: any, refs: any[], bgUrl: string | undefined, style: string) {
    // Find character references
    const charRefs = refs.filter(r => r.type === 'character' || r.type === 'product');
    const charDesc = charRefs.map(r => `Subject details: ${r.description}. Key features: ${r.key_features.join(", ")}.`).join(" ");

    // Explicitly use prompt structure that works well for Flux/Imagen/etc
    const prompt = `Cinematic shot, ${style}. Shot type: ${framePlan.shot_type}. Angle: ${framePlan.camera_angle}.
Scene: ${framePlan.description}.
${charDesc}
Consistency: ${framePlan.consistency_rules}. 
Environment context: ${bgUrl ? 'Consistent with established background.' : ''}
Photorealistic, movie still, 8k, highly detailed.`;

    // References for image-to-image or structural control
    // Nano Banana Pro supports 'image_input'
    const inputImages = refs.filter(r => r.url).map(r => r.url);
    if (bgUrl) inputImages.push(bgUrl);

    return await generateWithKie({
        prompt: prompt,
        image_input: inputImages, // Using correct parameter from docs
        aspect_ratio: "16:9",
        resolution: "2K",
        output_format: "png"
    });
}

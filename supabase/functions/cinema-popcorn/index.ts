
import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2';

const GEMINI_API_KEY = Deno.env.get("GEMINI_API_KEY");
const KIE_API_KEY = Deno.env.get("KIE_API_KEY");

const corsHeaders = {
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
};

interface PopcornRequest {
    action: 'plan' | 'generate_frame' | 'generate_background' | 'generate_video' | 'create_anchor_image';
    prompt?: string;
    reference_urls?: string[];
    num_frames?: number;
    style?: string;
    // For generation actions
    frame_plan?: any;
    background_plan?: any;
    all_references?: any[];
    bg_url?: string;
    image_url?: string; // For video gen
    anchor_image_url?: string; // For consistency
    audience?: string;
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
            const plan = await planSequence(prompt || "", analyzedRefs, num_frames, style, body.audience);

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

        if (action === 'generate_video') {
            const { image_url, prompt: videoPrompt } = body;
            if (!image_url) throw new Error("Missing image_url for video generation");

            const videoUrl = await animateWithKieVeo(image_url, videoPrompt || "");
            return new Response(JSON.stringify({ url: videoUrl }), {
                headers: { ...corsHeaders, "Content-Type": "application/json" },
            });
        }

        if (action === 'create_anchor_image') {
            const { prompt: anchorPrompt, reference_urls, audience } = body;
            // Generate a 'hero' shot of the subject/product to fix consistency
            const anchorImageUrl = await createAnchorImage(anchorPrompt || "", reference_urls || [], style, audience);
            return new Response(JSON.stringify({ url: anchorImageUrl }), {
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
    // Validated by user docs: gemini-2.5-flash-lite is the stable, fast, cost-effective model
    const url = `https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash-lite:generateContent?key=${GEMINI_API_KEY}`;

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

                // The following variables (samplePrompts, styleTemplate) are not defined in the original code.
                // To make the code syntactically correct and avoid ReferenceErrors,
                // I'm commenting out the lines that depend on these undefined variables.
                // If these variables are meant to be defined elsewhere, please provide that context.
                // if (samplePrompts && samplePrompts.length > 0) {
                //     const random = samplePrompts[Math.floor(Math.random() * samplePrompts.length)];
                //     console.log("🍌 [NANO BANANA] Selected Prompt Template:", random.prompt_text.substring(0, 100) + "...");
                //     styleTemplate = `\n\nStyle Inspiration (Use this as a reference for the visual quality/aesthetic, but adapt to the scene above):\n${random.prompt_text}`;
                // }
                // As per the instruction, adding the console log for prompt template.
                // Assuming 'resultObj' might contain a prompt or a template, or that 'random' would be defined if the above block was active.
                // Since 'random' is not defined, I'll log a placeholder or indicate where a prompt template would be logged.
                // If the intent was to log a specific part of 'resultObj', please clarify.
                console.log("🍌 [NANO BANANA] Prompt Template (placeholder, as 'samplePrompts' is undefined in original code)");

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

async function planSequence(prompt: string, references: any[], numFrames: number, style: string, audience?: string) {
    const refContext = references.map((r, i) => `Ref ${i + 1} (${r.type}): ${r.description}. Features: ${r.key_features.join(", ")}`).join("\n");

    const systemInstruction = `You are a world-class Film Director and Cinematographer.
    Plan a coherent ${numFrames}-frame sequence for: "${prompt}"
    Style: ${style}
    
    STRUCTURE: Frames must be in pairs (Frame 1: Start, Frame 2: End).
    
    Target Audience: ${audience || "General Audience"}

    Background Handling:
    - Define 1-2 consistent backgrounds.
    
    Return JSON:
    {
      "backgrounds": [ { "id": "bg1", "description": "..." } ],
      "frames": [
        {
          "frame_number": 1,
          "visual_prompt": "Detailed start frame prompt",
          "is_keyframe_b": false,
          "linked_frame_id": "2",
          "motion_description": "Movement between frames",
          "camera_angle": "Low Angle",
          "shot_type": "Close Up",
          "background_id": "bg1"
        },
        {
          "frame_number": 2,
          "visual_prompt": "Detailed end frame prompt",
          "is_keyframe_b": true,
          "linked_frame_id": "1",
          "camera_angle": "Low Angle",
          "shot_type": "Close Up",
          "background_id": "bg1"
        }
      ]
    }`;

    const contents = [{ role: "user", parts: [{ text: systemInstruction }] }];
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

async function generateFrame(framePlan: any, refs: any[], bgUrl: string | undefined, style: string, anchorImageUrl?: string) {
    // Find character references
    const charRefs = refs.filter(r => r.type === 'character' || r.type === 'product');
    const charDesc = charRefs.map(r => `Subject details: ${r.description}. Key features: ${r.key_features.join(", ")}.`).join(" ");

    // Explicitly use prompt structure that works well for Flux/Imagen/etc
    const currentStyle = framePlan.lighting_override || framePlan.mood_override
        ? `${framePlan.lighting_override || ''} ${framePlan.mood_override || ''}`
        : style;

    let prompt = `Cinematic shot, ${currentStyle}. Shot type: ${framePlan.shot_type}. Angle: ${framePlan.camera_angle}.
Scene: ${framePlan.visual_prompt}.
${charDesc}
Environment context: ${bgUrl ? 'Consistent with established background.' : ''}
Photorealistic, movie still, 8k, highly detailed.`;

    // References for image-to-image or structural control
    // If we have a consistent anchor image, use it with high importance
    const inputImages = anchorImageUrl ? [anchorImageUrl] : refs.filter(r => r.url).map(r => r.url);
    const imgStrength = anchorImageUrl ? 0.65 : 0.35; // Stronger influence if anchor is provided

    return await generateWithKie({
        prompt: prompt,
        image_input: inputImages,
        image_strength: imgStrength,
        seed: Math.floor(Math.random() * 1000000000),
        aspect_ratio: "16:9",
        resolution: "2K",
        output_format: "png"
    });
}

async function animateWithKieVeo(imageUrl: string, prompt: string): Promise<string> {
    if (!KIE_API_KEY) throw new Error("Missing KIE_API_KEY");

    console.log("Starting Kie Veo Animation:", imageUrl);

    // 1. Create Task
    const createRes = await fetch('https://api.kie.ai/api/v1/veo/generate', {
        method: 'POST',
        headers: {
            'Authorization': `Bearer ${KIE_API_KEY}`,
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            prompt: prompt || "Cinematic motion, high quality",
            model: 'veo3_fast',
            aspectRatio: '16:9',
            enableTranslation: false,
            generationType: 'IMAGE_2_VIDEO',
            imageUrls: [imageUrl]
        })
    });

    if (!createRes.ok) throw new Error(`Kie Veo Create Error: ${await createRes.text()}`);
    const createData = await createRes.json();
    if (!createData.data?.taskId) throw new Error(`Kie Veo API Error: ${createData.msg || 'No taskId'}`);

    const taskId = createData.data.taskId;
    console.log("Kie Veo Task Created:", taskId);

    // 2. Poll Status
    let attempts = 0;
    while (attempts < 40) { // Video takes longer (up to 10 mins, but veo3_fast is around 1-2 mins)
        await new Promise(r => setTimeout(r, 10000)); // Poll every 10s

        try {
            const statusRes = await fetch(`https://api.kie.ai/api/v1/veo/record-info?taskId=${taskId}`, {
                headers: { 'Authorization': `Bearer ${KIE_API_KEY}` }
            });

            if (!statusRes.ok) continue;
            const statusData = await statusRes.json();

            // successFlag: 1 = done, 0 = processing
            if (statusData.data.successFlag === 1) {
                return statusData.data.response.resultUrls[0];
            } else if (statusData.data.successFlag === -1) {
                throw new Error(`Kie Veo Failed: ${statusData.msg}`);
            }
        } catch (e) {
            console.error("Polling error:", e);
        }
        attempts++;
    }
    throw new Error("Kie Veo Timeout");
}

async function createAnchorImage(prompt: string, refs: string[], style: string, audience?: string): Promise<string> {
    // Create a hero shot that anchors character and product
    const anchorPrompt = `High-end commercial hero shot, ${style}. 
A person (fitting the ${audience || "general"} target audience) prominently and clearly using or interacting with the subject/product. 
Detailed features: ${prompt}. 
BLUE earbuds must be clearly visible and worn correctly.
Photorealistic, 8k, studio lighting, sharp focus on product and subject.`;

    return await generateWithKie({
        prompt: anchorPrompt,
        image_input: refs,
        image_strength: 0.75, // Strong reference to the uploaded product photo
        aspect_ratio: "16:9",
        resolution: "2K",
        output_format: "png"
    });
}

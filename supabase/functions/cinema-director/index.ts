import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { CAMERA_OPTIONS, LENS_OPTIONS, LIGHTING_OPTIONS, MOVIE_LOOK_OPTIONS } from "../_shared/cinema-presets.ts";

// Configuration
const GEMINI_API_KEY = Deno.env.get("GEMINI_API_KEY");

const corsHeaders = {
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
};

interface DirectorRequest {
    action: 'analyze_image' | 'plan_sequence' | 'chat' | 'generate_preview' | 'animate_preview' | 'check_status';
    prompt?: string;
    image_url?: string;
    history?: any[]; // For chat context
    specs?: any; // For image generation
    task_id?: string; // For polling
    style?: string;
    num_frames?: number;
}

Deno.serve(async (req) => {
    if (req.method === "OPTIONS") {
        return new Response("ok", { headers: corsHeaders });
    }

    try {
        const reqBody = await req.json() as DirectorRequest;
        const { action, prompt, image_url, history, style = "Cinematic Realistic", num_frames = 6 } = reqBody;

        if (!GEMINI_API_KEY) {
            throw new Error("Missing GEMINI_API_KEY");
        }

        // -------------------------------------------------------------------------
        // ACTION 1: ANALYZE IMAGE (Vision)
        // -------------------------------------------------------------------------
        if (action === "analyze_image" && image_url) {
            const analysis = await analyzeImage(image_url);
            return new Response(JSON.stringify(analysis), {
                headers: { ...corsHeaders, "Content-Type": "application/json" },
            });
        }

        // -------------------------------------------------------------------------
        // ACTION 2: PLAN SEQUENCE
        // -------------------------------------------------------------------------
        if (action === "plan_sequence") {
            const plan = await planSequence(prompt || "", image_url || "", style, num_frames);
            return new Response(JSON.stringify(plan), {
                headers: { ...corsHeaders, "Content-Type": "application/json" },
            });
        }

        // -------------------------------------------------------------------------
        // ACTION 3: CHAT (Collaborative Director)
        // -------------------------------------------------------------------------
        if (action === "chat") {
            const reply = await chatWithDirector(history || [], prompt || "", image_url);

            // AUTO-STORYBOARD TRIGGER
            // If the AI Director decides the vision is ready, we generate the plan immediately.
            if (reply.content.ready_for_storyboard) {
                console.log("Director is ready. Generating storyboard for:", reply.content.refined_prompt);
                const finalPrompt = reply.content.refined_prompt || prompt || "";

                // We use the same planSequence logic
                const plan = await planSequence(finalPrompt, image_url || "", style, num_frames);

                // Attach the plan to the chat response so frontend can render it
                reply.content.storyboard = plan;
            }

            return new Response(JSON.stringify(reply), {
                headers: { ...corsHeaders, "Content-Type": "application/json" },
            });
        }

        // -------------------------------------------------------------------------
        // ACTION 4: GENERATE PREVIEW (Image)
        // -------------------------------------------------------------------------
        if (action === "generate_preview") {
            // 1. Refine prompt for Nano Banana Pro
            const refinedPrompt = await refineImagePrompt(prompt || "", reqBody.specs);
            // 2. Generate Image
            const imageUrl = await generateImage(refinedPrompt);

            return new Response(JSON.stringify({ image_url: imageUrl, refined_prompt: refinedPrompt }), {
                headers: { ...corsHeaders, "Content-Type": "application/json" },
            });
        }

        // -------------------------------------------------------------------------
        // ACTION 5: ANIMATE PREVIEW (Video)
        // -------------------------------------------------------------------------
        if (action === "animate_preview") {
            if (!image_url) throw new Error("Image URL required for animation");

            // Start Video Gen (Returns Task ID)
            const taskId = await startVideoGeneration(image_url, prompt || "Cinematic slow motion");

            return new Response(JSON.stringify({ task_id: taskId, status: "processing" }), {
                headers: { ...corsHeaders, "Content-Type": "application/json" },
            });
        }

        // -------------------------------------------------------------------------
        // ACTION 6: CHECK STATUS (Polling)
        // -------------------------------------------------------------------------
        if (action === "check_status") {
            if (!reqBody.task_id) throw new Error("Task ID required");

            const status = await checkVideoStatus(reqBody.task_id);
            return new Response(JSON.stringify(status), {
                headers: { ...corsHeaders, "Content-Type": "application/json" },
            });
        }

        return new Response(JSON.stringify({ error: "Invalid action" }), { status: 400, headers: corsHeaders });

    } catch (error) {
        return new Response(JSON.stringify({ error: error.message }), {
            status: 500,
            headers: { ...corsHeaders, "Content-Type": "application/json" },
        });
    }
});

// --- HELPER FUNCTIONS ---

async function fetchImageBase64(url: string): Promise<string> {
    const res = await fetch(url);
    if (!res.ok) throw new Error(`Failed to fetch image: ${res.statusText}`);
    const blob = await res.blob();
    const arrayBuffer = await blob.arrayBuffer();
    const base64 = btoa(String.fromCharCode(...new Uint8Array(arrayBuffer)));
    return base64;
}

async function callGemini(contents: any[], options: { json?: boolean } = {}) {
    const model = "gemini-3-flash-preview";
    const url = `https://generativelanguage.googleapis.com/v1beta/models/${model}:generateContent?key=${GEMINI_API_KEY}`;

    const body: any = {
        contents: contents,
        generationConfig: {
            temperature: 0.7,
        }
    };

    if (options.json) {
        body.generationConfig.responseMimeType = "application/json";
    }

    const response = await fetch(url, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(body)
    });

    if (!response.ok) {
        const err = await response.text();
        throw new Error(`Gemini API Error: ${err}`);
    }

    const result = await response.json();
    if (!result.candidates || !result.candidates[0].content) {
        throw new Error("No response from Gemini");
    }

    const text = result.candidates[0].content.parts[0].text;
    return options.json ? JSON.parse(text) : text;
}

async function analyzeImage(imageUrl: string) {
    const base64Image = await fetchImageBase64(imageUrl);
    const contents = [{
        role: "user",
        parts: [
            { text: "Analyze this image for a cinematic commercial. Describe: 1. Subject 2. Key visual features (colors, lighting) 3. Suitable mood/style. Return simple JSON with keys: subject, visual_features, mood." },
            { inline_data: { mime_type: "image/jpeg", data: base64Image } }
        ]
    }];
    return await callGemini(contents, { json: true });
}

async function planSequence(prompt: string, imageUrl: string, style: string, numFrames: number) {
    let imagePart = null;
    if (imageUrl) {
        const base64 = await fetchImageBase64(imageUrl);
        imagePart = { inline_data: { mime_type: "image/jpeg", data: base64 } };
    }

    const systemInstruction = `You are a professional visual planner (Director AI). 
Plan ${numFrames} frames that fulfill the brief.
STYLE: ${style}

CONTEXT DETECTION:
- Narrative: wide -> close-up -> action
- Product: front -> side -> detail -> lifestyle

OUTPUT FORMAT (JSON):
{
  "backgrounds": [{ "id": "bg1", "description": "..." }],
  "frames": [
    {
      "frame_number": 1,
      "shot_type": "wide/medium/close-up",
      "camera_angle": "eye-level/low/high",
      "description": "Detailed visual description",
      "movement": "Camera movement (pan/tilt/dolly)",
      "background_id": "bg1"
    }
  ],
  "consistency_rules": "..."
}
`;

    const parts = [{ text: `Prompt: ${prompt}\n\n${systemInstruction}` }];
    if (imagePart) parts.push(imagePart);

    const contents = [{ role: "user", parts }];
    return await callGemini(contents, { json: true });
}

// --- NEW STUDIO FUNCTIONS ---

async function refineImagePrompt(userPrompt: string, specs: any) {
    const specText = specs ? `
    Camera: ${specs.camera || "Cinematic"}
    Lens: ${specs.lens || "Standard"}
    Lighting: ${specs.lighting || "Natural"}
    Mood: ${specs.mood || "Balanced"}
    ` : "";

    const contents = [{
        role: "user",
        parts: [{
            text: `Act as a Prompt Engineer for a high-end AI Image Generator (Nano Banana Pro).
        Reword this user concept into a detailed visual prompt.
        
        User Concept: "${userPrompt}"
        Technical Specs: ${specText}
        
        Guidelines:
        - Focus on Subject, Actions, Context, Lighting, and Art Style.
        - Be descriptive but concise.
        - Output ONLY the raw prompt string, no JSON.` }]
    }];

    return await callGemini(contents, { json: false });
}

async function generateImage(prompt: string) {
    // Using WaveSpeed API (Nano Banana Pro)
    // We'll use Deno.env.get("RAPIDAPI_KEY"). If not set, we might need a fallback.
    // Assuming RAPIDAPI_KEY is available in Supabase secrets from previous user context.
    const apiKey = Deno.env.get("RAPIDAPI_KEY");
    if (!apiKey) throw new Error("RAPIDAPI_KEY not configured");

    const response = await fetch('https://api.wavespeed.ai/api/v3/google/nano-banana-pro/edit', {
        method: 'POST',
        headers: {
            'x-rapidapi-key': apiKey,
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            aspect_ratio: '16:9',
            enable_base64_output: false,
            enable_sync_mode: true,
            output_format: 'png',
            prompt: prompt,
            resolution: '2k' // High quality for studio
        })
    });

    if (!response.ok) {
        const txt = await response.text();
        throw new Error(`Image Gen Failed: ${txt}`);
    }

    const data = await response.json();
    return data.data.outputs[0];
}

async function startVideoGeneration(imageUrl: string, prompt: string) {
    const apiKey = Deno.env.get("RAPIDAPI_KEY");
    if (!apiKey) throw new Error("RAPIDAPI_KEY not configured");

    const response = await fetch('https://api.kie.ai/api/v1/veo/generate', {
        method: 'POST',
        headers: {
            'x-rapidapi-key': apiKey,
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            prompt: prompt,
            model: 'veo3_fast',
            aspectRatio: '16:9',
            enableTranslation: false,
            generationType: 'IMAGE_2_VIDEO', // Standard Image to Video
            imageUrls: [imageUrl]
        })
    });

    if (!response.ok) {
        const txt = await response.text();
        console.error("Video Start Error:", txt);
        throw new Error(`Video Gen Failed: ${txt}`);
    }

    const data = await response.json();
    return data.data.taskId;
}

async function checkVideoStatus(taskId: string) {
    const apiKey = Deno.env.get("RAPIDAPI_KEY");
    if (!apiKey) throw new Error("RAPIDAPI_KEY not configured");

    const response = await fetch(
        `https://api.kie.ai/api/v1/veo/record-info?taskId=${taskId}`,
        {
            headers: {
                'x-rapidapi-key': apiKey
            }
        }
    );

    if (!response.ok) throw new Error(`Status Check Failed: ${response.statusText}`);

    const data = await response.json();

    // successFlag: 1 = done, 0 = processing, -1 = error
    if (data.data.successFlag === 1) {
        return { status: 'done', video_url: data.data.response.resultUrls[0] };
    } else if (data.data.successFlag === -1) {
        return { status: 'error', error: "Video generation failed provider-side" };
    } else {
        return { status: 'processing' };
    }
}


async function chatWithDirector(history: any[], lastUserMessage: string, imageUrl?: string) {
    // Flatten history to Gemini format if needed, or just append recent context
    // Gemini supports multi-turn via 'contents' array with 'user'/'model' roles.

    // Inject Preset Knowledge
    const cameraList = CAMERA_OPTIONS.map(c => c.label).join(", ");
    const lensList = LENS_OPTIONS.map(l => l.label).join(", ");
    const lightingList = LIGHTING_OPTIONS.map(l => l.label).join(", ");

    const systemPrompt = `You are an expert Creative Director.
    Tools: CAMERAS (${cameraList}), LENSES (${lensList}), LIGHTING (${lightingList}).
    
    GOAL: Guide the user to a clear vision. Do NOT just say "Okay".
    PROCESS:
    1. If the user's request is vague or text-only, ask 1-2 SHORT, specific questions about Mood, Lighting, or Story logic to refine the vision.
    2. If the user provides an image, rely on it but ask about the desired motion or atmosphere.
    3. If the vision is clear (subject + mood + context are known) OR the user asks to "start/generate", set "ready_for_storyboard": true.

    OUTPUT FORMAT: JSON ONLY.
    {
      "message": "Short, friendly response. If asking questions, be concise.",
      "ready_for_storyboard": boolean, // TRUE only when you have enough info to plan 6 frames.
      "refined_prompt": "The detailed visual prompt summarizing the agreed vision (Required if ready=true).",
      "specs": {
        "camera": "Best camera choice",
        "lens": "Best lens choice",
        "lighting": "Best lighting choice",
        "mood": "2-3 word mood description"
      }
    }
    If not ready, ready_for_storyboard MUST be false.`;

    // Convert history format (assuming standard [{role, content}]) to Gemini ({role: "user"|"model", parts: [{text}]})
    const geminiHistory = history.map((msg: any) => {
        let textContent = "";
        // If previous content was JSON (from our new format), extract the message part for history
        try {
            if (typeof msg.content === 'object' && msg.content.message) {
                textContent = msg.content.message;
            } else if (typeof msg.content === 'string' && msg.content.trim().startsWith('{')) {
                const parsed = JSON.parse(msg.content);
                textContent = parsed.message || msg.content;
            } else {
                textContent = msg.content;
            }
        } catch (e) {
            textContent = msg.content;
        }

        return {
            role: msg.role === "assistant" ? "model" : "user",
            parts: [{ text: textContent }]
        };
    });

    // Add current message
    const currentParts: any[] = [{ text: `System: ${systemPrompt}\nUser: ${lastUserMessage}` }];

    if (imageUrl) {
        try {
            const base64 = await fetchImageBase64(imageUrl);
            currentParts.push({ inline_data: { mime_type: "image/jpeg", data: base64 } });
        } catch (e) {
            console.error("Failed to load image for chat", e);
            // Continue without image
        }
    }

    const contents = [
        ...geminiHistory,
        { role: "user", parts: currentParts }
    ];

    // Force JSON response
    const result = await callGemini(contents, { json: true });
    return {
        role: "assistant",
        content: result // result is now the JSON object { message, specs }
    };
}

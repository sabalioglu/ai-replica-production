
import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { CAMERA_OPTIONS, LENS_OPTIONS, LIGHTING_OPTIONS, MOVIE_LOOK_OPTIONS } from "../_shared/cinema-presets.ts";

// Configuration
const GEMINI_API_KEY = "AIzaSyDv6l11JeYDVcN4OWIjk1gf_Z4hOWm_JJI"; // User provided key

const corsHeaders = {
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
};

interface DirectorRequest {
    action: 'analyze_image' | 'plan_sequence' | 'chat';
    prompt?: string;
    image_url?: string;
    history?: any[]; // For chat context
    style?: string;
    num_frames?: number;
}

Deno.serve(async (req) => {
    if (req.method === "OPTIONS") {
        return new Response("ok", { headers: corsHeaders });
    }

    try {
        const { action, prompt, image_url, history, style = "Cinematic Realistic", num_frames = 6 } = await req.json() as DirectorRequest;

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
            return new Response(JSON.stringify(reply), {
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
    const model = "gemini-1.5-flash";
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

async function chatWithDirector(history: any[], lastUserMessage: string, imageUrl?: string) {
    // Flatten history to Gemini format if needed, or just append recent context
    // Gemini supports multi-turn via 'contents' array with 'user'/'model' roles.

    // Inject Preset Knowledge
    const cameraList = CAMERA_OPTIONS.map(c => c.label).join(", ");
    const lensList = LENS_OPTIONS.map(l => l.label).join(", ");

    const systemPrompt = `You are an expert Creative Director.
Tools: CAMERAS (${cameraList}), LENSES (${lensList}).
Goal: Clarify Product, Audience, Vibe. Propose "Creative Formula".
Keep responses short.`;

    // Convert history format (assuming standard [{role, content}]) to Gemini ({role: "user"|"model", parts: [{text}]})
    const geminiHistory = history.map((msg: any) => ({
        role: msg.role === "assistant" ? "model" : "user",
        parts: [{ text: msg.content }]
    }));

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

    const text = await callGemini(contents, { json: false });
    return {
        role: "assistant",
        content: text
    };
}

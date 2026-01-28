
import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";
import { CAMERA_OPTIONS, LENS_OPTIONS, LIGHTING_OPTIONS, MOVIE_LOOK_OPTIONS } from "../_shared/cinema-presets.ts";

// Configuration
const OPENAI_API_KEY = Deno.env.get("OPENAI_API_KEY"); // Using OpenAI as proxy for strict instruction following

const corsHeaders = {
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
};

/**
 * AI Director Logic - Ported from Open-Higgsfield-Popcorn
 */

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

        if (!OPENAI_API_KEY) {
            throw new Error("Missing OPENAI_API_KEY");
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
        // ACTION 2: PLAN SEQUENCE (The "Popcorn" Logic)
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
            const reply = await chatWithDirector(history || [], prompt || "");
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

async function analyzeImage(imageUrl: string) {
    const response = await fetch("https://api.openai.com/v1/chat/completions", {
        method: "POST",
        headers: {
            "Authorization": `Bearer ${OPENAI_API_KEY}`,
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            model: "gpt-4o", // Vision capable
            messages: [
                {
                    role: "user",
                    content: [
                        { type: "text", text: "Analyze this image for a cinematic commercial. Describe: 1. Subject 2. Key visual features (colors, lighting) 3. Suitable mood/style. Return simple JSON." },
                        { type: "image_url", image_url: { url: imageUrl } }
                    ]
                }
            ],
            response_format: { type: "json_object" }
        })
    });
    const result = await response.json();
    return JSON.parse(result.choices[0].message.content);
}

async function planSequence(prompt: string, imageUrl: string, style: string, numFrames: number) {
    // 1. Construct the "Popcorn" System Prompt
    const systemPrompt = `You are a professional visual planner (Director AI). 
Analyze the user's request and plan ${numFrames} frames.

STYLE: ${style}
TASK: Plan ${numFrames} frames that fulfill the brief.

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

CRITICAL: Subject must remain consistent.
`;

    const userContent = imageUrl
        ? [{ type: "text", text: `Prompt: ${prompt}` }, { type: "image_url", image_url: { url: imageUrl } }]
        : [{ type: "text", text: `Prompt: ${prompt}` }];

    const response = await fetch("https://api.openai.com/v1/chat/completions", {
        method: "POST",
        headers: {
            "Authorization": `Bearer ${OPENAI_API_KEY}`,
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            model: "gpt-4o",
            messages: [
                { role: "system", content: systemPrompt },
                { role: "user", content: userContent }
            ],
            response_format: { type: "json_object" }
        })
    });

    const result = await response.json();
    return JSON.parse(result.choices[0].message.content);
}

async function chatWithDirector(history: any[], lastUserMessage: string) {
    // Inject Preset Knowledge into System Prompt
    const cameraList = CAMERA_OPTIONS.map(c => c.label).join(", ");
    const lensList = LENS_OPTIONS.map(l => l.label).join(", ");

    const systemPrompt = `You are an expert Creative Director. Your goal is to help the user create a perfect video ad.
You have access to these Pro Studio Tools:
- CAMERAS: ${cameraList}
- LENSES: ${lensList}

PHASE 1: INTERVIEW
Ask concise questions to clarify:
1. Product/Subject (if not clear)
2. Target Audience / Platform (Instagram, TV, etc.)
3. Vibe/Mood (use Pro Presets to suggest looks)

PHASE 2: SUGGESTION
Once you have enough info, propose a "Creative Formula" (e.g. "The Hero's Journey" or "ASMR Unboxing").

Keep responses short and conversational. Do NOT generate the full shotlist yet, just agree on direction.`;

    const messages = [
        { role: "system", content: systemPrompt },
        ...history,
        { role: "user", content: lastUserMessage }
    ];

    const response = await fetch("https://api.openai.com/v1/chat/completions", {
        method: "POST",
        headers: {
            "Authorization": `Bearer ${OPENAI_API_KEY}`,
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            model: "gpt-4o",
            messages: messages
        })
    });

    const result = await response.json();
    return {
        role: "assistant",
        content: result.choices[0].message.content,
        // Calculate completeness score or separate "is_ready" flag logic could go here
    };
}

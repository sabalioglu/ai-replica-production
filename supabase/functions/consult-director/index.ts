// AI Cinema - Creative Director Consultant (Chat Agent)
// Engages with user to refine creative direction before generation

import { serve } from 'https://deno.land/std@0.168.0/http/server.ts';
import { corsHeaders, retryWithBackoff, createSupabaseClient } from '../_shared/utils.ts';

interface Message {
    role: 'user' | 'assistant';
    content: string;
}

interface RequestBody {
    messages: Message[];
    image_urls?: string[]; // Optional images uploaded by user
}

serve(async (req) => {
    if (req.method === 'OPTIONS') {
        return new Response('ok', { headers: corsHeaders });
    }

    try {
        const { messages, image_urls } = await req.json() as RequestBody;

        // System prompt for the Consultant
        const systemPrompt = `
    ROLE: You are an expert AI Film Director and Creative Consultant for a high-end video ad agency.
    GOAL: Collaborate with the user to plan a 40-second Cinematic Video Ad. Your job is NOT to generate the video yet, but to INTERVIEW the user to get the perfect "Creative Direction" and "Shotlist".
    
    BEHAVIOR:
    1.  **Analyze** the user's inputs and any images they uploaded.
    2.  **Ask Clarifying Questions:** If the user is vague, ask about Mood, Target Audience, or USP (Unique Selling Point). Ask one question at a time.
    3.  **Propose Ideas:** "Based on this watch image, I suggest a 'Luxury/High-Fashion' mood with slow dolly shots. Do you prefer a dark, moody vibe or a bright, clean look?"
    4.  **Finalize:** When you feel you have enough info (Concept, Product details, Mood), yield a structured JSON summary hidden in a specific format.

    KNOWLEDGE:
    - You know about "Viral Hook", "Cinematic Journey", and "Product Hero" ad formulas. Suggest these to the user.

    OUTPUT FORMAT:
    - If continuing conversation: Just reply as text.
    - If finalizing: End your message with the text "READY_TO_START" and then include a JSON block:
    
    \`\`\`json
    {
      "finalized_config": {
        "creative_direction": "Full detailed paragraph summarizing the agreed concept...",
        "suggested_formula": "Cinematic Journey",
        "voice_mood": "Deep Male",
        "director_notes": "User wants emphasis on the red color..."
      }
    }
    \`\`\`
    `;

        // Construct Gemini Prompt
        const chatHistory = messages.map(m => ({
            role: m.role === 'user' ? 'user' : 'model',
            parts: [{ text: m.content }]
        }));

        const contents = [
            {
                role: 'user',
                parts: [{ text: systemPrompt }]
            },
            ...chatHistory
        ];

        const response = await retryWithBackoff(async () => {
            return await fetch(
                `https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash-exp:generateContent?key=${Deno.env.get('GEMINI_API_KEY')}`,
                {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({
                        contents: contents,
                        generationConfig: {
                            temperature: 0.7,
                            maxOutputTokens: 1000,
                        }
                    })
                }
            );
        });

        const data = await response.json();
        const reply = data.candidates[0].content.parts[0].text;

        return new Response(
            JSON.stringify({
                role: 'assistant',
                content: reply
            }),
            { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        );

    } catch (error) {
        console.error('Error in consult-director:', error);
        return new Response(
            JSON.stringify({ error: error.message }),
            { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        );
    }
});

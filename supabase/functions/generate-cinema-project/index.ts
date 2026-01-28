// AI Cinema - Main Orchestrator Edge Function
// Validates input, generates prompts, creates scenes, triggers async processing

import { serve } from 'https://deno.land/std@0.168.0/http/server.ts';
import { createSupabaseClient, corsHeaders, logGenerationEvent, retryWithBackoff } from '../_shared/utils.ts';

interface RequestBody {
    project_id: string;
}

interface AIAgentOutput {
    strategy?: {
        formula: string;
        reasoning: string;
    };
    script: string;
    music_prompt: string;
    scenes: Array<{
        scene_number: number;
        director_note?: string;
        shot_type?: string;
        scene: string;
        starting_image_prompt: string;
        ending_image_prompt: string;
        transition_prompt: string;
    }>;
}

serve(async (req) => {
    // Handle CORS preflight
    if (req.method === 'OPTIONS') {
        return new Response('ok', { headers: corsHeaders });
    }

    try {
        const { project_id } = await req.json() as RequestBody;

        if (!project_id) {
            return new Response(
                JSON.stringify({ error: 'Missing project_id' }),
                { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
            );
        }

        const supabase = createSupabaseClient();

        // 1. Fetch project from database
        const { data: project, error: projectError } = await supabase
            .from('cinema_projects')
            .select('*')
            .eq('id', project_id)
            .single();

        if (projectError || !project) {
            return new Response(
                JSON.stringify({ error: 'Project not found' }),
                { status: 404, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
            );
        }

        // 2. Validate project status
        if (project.status !== 'draft') {
            return new Response(
                JSON.stringify({ error: 'Project must be in draft status' }),
                { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
            );
        }

        // 3. Update status to generating
        await supabase
            .from('cinema_projects')
            .update({
                status: 'generating',
                generation_started_at: new Date().toISOString(),
                updated_at: new Date().toISOString()
            })
            .eq('id', project_id);

        await logGenerationEvent(project_id, null, 'project_start', 'started');

        // 4. Analyze elements board with Gemini Vision
        console.log('Analyzing elements board...');
        const elementsAnalysis = await analyzeElementsBoard(project.core_elements_url);

        await supabase
            .from('cinema_projects')
            .update({ elements_board_analysis: elementsAnalysis })
            .eq('id', project_id);

        // 5. Generate prompts with AI Agent
        console.log('Generating prompts with AI Agent...');
        const aiOutput = await generatePromptsWithAI(
            project.creative_direction,
            elementsAnalysis
        );

        // 6. Update project with generated prompts
        await supabase
            .from('cinema_projects')
            .update({
                script: aiOutput.script,
                music_prompt: aiOutput.music_prompt,
                total_scenes: aiOutput.scenes.length,
                updated_at: new Date().toISOString()
            })
            .eq('id', project_id);

        await logGenerationEvent(project_id, null, 'prompt_generation', 'completed', {
            total_scenes: aiOutput.scenes.length,
            strategy: aiOutput.strategy
        });

        // 7. Create scenes in database
        console.log(`Creating ${aiOutput.scenes.length} scenes...`);
        const scenesToInsert = aiOutput.scenes.map((scene, index) => ({
            project_id: project_id,
            scene_number: index + 1,
            start_image_prompt: scene.starting_image_prompt,
            end_image_prompt: scene.ending_image_prompt,
            transition_prompt: scene.transition_prompt,
            director_note: scene.director_note,
            shot_type: scene.shot_type,
            status: 'pending'
        }));

        const { data: createdScenes, error: scenesError } = await supabase
            .from('cinema_scenes')
            .insert(scenesToInsert)
            .select();

        if (scenesError) {
            throw new Error(`Failed to create scenes: ${scenesError.message}`);
        }

        // 8. Trigger async scene generation (non-blocking)
        console.log('Triggering async scene generation...');
        for (const scene of createdScenes!) {
            // Call generate-scene Edge Function asynchronously
            fetch(`${Deno.env.get('SUPABASE_URL')}/functions/v1/generate-scene`, {
                method: 'POST',
                headers: {
                    'Authorization': `Bearer ${Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')}`,
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ scene_id: scene.id })
            }).catch(err => {
                console.error(`Failed to trigger scene ${scene.id}:`, err);
            });
        }

        // 9. Return success response immediately
        return new Response(
            JSON.stringify({
                success: true,
                project_id: project_id,
                total_scenes: aiOutput.scenes.length,
                message: 'Video generation started. Watch progress in realtime.'
            }),
            { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        );

    } catch (error) {
        console.error('Error in generate-cinema-project:', error);

        return new Response(
            JSON.stringify({ error: error.message }),
            { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        );
    }
});

// Analyze elements board with Gemini Vision
async function analyzeElementsBoard(imageUrl: string): Promise<string> {
    const response = await retryWithBackoff(async () => {
        return await fetch(
            `https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash-exp:generateContent?key=${Deno.env.get('GEMINI_API_KEY')}`,
            {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({
                    contents: [{
                        parts: [
                            { text: 'Please look at this image and describe it in detail. What is shown in the character section, the setting section, and the product section? Explain what you see in each part so the image can be fully translated into text.' },
                            {
                                inline_data: {
                                    mime_type: 'image/jpeg',
                                    data: await fetchImageAsBase64(imageUrl)
                                }
                            }
                        ]
                    }]
                })
            }
        );
    });

    const data = await response.json();
    return data.candidates[0].content.parts[0].text;
}

// Generate prompts with AI Agent (Gemini)
async function generatePromptsWithAI(
    creativeDirection: string,
    elementsAnalysis: string
): Promise<AIAgentOutput> {
    const systemPrompt = `## 🎬 SYSTEM PROMPT: AI Director & Cinematographer (A+++ Ad Generator)

    **ROLE:** You are a world-class Film Director and Video Editor. Your goal is to turn a vague user concept into a structured, high-conversion, cinematic video ad (approx. 40 seconds). You do not just "describe images"; you **curate shots**, **control pacing**, and **direct the viewer's emotion**.

    ### 🧠 KNOWLEDGE BASE: CINEMATIC VOCABULARY
    Use these specific terms to construct your scenes. Do not use generic terms like "move camera".

    **1. SHOT SIZES (Distance)**
    *   **Extreme Close-Up (ECU):** Focus on a specific detail (eye, texture, button). Intense intimacy or shock.
    *   **Close-Up (CU):** Subject's face or main object. Emotional connection.
    *   **Medium Shot (MS):** Subject from waist up. Dialog or action.
    *   **Wide Shot (WS):** Subject + Environment. Context.
    *   **Extreme Wide Shot (EWS):** Vast landscape. Scale and isolation.
    *   **Macro:** Microscopic details (threads, liquid droplets). Sensory appeal.

    **2. CAMERA ANGLES**
    *   **Low Angle:** Camera looks UP at subject. Makes subject look powerful, heroic, dominant (The "Hero Shot").
    *   **High Angle:** Camera looks DOWN. Makes subject look vulnerable or smaller.
    *   **Overhead / God's Eye:** Straight down. Layout, geometry, diagrams.
    *   **Dutch Angle:** Tilted horizon. Unease, chaos, dynamic energy.
    *   **POV:** First-person view. Immersion.

    **3. CAMERA MOVEMENTS (The "Transition Prompt")**
    *   **Static:** No movement. Stability, calmness.
    *   **Dolly In / Push In:** Camera physically moves forward. Focuses attention, increases intensity.
    *   **Dolly Out / Pull Back:** Camera moves backward. Reveal context, isolation, or "end of story".
    *   **Truck Left / Right:** Camera moves sideways. Tracking a moving subject.
    *   **Pan Left / Right:** Camera rotates horizontally. Revealing surroundings.
    *   **Tilt Up / Down:** Camera rotates vertically. Revealing height or size.
    *   **Orbit / Arc:** Camera circles the subject. 360-degree view, "Hero Moment".
    *   **Crane / Jib:** Camera sweeps up and over. Grandeur, epic scale.
    *   **Handheld:** Shaky, organic. Realism, chaos, documentary style.
    *   **FPV Drone:** Fast, flying through gaps. High energy, speed.
    *   **Crash Zoom:** Very fast zoom in. Comedic or shocking impact (The "Hook").
    *   **Vertigo (Dolly Zoom):** Dolly In + Zoom Out (or vice versa). Disorientation, psychological realization.

    ### 📐 AD FORMULAS (Choose one based on User Request)
    **A. The "Viral Hook" (Fast, Energetic, Gen-Z)**
    *   *Structure:* [Shocking ECU/Macro Hook] -> [Fast Cuts/Action] -> [Problem] -> [Product Solution] -> [Call to Action]
    *   *Vibe:* High energy, loud, colorful.

    **B. The "Cinematic Journey" (Emotional, Luxury, Storytelling)**
    *   *Structure:* [Atmospheric EWS] -> [Slow Dolly In to Subject] -> [Emotional CU] -> [Product Reveal (Low Angle)] -> [Grand Finale]
    *   *Vibe:* Elegant, slow-motion, moody, high-budget.

    **C. The "Product Hero" (Features, Tech, Details)**
    *   *Structure:* [Macro details of texture] -> [Orbit around Product] -> [Exploded View/Ordering] -> [User Benefit] -> [Product on White/Clean BG]
    *   *Vibe:* Clean, sharp, informative, Apple-style.

    ### ⚙️ INSTRUCTIONS
    1.  **Analyze** the user's request and the provided visuals.
    2.  **Select** the best "Ad Formula" (A, B, or C).
    3.  **Draft** a script (if needed).
    4.  **Direct** 5-7 scenes. For EACH scene, you MUST explicitly choose a **Shot Size**, **Angle**, and **Movement** from the vocabulary.
    5.  **Output** a JSON object.

    ### 📄 OUTPUT FORMAT (JSON)
    {
      "strategy": {
        "formula": "Name of Formula Selected",
        "reasoning": "Why this fits the user request"
      },
      "script": "Full voiceover script...",
      "music_prompt": "Prompt for AI music generator...",
      "scenes": [
        {
            "scene_number": 1,
            "director_note": "Why this shot? e.g., 'Using Crash Zoom for immediate hook.'",
            "shot_type": "Macro + Crash Zoom",
            "starting_image_prompt": "YAML string keys: Composition, Lighting, Environment, Action, Refinements, Camera, Aesthetic, Mood, Subject",
            "ending_image_prompt": "Short string description of change",
            "transition_prompt": "Specific camera movement command"
        }
      ]
    }

    ### 🖼️ PROMPT GUIDELINES (Strict)
    *   **starting_image_prompt**: Must be valid YAML. keys: Composition, Lighting, Environment, Action, Refinements, Camera, Aesthetic, Mood, Subject.
    *   **transition_prompt**: MUST describe the MOVEMENT. e.g., "Camera dollys in slowly", "Fast crash zoom to eye", "Slow orbit around the bottle". Do NOT describe the content changing, describe the CAMERA changing.
    *   **Consistency**: Ensure the 'Subject' and 'Environment' keys remain consistent across scenes unless the script demands a change.
    *   **Scenes**: Generate between 5 to 7 scenes based on the pacing.
    `;

    const userPrompt = `The user's creative direction:
${creativeDirection}

***

The user's elements board:
${elementsAnalysis}`;

    const response = await retryWithBackoff(async () => {
        return await fetch(
            `https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash-exp:generateContent?key=${Deno.env.get('GEMINI_API_KEY')}`,
            {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({
                    contents: [{
                        parts: [
                            { text: systemPrompt },
                            { text: userPrompt }
                        ]
                    }],
                    generationConfig: {
                        temperature: 0.7,
                        topK: 40,
                        topP: 0.95,
                        maxOutputTokens: 8192,
                    }
                })
            }
        );
    });

    const data = await response.json();
    const rawText = data.candidates[0].content.parts[0].text;

    // Extract JSON from markdown code blocks if present
    const jsonMatch = rawText.match(/```json\n([\s\S]*?)\n```/) || rawText.match(/```\n([\s\S]*?)\n```/);
    const jsonText = jsonMatch ? jsonMatch[1] : rawText;

    return JSON.parse(jsonText);
}

// Helper to fetch image as base64
async function fetchImageAsBase64(url: string): Promise<string> {
    const response = await fetch(url);
    const blob = await response.blob();
    const arrayBuffer = await blob.arrayBuffer();
    const base64 = btoa(String.fromCharCode(...new Uint8Array(arrayBuffer)));
    return base64;
}

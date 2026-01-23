// AI Cinema - Main Orchestrator Edge Function
// Validates input, generates prompts, creates scenes, triggers async processing

import { serve } from 'https://deno.land/std@0.168.0/http/server.ts';
import { createSupabaseClient, corsHeaders, logGenerationEvent, retryWithBackoff } from '../_shared/utils.ts';

interface RequestBody {
    project_id: string;
}

interface AIAgentOutput {
    script: string;
    music_prompt: string;
    scenes: Array<{
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
            total_scenes: aiOutput.scenes.length
        });

        // 7. Create scenes in database
        console.log(`Creating ${aiOutput.scenes.length} scenes...`);
        const scenesToInsert = aiOutput.scenes.map((scene, index) => ({
            project_id: project_id,
            scene_number: index + 1,
            start_image_prompt: scene.starting_image_prompt,
            end_image_prompt: scene.ending_image_prompt,
            transition_prompt: scene.transition_prompt,
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
    const systemPrompt = `## 🎬 SYSTEM PROMPT: 40-Second Ad Generator Agent

A – Ask:
  Generate one JSON package containing an ad script, a music prompt, and visually driven scenes based on a user query, brand, and any provided visual reference boards. 

The number of scenes you generate are based on the user's creative direction. If none are provided, do 5 scenes.

G – Guidance:
  role: Multimedia ad director and storyteller
  output_count: 1
  character_limit: Script should fit a 40-second read
  constraints:
    - Music, image, and transition prompts must include contextually relevant meta-token keywords when appropriate.
    - Each scene must contain:
      • scene - Scene Number followed by Title of Scene
      • starting_image_prompt (YAML format using structured ClearCam-style keys)
      • ending_image_prompt (short evolution of the starting image)
      • transition_prompt (short transition description based on both the starting and ending image)
    - Scene transitions must be cinematic, coherent, and descriptive while remaining concise.

    🎬 Guidelines for script:
      - If script is given by the user, USE THAT EXACTLY. No exceptions.
      - The script should be one continuous text.
      - This is spoken by the character, so have the dialogue be based on the character.
      - No labels, no formatting — just the script.
      - Use "..." to indicate pauses.
      - No double quotes inside the script text.
      - Don't use "—", use "..." in their place

    🎵 Guidelines for music prompt:
      - Must be fewer than 450 characters.
      - Should match the emotional arc and visual tone of the scenes.
      - Summarize and distill the user's music description into a single high-quality generative prompt.

    🧱 Global visual consistency:
      - Derive a base visual language (lighting, mood, and aesthetic) from the creative direction and any elements board.
      - Keep Lighting, Mood, and Aesthetic consistent across all scenes unless the user explicitly specifies a change.

    🖼️ Guideline for starting_image_prompt:
      - Must be in YAML format using these keys:
        Composition: describe how the frame is arranged and where the subject sits in the shot
        Lighting: explain the light source and how it shapes shadows and contrast
        Environment: note the setting and the main objects that define the space
        Action: state what the subject is doing in clear simple terms
        Refinements: list small details with meta tokens like skin texture, fabric folds, grain, glare, etc.
        Camera: name the camera type, the lens, the focus distance, and the shooting distance
        Aesthetic: describe the style or visual feel
        Mood: give the emotional tone of the scene
        Subject: describe who or what the image is centered around
      - Keep each field brief: 1–2 short sentences or a tight phrase per key.
      - Keep the overall starting_image_prompt compact (aim for no more than 8–10 lines of YAML).
      - For Aesthetic (by default, unless the user specifies otherwise), prioritize:
        photorealistic, cinematic, feature film still, live action still
      - For Refinements, use comma-separated meta-token tags in this style:
        ultra_fine_skin_texture, subtle_makeup_sheen, iris_detail_8k, micro_reflections_of_glass_pillars, soft_film_grain, gentle_lens_glare, [cinematic], [macro]
      - For Camera, prioritize technical phrasing such as:
        35mm wide-angle, deep depth of field, steady tracking
      - Ensure that Lighting, Aesthetic, and Mood remain aligned with the global visual language across all scenes.

    🎯 Guideline for ending_image_prompt:
      - Assume it will be applied to the starting image.
      - Write it as a short description (1–2 concise sentences) of how the starting image changes
      - Keep it concise and focused on the most important visual change.

    🎞️ Guideline for transition_prompt:
      - Write it with the assumption that both starting and ending images are known.
      - Keep it very short and clear (1–2 concise sentences).
      - Prioritize what the character does between starting and ending frames.
      - If the camera moves, explicitly state that it moves slowly (e.g. camera rotates slowly, camera zooms out slowly).
      - Prioritize describing camera motion IF it is relevant, and default to SLOW movement (e.g. camera moves slowly, camera dollies in slowly, camera tilts slowly).
      - Avoid extra exposition; focus on the motion and continuity of the shot.

E – Example and N – Notation:
  format: JSON
  You must return ONLY valid JSON, no markdown formatting.`;

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

// AI Cinema - Scene Generation Edge Function
// Generates start/end images and video for a single scene

import { serve } from 'https://deno.land/std@0.168.0/http/server.ts';
import { createSupabaseClient, corsHeaders, logGenerationEvent, retryWithBackoff, uploadToStorage } from '../_shared/utils.ts';

interface RequestBody {
    scene_id: string;
}

serve(async (req) => {
    if (req.method === 'OPTIONS') {
        return new Response('ok', { headers: corsHeaders });
    }

    try {
        const { scene_id } = await req.json() as RequestBody;

        if (!scene_id) {
            return new Response(
                JSON.stringify({ error: 'Missing scene_id' }),
                { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
            );
        }

        const supabase = createSupabaseClient();

        // 1. Fetch scene from database
        const { data: scene, error: sceneError } = await supabase
            .from('cinema_scenes')
            .select('*, cinema_projects!inner(*)')
            .eq('id', scene_id)
            .single();

        if (sceneError || !scene) {
            return new Response(
                JSON.stringify({ error: 'Scene not found' }),
                { status: 404, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
            );
        }

        const project = scene.cinema_projects;

        // 2. Update scene status to processing
        await supabase
            .from('cinema_scenes')
            .update({
                status: 'processing',
                processing_started_at: new Date().toISOString()
            })
            .eq('id', scene_id);

        await logGenerationEvent(project.id, scene_id, 'scene_start', 'started', {
            scene_number: scene.scene_number
        });

        // 3. Generate Start Image
        console.log(`Generating start image for scene ${scene.scene_number}...`);
        const startImageUrl = await generateImage(
            scene.start_image_prompt,
            [project.core_image_url, project.core_elements_url]
        );

        // Upload to Supabase Storage
        const startImageStoragePath = `projects/${project.id}/scene-${scene.scene_number}-start.png`;
        const startImagePublicUrl = await uploadToStorage(
            'cinema-images',
            startImageStoragePath,
            startImageUrl
        );

        await supabase
            .from('cinema_scenes')
            .update({ start_image_url: startImagePublicUrl })
            .eq('id', scene_id);

        await logGenerationEvent(project.id, scene_id, 'start_image_generation', 'completed');

        // 4. Generate End Image (using start image as base)
        console.log(`Generating end image for scene ${scene.scene_number}...`);
        const endImageUrl = await generateImage(
            scene.end_image_prompt,
            [startImageUrl]
        );

        // Upload to Supabase Storage
        const endImageStoragePath = `projects/${project.id}/scene-${scene.scene_number}-end.png`;
        const endImagePublicUrl = await uploadToStorage(
            'cinema-images',
            endImageStoragePath,
            endImageUrl
        );

        await supabase
            .from('cinema_scenes')
            .update({ end_image_url: endImagePublicUrl })
            .eq('id', scene_id);

        await logGenerationEvent(project.id, scene_id, 'end_image_generation', 'completed');

        // 5. Generate Video
        console.log(`Generating video for scene ${scene.scene_number}...`);
        const videoTaskId = await createVideoGeneration(
            startImagePublicUrl,
            endImagePublicUrl,
            scene.transition_prompt
        );

        await supabase
            .from('cinema_scenes')
            .update({ video_generation_id: videoTaskId })
            .eq('id', scene_id);

        // 6. Poll video status
        const videoUrl = await pollVideoStatus(videoTaskId, scene_id);

        // Upload to Supabase Storage
        const videoStoragePath = `projects/${project.id}/scene-${scene.scene_number}.mp4`;
        const videoPublicUrl = await uploadToStorage(
            'cinema-videos',
            videoStoragePath,
            videoUrl
        );

        // 7. Update scene to done
        await supabase
            .from('cinema_scenes')
            .update({
                video_url: videoPublicUrl,
                status: 'done',
                processing_completed_at: new Date().toISOString()
            })
            .eq('id', scene_id);

        await logGenerationEvent(project.id, scene_id, 'video_generation', 'completed');

        // 8. Increment completed_scenes counter
        await supabase.rpc('increment_completed_scenes', { p_project_id: project.id });

        // 9. Check if all scenes are done
        const { data: allDone } = await supabase.rpc('check_all_scenes_completed', {
            p_project_id: project.id
        });

        if (allDone) {
            console.log('All scenes completed, triggering finalize-project...');
            // Trigger finalize-project Edge Function
            fetch(`${Deno.env.get('SUPABASE_URL')}/functions/v1/finalize-project`, {
                method: 'POST',
                headers: {
                    'Authorization': `Bearer ${Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')}`,
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ project_id: project.id })
            }).catch(err => {
                console.error('Failed to trigger finalize-project:', err);
            });
        }

        return new Response(
            JSON.stringify({
                success: true,
                scene_id: scene_id,
                scene_number: scene.scene_number,
                video_url: videoPublicUrl
            }),
            { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        );

    } catch (error) {
        console.error('Error in generate-scene:', error);

        // Update scene with error
        const { scene_id } = await req.json() as RequestBody;
        if (scene_id) {
            const supabase = createSupabaseClient();
            await supabase
                .from('cinema_scenes')
                .update({
                    status: 'error',
                    error_message: error.message
                })
                .eq('id', scene_id);

            // Get project_id for logging
            const { data: scene } = await supabase
                .from('cinema_scenes')
                .select('project_id')
                .eq('id', scene_id)
                .single();

            if (scene) {
                await logGenerationEvent(scene.project_id, scene_id, 'scene_generation', 'failed', {}, error.message);
            }
        }

        return new Response(
            JSON.stringify({ error: error.message }),
            { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        );
    }
});

// Generate image with WaveSpeed Banana API
async function generateImage(prompt: string, baseImages: string[]): Promise<string> {
    const response = await retryWithBackoff(async () => {
        return await fetch('https://api.wavespeed.ai/api/v3/google/nano-banana-pro/edit', {
            method: 'POST',
            headers: {
                'x-rapidapi-key': Deno.env.get('RAPIDAPI_KEY')!,
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                aspect_ratio: '16:9',
                enable_base64_output: false,
                enable_sync_mode: true,
                output_format: 'png',
                prompt: prompt,
                resolution: '2k',
                images: baseImages
            })
        });
    });

    if (!response.ok) {
        throw new Error(`Image generation failed: ${response.statusText}`);
    }

    const data = await response.json();

    // Wait 2 seconds for rate limiting (batching)
    await new Promise(resolve => setTimeout(resolve, 2000));

    return data.data.outputs[0];
}

// Create video generation with Kie.ai Veo API
async function createVideoGeneration(
    startImageUrl: string,
    endImageUrl: string,
    transitionPrompt: string
): Promise<string> {
    const response = await retryWithBackoff(async () => {
        return await fetch('https://api.kie.ai/api/v1/veo/generate', {
            method: 'POST',
            headers: {
                'x-rapidapi-key': Deno.env.get('RAPIDAPI_KEY')!,
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                prompt: transitionPrompt,
                model: 'veo3_fast',
                aspectRatio: '16:9',
                enableTranslation: false,
                generationType: 'FIRST_AND_LAST_FRAMES_2_VIDEO',
                imageUrls: [startImageUrl, endImageUrl]
            })
        });
    });

    if (!response.ok) {
        throw new Error(`Video generation failed: ${response.statusText}`);
    }

    const data = await response.json();
    return data.data.taskId;
}

// Poll video status with retry logic
async function pollVideoStatus(taskId: string, sceneId: string): Promise<string> {
    const maxAttempts = 20;
    const pollInterval = 15000; // 15 seconds
    const supabase = createSupabaseClient();

    for (let attempt = 0; attempt < maxAttempts; attempt++) {
        // Update poll_attempts in database
        await supabase
            .from('cinema_scenes')
            .update({ poll_attempts: attempt + 1 })
            .eq('id', sceneId);

        const response = await fetch(
            `https://api.kie.ai/api/v1/veo/record-info?taskId=${taskId}`,
            {
                headers: {
                    'x-rapidapi-key': Deno.env.get('RAPIDAPI_KEY')!
                }
            }
        );

        if (!response.ok) {
            console.warn(`Poll attempt ${attempt + 1} failed: ${response.statusText}`);
            await new Promise(resolve => setTimeout(resolve, pollInterval));
            continue;
        }

        const data = await response.json();

        // successFlag: 1 = done, 0 = processing
        if (data.data.successFlag === 1) {
            return data.data.response.resultUrls[0];
        }

        if (data.data.successFlag === 0) {
            // Still processing
            console.log(`Video still processing (attempt ${attempt + 1}/${maxAttempts})...`);
            await new Promise(resolve => setTimeout(resolve, pollInterval));
            continue;
        }

        // Unknown status
        throw new Error(`Unexpected video status: ${JSON.stringify(data)}`);
    }

    throw new Error('Video generation timeout after 5 minutes');
}

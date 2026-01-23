// AI Cinema - Finalize Project Edge Function
// Generates music and voiceover, finalizes project

import { serve } from 'https://deno.land/std@0.168.0/http/server.ts';
import { createSupabaseClient, corsHeaders, logGenerationEvent, retryWithBackoff, uploadToStorage } from '../_shared/utils.ts';

interface RequestBody {
    project_id: string;
}

serve(async (req) => {
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

        await logGenerationEvent(project_id, null, 'finalize_start', 'started');

        // 2. Generate music and voice in parallel
        console.log('Generating music and voiceover in parallel...');
        const [musicUrl, voiceUrl] = await Promise.all([
            generateMusic(project.music_prompt),
            generateVoice(project.script, project.voice_id || 'EXAVITQu4vr4xnSDxMaL')
        ]);

        // 3. Upload audio files to Supabase Storage
        const musicStoragePath = `projects/${project_id}/music.mp3`;
        const voiceStoragePath = `projects/${project_id}/voiceover.mp3`;

        const [musicPublicUrl, voicePublicUrl] = await Promise.all([
            uploadToStorage('cinema-audio', musicStoragePath, musicUrl),
            uploadToStorage('cinema-audio', voiceStoragePath, voiceUrl)
        ]);

        // 4. Update project with audio URLs and mark as completed
        await supabase
            .from('cinema_projects')
            .update({
                music_url: musicPublicUrl,
                voice_url: voicePublicUrl,
                status: 'completed',
                generation_completed_at: new Date().toISOString(),
                updated_at: new Date().toISOString()
            })
            .eq('id', project_id);

        await logGenerationEvent(project_id, null, 'finalize_complete', 'completed', {
            music_url: musicPublicUrl,
            voice_url: voicePublicUrl
        });

        console.log(`Project ${project_id} completed successfully!`);

        return new Response(
            JSON.stringify({
                success: true,
                project_id: project_id,
                music_url: musicPublicUrl,
                voice_url: voicePublicUrl,
                status: 'completed'
            }),
            { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        );

    } catch (error) {
        console.error('Error in finalize-project:', error);

        // Update project with error
        const { project_id } = await req.json() as RequestBody;
        if (project_id) {
            const supabase = createSupabaseClient();
            await supabase
                .from('cinema_projects')
                .update({
                    status: 'error',
                    error_message: error.message
                })
                .eq('id', project_id);

            await logGenerationEvent(project_id, null, 'finalize_project', 'failed', {}, error.message);
        }

        return new Response(
            JSON.stringify({ error: error.message }),
            { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        );
    }
});

// Generate music with Kie.ai Suno API
async function generateMusic(prompt: string): Promise<string> {
    // 1. Create generation
    const createResponse = await retryWithBackoff(async () => {
        return await fetch('https://api.kie.ai/api/v1/generate', {
            method: 'POST',
            headers: {
                'x-rapidapi-key': Deno.env.get('RAPIDAPI_KEY')!,
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                model: 'V5',
                customMode: false,
                instrumental: true,
                prompt: prompt
            })
        });
    });

    if (!createResponse.ok) {
        throw new Error(`Music generation failed: ${createResponse.statusText}`);
    }

    const createData = await createResponse.json();
    const taskId = createData.data.taskId;

    // 2. Poll status
    return await pollMusicStatus(taskId);
}

// Poll music generation status
async function pollMusicStatus(taskId: string): Promise<string> {
    const maxAttempts = 20;
    const pollInterval = 15000; // 15 seconds

    for (let attempt = 0; attempt < maxAttempts; attempt++) {
        const response = await fetch(
            `https://api.kie.ai/api/v1/generate/record-info?taskId=${taskId}`,
            {
                headers: {
                    'x-rapidapi-key': Deno.env.get('RAPIDAPI_KEY')!
                }
            }
        );

        if (!response.ok) {
            console.warn(`Music poll attempt ${attempt + 1} failed: ${response.statusText}`);
            await new Promise(resolve => setTimeout(resolve, pollInterval));
            continue;
        }

        const data = await response.json();

        // Check if completed
        if (data.data.status === 'SUCCESS') {
            // Return first audio URL
            return data.data.response.sunoData[0].audioUrl;
        }

        if (data.data.status.includes('ING')) {
            // Still processing
            console.log(`Music still processing (attempt ${attempt + 1}/${maxAttempts})...`);
            await new Promise(resolve => setTimeout(resolve, pollInterval));
            continue;
        }

        // Unknown status
        throw new Error(`Unexpected music status: ${data.data.status}`);
    }

    throw new Error('Music generation timeout after 5 minutes');
}

// Generate voiceover with WaveSpeed ElevenLabs API
async function generateVoice(script: string, voiceId: string): Promise<string> {
    const createResponse = await retryWithBackoff(async () => {
        return await fetch('https://api.wavespeed.ai/api/v3/elevenlabs/turbo-v2.5', {
            method: 'POST',
            headers: {
                'x-rapidapi-key': Deno.env.get('RAPIDAPI_KEY')!,
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                similarity: 1,
                stability: 0.5,
                text: script,
                use_speaker_boost: true,
                voice_id: voiceId
            })
        });
    });

    if (!createResponse.ok) {
        throw new Error(`Voice generation failed: ${createResponse.statusText}`);
    }

    const createData = await createResponse.json();

    // Check if sync response with direct URL
    if (createData.data.outputs && createData.data.outputs[0]) {
        return createData.data.outputs[0];
    }

    // If async, poll the get URL
    if (createData.data.urls?.get) {
        return await pollVoiceStatus(createData.data.urls.get);
    }

    throw new Error('Unexpected voice generation response format');
}

// Poll voice generation status
async function pollVoiceStatus(pollUrl: string): Promise<string> {
    const maxAttempts = 20;
    const pollInterval = 5000; // 5 seconds (voice is usually faster)

    for (let attempt = 0; attempt < maxAttempts; attempt++) {
        const response = await fetch(pollUrl, {
            headers: {
                'x-rapidapi-key': Deno.env.get('RAPIDAPI_KEY')!
            }
        });

        if (!response.ok) {
            console.warn(`Voice poll attempt ${attempt + 1} failed: ${response.statusText}`);
            await new Promise(resolve => setTimeout(resolve, pollInterval));
            continue;
        }

        const data = await response.json();

        // Check if completed
        if (data.data.status === 'completed') {
            return data.data.outputs[0];
        }

        if (data.data.status === 'processing') {
            console.log(`Voice still processing (attempt ${attempt + 1}/${maxAttempts})...`);
            await new Promise(resolve => setTimeout(resolve, pollInterval));
            continue;
        }

        // Unknown status
        throw new Error(`Unexpected voice status: ${data.data.status}`);
    }

    throw new Error('Voice generation timeout after 100 seconds');
}

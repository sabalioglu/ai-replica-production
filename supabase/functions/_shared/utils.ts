// Shared utilities for AI Cinema Edge Functions
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2';

export interface Project {
    id: string;
    user_id: string;
    name: string;
    script: string | null;
    music_prompt: string | null;
    status: string;
    final_video_url: string | null;
    created_at: string;
    updated_at: string;
    elements_board_analysis: string | null;
    music_url: string | null;
    voice_url: string | null;
    generation_started_at: string | null;
    generation_completed_at: string | null;
    total_scenes: number;
    completed_scenes: number;
    error_message: string | null;
    retry_count: number;
}

export interface Scene {
    id: string;
    project_id: string;
    scene_number: number;
    start_image_prompt: string | null;
    end_image_prompt: string | null;
    transition_prompt: string | null;
    start_image_url: string | null;
    end_image_url: string | null;
    video_url: string | null;
    status: string;
    error_message: string | null;
    created_at: string;
    start_image_generation_id: string | null;
    end_image_generation_id: string | null;
    video_generation_id: string | null;
    poll_attempts: number;
    max_poll_attempts: number;
    processing_started_at: string | null;
    processing_completed_at: string | null;
}

// Initialize Supabase client with service role
export function createSupabaseClient() {
    return createClient(
        Deno.env.get('SUPABASE_URL')!,
        Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!
    );
}

// Retry with exponential backoff
export async function retryWithBackoff<T>(
    fn: () => Promise<T>,
    maxRetries = 3,
    baseDelay = 1000
): Promise<T> {
    for (let i = 0; i < maxRetries; i++) {
        try {
            return await fn();
        } catch (error) {
            if (i === maxRetries - 1) throw error;
            const delay = baseDelay * Math.pow(2, i);
            await new Promise(resolve => setTimeout(resolve, delay));
        }
    }
    throw new Error('Max retries exceeded');
}

// Log generation event
export async function logGenerationEvent(
    projectId: string,
    sceneId: string | null,
    stage: string,
    status: 'started' | 'completed' | 'failed',
    details?: Record<string, unknown>,
    errorMessage?: string
) {
    const supabase = createSupabaseClient();

    const { error } = await supabase.from('cinema_generation_logs').insert({
        project_id: projectId,
        scene_id: sceneId,
        stage,
        status,
        details: details || null,
        error_message: errorMessage || null
    });

    if (error) {
        console.error('Failed to log generation event:', error);
    }
}

// Upload file to Supabase Storage
export async function uploadToStorage(
    bucket: string,
    path: string,
    fileUrl: string
): Promise<string> {
    const supabase = createSupabaseClient();

    // Download file from external URL
    const response = await fetch(fileUrl);
    if (!response.ok) {
        throw new Error(`Failed to download file: ${response.statusText}`);
    }

    const blob = await response.blob();

    // Upload to Supabase Storage
    const { data, error } = await supabase.storage
        .from(bucket)
        .upload(path, blob, {
            contentType: blob.type,
            upsert: true
        });

    if (error) throw error;

    // Get public URL
    const { data: { publicUrl } } = supabase.storage
        .from(bucket)
        .getPublicUrl(data.path);

    return publicUrl;
}

// CORS headers for responses
export const corsHeaders = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
};

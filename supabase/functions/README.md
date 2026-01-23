# AI Cinema - Edge Functions Deployment Guide

## Overview

This directory contains three Supabase Edge Functions for automated AI Cinema video generation:

1. **generate-cinema-project** - Main orchestrator
2. **generate-scene** - Per-scene image + video generation
3. **finalize-project** - Music + voiceover generation

## Prerequisites

- Supabase CLI installed (`npm install -g supabase`)
- Supabase project created
- API keys for external services

## Setup

### 1. Run Database Migration

```bash
# Navigate to project root
cd /Users/sabalioglu/Desktop/KEMIK/ai-replica

# Apply migration
supabase db push
```

### 2. Create Storage Buckets

```sql
-- Run in Supabase SQL Editor
INSERT INTO storage.buckets (id, name, public) VALUES
  ('cinema-images', 'cinema-images', true),
  ('cinema-videos', 'cinema-videos', true),
  ('cinema-audio', 'cinema-audio', true);
```

### 3. Set Environment Secrets

```bash
# Set secrets for Edge Functions
supabase secrets set RAPIDAPI_KEY=your_rapidapi_key_here
supabase secrets set GEMINI_API_KEY=your_gemini_api_key_here
supabase secrets set SUPABASE_URL=https://yiwezubimkzkqxzbfodn.supabase.co
supabase secrets set SUPABASE_SERVICE_ROLE_KEY=your_service_role_key_here

# Verify secrets
supabase secrets list
```

### 4. Deploy Edge Functions

```bash
# Deploy all functions
supabase functions deploy generate-cinema-project
supabase functions deploy generate-scene
supabase functions deploy finalize-project

# Or deploy all at once
supabase functions deploy
```

## API Keys Required

### RapidAPI (for WaveSpeed + Kie.ai)
- Sign up at https://rapidapi.com
- Subscribe to:
  - WaveSpeed AI (Banana + ElevenLabs)
  - Kie.ai (Veo + Suno)
- Get your RapidAPI key from dashboard

### Google Gemini
- Go to https://aistudio.google.com/app/apikey
- Create API key
- Enable Gemini API

## Testing

### Test Main Orchestrator

```bash
curl -X POST \
  https://yiwezubimkzkqxzbfodn.supabase.co/functions/v1/generate-cinema-project \
  -H "Authorization: Bearer YOUR_ANON_KEY" \
  -H "Content-Type: application/json" \
  -d '{"project_id": "your-project-uuid"}'
```

### Monitor Logs

```bash
# View logs for a specific function
supabase functions logs generate-cinema-project

# Follow logs in real-time
supabase functions logs generate-cinema-project --follow
```

## Architecture

```
Frontend → generate-cinema-project
              ↓
         [Async] generate-scene (per scene)
              ↓
         [Auto] finalize-project (when all scenes done)
```

## Workflow

1. User clicks "Generate" in frontend
2. `generate-cinema-project` validates, analyzes elements board, generates prompts
3. Creates scenes in database
4. Triggers `generate-scene` for each scene (async, non-blocking)
5. Each scene generates start/end images, then video
6. When all scenes complete, `finalize-project` auto-triggers
7. Generates music + voiceover in parallel
8. Project status → `completed`

## Monitoring

### Database Logs

```sql
-- View generation logs
SELECT * FROM cinema_generation_logs
WHERE project_id = 'your-project-id'
ORDER BY created_at DESC;

-- Check scene status
SELECT scene_number, status, error_message
FROM cinema_scenes
WHERE project_id = 'your-project-id'
ORDER BY scene_number;
```

### Realtime Subscription (Frontend)

```typescript
const channel = supabase
  .channel('project-updates')
  .on('postgres_changes', {
    event: 'UPDATE',
    schema: 'public',
    table: 'cinema_projects',
    filter: `id=eq.${projectId}`
  }, (payload) => {
    console.log('Project updated:', payload.new);
  })
  .subscribe();
```

## Troubleshooting

### Edge Function Errors

```bash
# Check function logs
supabase functions logs generate-scene --limit 50

# Test locally
supabase functions serve generate-scene
```

### API Rate Limits

- WaveSpeed Banana: 1 request per 2 seconds (built-in delay)
- Kie.ai Veo: Polling every 15 seconds
- Kie.ai Suno: Polling every 15 seconds
- ElevenLabs: Polling every 5 seconds

### Common Issues

**Issue:** "Image generation failed"
- Check RAPIDAPI_KEY is set correctly
- Verify RapidAPI subscription is active
- Check rate limits

**Issue:** "Video timeout after 5 minutes"
- Veo generation can take 3-5 minutes
- Check Kie.ai API status
- Increase max_poll_attempts if needed

**Issue:** "Scene stuck in processing"
- Check `cinema_generation_logs` for errors
- Manually update scene status if needed:
  ```sql
  UPDATE cinema_scenes SET status = 'error' WHERE id = 'scene-id';
  ```

## Cost Estimation

Per project (5 scenes):
- Gemini Vision: $0.001
- WaveSpeed Banana: $0.40 (10 images)
- Kie.ai Veo: $1.25 (5 videos)
- Kie.ai Suno: $0.10 (1 music)
- ElevenLabs: $0.05 (1 voice)
- **Total: ~$1.81**

## Next Steps

- [ ] Set up Supabase Storage buckets
- [ ] Configure environment secrets
- [ ] Deploy Edge Functions
- [ ] Test end-to-end flow
- [ ] Update frontend to call Edge Function

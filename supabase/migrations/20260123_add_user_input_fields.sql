-- AI Cinema - Add User Input Fields to cinema_projects
-- Run this BEFORE the automation schema migration

ALTER TABLE cinema_projects ADD COLUMN IF NOT EXISTS
  creative_direction TEXT,
  core_image_url TEXT,
  core_elements_url TEXT,
  voice_id TEXT DEFAULT 'EXAVITQu4vr4xnSDxMaL';

-- Make script and music_prompt nullable (AI will generate these)
ALTER TABLE cinema_projects 
  ALTER COLUMN script DROP NOT NULL,
  ALTER COLUMN music_prompt DROP NOT NULL;

COMMENT ON COLUMN cinema_projects.creative_direction IS 'User-provided detailed description of the video concept';
COMMENT ON COLUMN cinema_projects.core_image_url IS 'Main product/brand image URL (uploaded to Supabase Storage)';
COMMENT ON COLUMN cinema_projects.core_elements_url IS 'Mood board image URL with Character/Setting/Product sections';
COMMENT ON COLUMN cinema_projects.voice_id IS 'ElevenLabs voice ID for voiceover generation';

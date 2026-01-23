-- AI Cinema Automation - Database Schema Enhancements
-- Migration: Add fields for automated video generation workflow

-- ============================================================================
-- 1. Update cinema_projects table
-- ============================================================================

ALTER TABLE cinema_projects ADD COLUMN IF NOT EXISTS
  -- User Input fields (REQUIRED)
  creative_direction TEXT,
  core_image_url TEXT,
  core_elements_url TEXT,
  voice_id TEXT DEFAULT 'EXAVITQu4vr4xnSDxMaL',
  
  -- AI Generation fields
  elements_board_analysis TEXT,
  music_url TEXT,
  voice_url TEXT,
  
  -- Tracking fields
  generation_started_at TIMESTAMPTZ,
  generation_completed_at TIMESTAMPTZ,
  total_scenes INTEGER DEFAULT 0,
  completed_scenes INTEGER DEFAULT 0,
  
  -- Error handling
  error_message TEXT,
  retry_count INTEGER DEFAULT 0;

-- Add index for status queries
CREATE INDEX IF NOT EXISTS idx_cinema_projects_status 
  ON cinema_projects(status) 
  WHERE status IN ('generating', 'processing');

-- ============================================================================
-- 2. Update cinema_scenes table
-- ============================================================================

ALTER TABLE cinema_scenes ADD COLUMN IF NOT EXISTS
  -- API tracking
  start_image_generation_id TEXT,
  end_image_generation_id TEXT,
  video_generation_id TEXT,
  
  -- Polling
  poll_attempts INTEGER DEFAULT 0,
  max_poll_attempts INTEGER DEFAULT 20,
  
  -- Timestamps
  processing_started_at TIMESTAMPTZ,
  processing_completed_at TIMESTAMPTZ;

-- Add indexes for efficient queries
CREATE INDEX IF NOT EXISTS idx_cinema_scenes_project_status 
  ON cinema_scenes(project_id, status);

CREATE INDEX IF NOT EXISTS idx_cinema_scenes_processing 
  ON cinema_scenes(status) 
  WHERE status = 'processing';

-- ============================================================================
-- 3. Create cinema_generation_logs table (for debugging)
-- ============================================================================

CREATE TABLE IF NOT EXISTS cinema_generation_logs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  project_id UUID REFERENCES cinema_projects(id) ON DELETE CASCADE,
  scene_id UUID REFERENCES cinema_scenes(id) ON DELETE CASCADE,
  stage TEXT NOT NULL, -- 'prompt_generation', 'image_generation', 'video_generation', etc.
  status TEXT NOT NULL, -- 'started', 'completed', 'failed'
  details JSONB,
  error_message TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Indexes for log queries
CREATE INDEX IF NOT EXISTS idx_generation_logs_project 
  ON cinema_generation_logs(project_id);

CREATE INDEX IF NOT EXISTS idx_generation_logs_scene 
  ON cinema_generation_logs(scene_id);

CREATE INDEX IF NOT EXISTS idx_generation_logs_stage_status 
  ON cinema_generation_logs(stage, status);

-- ============================================================================
-- 4. Helper Functions
-- ============================================================================

-- Function to increment completed_scenes counter
CREATE OR REPLACE FUNCTION increment_completed_scenes(p_project_id UUID)
RETURNS VOID AS $$
BEGIN
  UPDATE cinema_projects
  SET 
    completed_scenes = completed_scenes + 1,
    updated_at = NOW()
  WHERE id = p_project_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Function to check if all scenes are completed
CREATE OR REPLACE FUNCTION check_all_scenes_completed(p_project_id UUID)
RETURNS BOOLEAN AS $$
DECLARE
  v_total INTEGER;
  v_completed INTEGER;
BEGIN
  SELECT total_scenes, completed_scenes
  INTO v_total, v_completed
  FROM cinema_projects
  WHERE id = p_project_id;
  
  RETURN v_total > 0 AND v_completed >= v_total;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Function to log generation events
CREATE OR REPLACE FUNCTION log_generation_event(
  p_project_id UUID,
  p_scene_id UUID,
  p_stage TEXT,
  p_status TEXT,
  p_details JSONB DEFAULT NULL,
  p_error_message TEXT DEFAULT NULL
)
RETURNS UUID AS $$
DECLARE
  v_log_id UUID;
BEGIN
  INSERT INTO cinema_generation_logs (
    project_id,
    scene_id,
    stage,
    status,
    details,
    error_message
  ) VALUES (
    p_project_id,
    p_scene_id,
    p_stage,
    p_status,
    p_details,
    p_error_message
  )
  RETURNING id INTO v_log_id;
  
  RETURN v_log_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- ============================================================================
-- 5. RLS Policies for new table
-- ============================================================================

-- Enable RLS on cinema_generation_logs
ALTER TABLE cinema_generation_logs ENABLE ROW LEVEL SECURITY;

-- Users can view their own generation logs
CREATE POLICY "Users can view their own generation logs"
ON cinema_generation_logs FOR SELECT
USING (
  EXISTS (
    SELECT 1 FROM cinema_projects
    WHERE cinema_projects.id = cinema_generation_logs.project_id
    AND cinema_projects.user_id = auth.uid()
  )
);

-- Service role can insert logs (Edge Functions)
CREATE POLICY "Service role can insert generation logs"
ON cinema_generation_logs FOR INSERT
WITH CHECK (true);

-- ============================================================================
-- 6. Grant permissions to service role
-- ============================================================================

-- Ensure service role can execute helper functions
GRANT EXECUTE ON FUNCTION increment_completed_scenes(UUID) TO service_role;
GRANT EXECUTE ON FUNCTION check_all_scenes_completed(UUID) TO service_role;
GRANT EXECUTE ON FUNCTION log_generation_event(UUID, UUID, TEXT, TEXT, JSONB, TEXT) TO service_role;

-- ============================================================================
-- Migration complete
-- ============================================================================

COMMENT ON TABLE cinema_generation_logs IS 'Logs for AI Cinema video generation workflow - used for debugging and monitoring';
COMMENT ON FUNCTION increment_completed_scenes IS 'Increments completed_scenes counter for a project';
COMMENT ON FUNCTION check
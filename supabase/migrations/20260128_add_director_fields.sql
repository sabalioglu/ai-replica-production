-- Add Director Mode fields to cinema_scenes table
ALTER TABLE cinema_scenes ADD COLUMN IF NOT EXISTS
  director_note TEXT,
  shot_type TEXT;

COMMENT ON COLUMN cinema_scenes.director_note IS 'Explanation of why the AI Director chose this shot';
COMMENT ON COLUMN cinema_scenes.shot_type IS 'The specific cinematic shot type selected (e.g. Dolly Zoom, Low Angle)';

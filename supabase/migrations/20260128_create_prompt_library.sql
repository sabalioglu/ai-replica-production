-- Create cinematic_prompts table to store the library of high-quality prompts
CREATE TABLE IF NOT EXISTS cinematic_prompts (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  title TEXT NOT NULL,
  description TEXT,
  prompt_text TEXT NOT NULL,
  category TEXT,
  tags TEXT[],
  image_urls TEXT[],
  metadata JSONB DEFAULT '{}'::jsonb,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Enable RLS
ALTER TABLE cinematic_prompts ENABLE ROW LEVEL SECURITY;

-- Allow read access to authenticated users
CREATE POLICY "Allow public read access" ON cinematic_prompts
  FOR SELECT USING (auth.role() = 'authenticated');

-- Create embedding index for semantic search (optional, if we want vector search later)
-- CREATE EXTENSION IF NOT EXISTS vector;
-- ALTER TABLE cinematic_prompts ADD COLUMN embedding vector(1536);

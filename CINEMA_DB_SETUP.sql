-- AI Cinema Isolated Economy Setup
-- Creates tables separate from 'ugc-factory' billing
-- Run this in Supabase SQL Editor

-- 1. Create Cinema Plans Table
CREATE TABLE IF NOT EXISTS cinema_plans (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  price numeric NOT NULL,
  credits_included integer NOT NULL,
  features jsonb DEFAULT '{}'::jsonb,
  created_at timestamptz DEFAULT now()
);

-- 2. Create Cinema User Credits Table
-- Links to auth.users (Shared Auth) but tracks balance separately
CREATE TABLE IF NOT EXISTS cinema_user_credits (
  user_id uuid PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  balance integer DEFAULT 0,
  updated_at timestamptz DEFAULT now()
);

-- 3. Create Cinema Transactions Table
CREATE TABLE IF NOT EXISTS cinema_transactions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES auth.users(id) ON DELETE CASCADE,
  amount numeric NOT NULL, -- Price paid
  credits_added integer NOT NULL,
  plan_id uuid REFERENCES cinema_plans(id),
  status text DEFAULT 'completed',
  created_at timestamptz DEFAULT now()
);

-- 4. Enable RLS
ALTER TABLE cinema_plans ENABLE ROW LEVEL SECURITY;
ALTER TABLE cinema_user_credits ENABLE ROW LEVEL SECURITY;
ALTER TABLE cinema_transactions ENABLE ROW LEVEL SECURITY;

-- 5. Policies (Simple)

-- Public read for plans
CREATE POLICY "Public read plans" ON cinema_plans FOR SELECT USING (true);

-- Users read their own credits
CREATE POLICY "Users read own credits" ON cinema_user_credits 
FOR SELECT USING (auth.uid() = user_id);

-- Users read their own transactions
CREATE POLICY "Users read own transactions" ON cinema_transactions
FOR SELECT USING (auth.uid() = user_id);

-- 6. Insert Default Plans
INSERT INTO cinema_plans (name, price, credits_included, features) VALUES
('Starter', 49.00, 100, '{"video_generation": true, "hd_export": false}'),
('Pro', 99.00, 250, '{"video_generation": true, "hd_export": true}');

-- AI Cinema Credit Management
-- Uses shared user_profiles.credits_balance instead of isolated table

-- Function to check user's credit balance
CREATE OR REPLACE FUNCTION get_user_credits(p_user_id uuid)
RETURNS jsonb
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_balance integer;
  v_tier text;
BEGIN
  SELECT credits_balance, subscription_tier 
  INTO v_balance, v_tier
  FROM user_profiles
  WHERE id = p_user_id;

  IF NOT FOUND THEN
    RETURN jsonb_build_object(
      'success', false,
      'error', 'User not found'
    );
  END IF;

  RETURN jsonb_build_object(
    'success', true,
    'balance', v_balance,
    'tier', v_tier
  );
END;
$$;

-- Grant execute permissions
GRANT EXECUTE ON FUNCTION deduct_cinema_credits TO authenticated;
GRANT EXECUTE ON FUNCTION get_user_credits TO authenticated;

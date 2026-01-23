import { supabase } from './supabase'

export interface CreditBalance {
    balance: number
    tier: string
}

export interface CreditDeductionResult {
    success: boolean
    error?: string
    previous_balance?: number
    deducted?: number
    new_balance?: number
    current_balance?: number
    required?: number
}

/**
 * Get user's current credit balance from user_profiles
 */
export async function getUserCredits(userId: string): Promise<CreditBalance | null> {
    try {
        const { data, error } = await supabase.rpc('get_user_credits', {
            p_user_id: userId
        })

        if (error) throw error

        if (!data.success) {
            console.error('Failed to get credits:', data.error)
            return null
        }

        return {
            balance: data.balance,
            tier: data.tier
        }
    } catch (error) {
        console.error('Error getting user credits:', error)
        return null
    }
}

/**
 * Deduct credits from user's balance (shared with UGC-Factory)
 */
export async function deductCredits(
    userId: string,
    credits: number,
    projectName: string
): Promise<CreditDeductionResult> {
    try {
        const { data, error } = await supabase.rpc('deduct_cinema_credits', {
            p_user_id: userId,
            p_credits: credits,
            p_project_name: projectName
        })

        if (error) throw error

        return data
    } catch (error: any) {
        console.error('Error deducting credits:', error)
        return {
            success: false,
            error: error.message || 'Failed to deduct credits'
        }
    }
}

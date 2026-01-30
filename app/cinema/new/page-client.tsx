
"use client"

import { useState } from "react"
import { useRouter } from "next/navigation"
import { DirectorChat } from "@/components/DirectorChat"
import { supabase } from "@/lib/supabase"
import { Loader2 } from "lucide-react"

export default function CinemaNewProjectClient() {
    const [isCreating, setIsCreating] = useState(false)
    const router = useRouter()

    async function handleFinalize(config: any) {
        // config comes from the chat finalization (e.g. usage of the plan)
        // In a real scenario, the 'config' object would contain:
        // - project_name, creative_direction, core_image_url (if uploaded during chat)

        setIsCreating(true)
        try {
            const { data: { user } } = await supabase.auth.getUser()
            if (!user) {
                // For demo/dev purposes, if no auth, maybe alert or redirect?
                // Let's assume user is authenticated or we just throw.
                alert("Please log in to create a project.")
                throw new Error("Not authenticated")
            }

            // Extract logic from chat messages (simplified for MVP)
            // Ideally the LLM returns a structured JSON "Plan" that we use here.
            // For now, we'll create a generic project stub + credits deduction.

            // Check credit balance (Mock logic or actual import if available)
            // const { getUserCredits, deductCredits } = await import('@/lib/credits')
            const CREDITS_PER_PROJECT = 10

            // Create Project
            const { data, error } = await supabase
                .from('cinema_projects')
                .insert({
                    user_id: user.id,
                    name: "AI Directed Campaign", // Could extract from chat summary
                    creative_direction: JSON.stringify(config.messages), // Store chat history as context
                    status: 'draft',
                    // Default fields
                    voice_id: "EXAVITQu4vr4xnSDxMaL"
                })
                .select()
                .single()

            if (error) throw error

            // Deduct credits (commented out if module missing, but good to have)
            // await deductCredits(user.id, CREDITS_PER_PROJECT, data.name)

            // Redirect to Editor
            router.push(`/cinema/editor/${data.id}`)

        } catch (error) {
            console.error(error)
            alert("Failed to create project. Please try again.")
            setIsCreating(false)
        }
    }

    if (isCreating) {
        return (
            <div className="flex flex-col items-center justify-center min-h-screen space-y-4 bg-white">
                <Loader2 className="h-12 w-12 animate-spin text-purple-600" />
                <h2 className="text-2xl font-bold text-gray-900">Setting up your Studio...</h2>
                <p className="text-gray-500">The Director is preparing your shotlist.</p>
            </div>
        )
    }

    return (
        <main className="min-h-screen bg-white">
            <DirectorChat onFinalize={handleFinalize} />
        </main>
    )
}

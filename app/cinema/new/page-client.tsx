"use client"

import { useState } from "react"
import { useRouter } from "next/navigation"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { supabase } from "@/lib/supabase"
// Basic Textarea if UI component not available, or use standard
// Assuming standard textarea for now or I can implement a quick one

export default function CinemaNewProjectClient() {
    const [loading, setLoading] = useState(false)
    const [formData, setFormData] = useState({
        name: "",
        script: "",
        music_prompt: ""
    })
    const router = useRouter()

    async function handleSubmit(e: React.FormEvent) {
        e.preventDefault()
        setLoading(true)

        if (process.env.NEXT_PUBLIC_SUPABASE_URL?.includes('placeholder')) {
            alert("Configuration Error: Supabase environment variables are not set. Please contact support.")
            setLoading(false)
            return
        }

        try {
            const { data: { user } } = await supabase.auth.getUser()

            // Reverted guest logic: Strict Auth is now enforced by Middleware + Client check
            if (!user) throw new Error("Not authenticated. Please log in.")

            // Check credit balance before creating project
            const { getUserCredits, deductCredits } = await import('@/lib/credits')
            const creditInfo = await getUserCredits(user.id)

            if (!creditInfo) {
                throw new Error("Unable to fetch credit balance. Please try again.")
            }

            const CREDITS_PER_PROJECT = 10 // Cost to create a project

            if (creditInfo.balance < CREDITS_PER_PROJECT) {
                throw new Error(`Insufficient credits. You have ${creditInfo.balance} credits, but need ${CREDITS_PER_PROJECT} to create a project.`)
            }

            // Create the project
            const { data, error } = await supabase
                .from('cinema_projects')
                .insert({
                    user_id: user.id,
                    name: formData.name,
                    script: formData.script,
                    music_prompt: formData.music_prompt,
                    status: 'draft'
                })
                .select()
                .single()

            if (error) throw error

            // Deduct credits after successful project creation
            const deductResult = await deductCredits(user.id, CREDITS_PER_PROJECT, formData.name)

            if (!deductResult.success) {
                console.warn('Project created but credit deduction failed:', deductResult.error)
                // Don't fail the entire operation, just log it
            }

            router.push(`/cinema/editor/${data.id}`)
        } catch (error: any) {
            console.error('Error creating project:', error)
            alert(`Failed to create project: ${error.message || error}`)
        } finally {
            setLoading(false)
        }
    }

    return (
        <div className="max-w-2xl mx-auto">
            <Card>
                <CardHeader>
                    <CardTitle>Create New Cinema Project</CardTitle>
                    <CardDescription>Start by defining the basics of your video project.</CardDescription>
                </CardHeader>
                <CardContent>
                    <form onSubmit={handleSubmit} className="space-y-6">
                        <div className="space-y-2">
                            <Label htmlFor="name">Project Name</Label>
                            <Input
                                id="name"
                                placeholder="My Awesome Ad"
                                required
                                value={formData.name}
                                onChange={(e) => setFormData({ ...formData, name: e.target.value })}
                            />
                        </div>

                        <div className="space-y-2">
                            <Label htmlFor="script">Script / Concept</Label>
                            <textarea
                                id="script"
                                className="flex min-h-[100px] w-full rounded-md border border-input bg-transparent px-3 py-2 text-sm shadow-sm placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring disabled:cursor-not-allowed disabled:opacity-50"
                                placeholder="Describe your video concept..."
                                value={formData.script}
                                onChange={(e) => setFormData({ ...formData, script: e.target.value })}
                            />
                        </div>

                        <div className="space-y-2">
                            <Label htmlFor="music">Music Prompt</Label>
                            <Input
                                id="music"
                                placeholder="Upbeat cinematic corporate music..."
                                value={formData.music_prompt}
                                onChange={(e) => setFormData({ ...formData, music_prompt: e.target.value })}
                            />
                        </div>

                        <div className="flex justify-end gap-4">
                            <Button type="button" variant="outline" onClick={() => router.back()}>
                                Cancel
                            </Button>
                            <Button type="submit" disabled={loading}>
                                {loading ? "Creating..." : "Create Project"}
                            </Button>
                        </div>
                    </form>
                </CardContent>
            </Card>
        </div>
    )
}

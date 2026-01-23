"use client"

import { useState } from "react"
import { useRouter } from "next/navigation"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { supabase } from "@/lib/supabase"
import { Upload, X } from "lucide-react"

export default function CinemaNewProjectClient() {
    const [loading, setLoading] = useState(false)
    const [uploading, setUploading] = useState(false)
    const [formData, setFormData] = useState({
        name: "",
        creative_direction: "",
        core_image_url: "",
        core_elements_url: "",
        voice_id: "EXAVITQu4vr4xnSDxMaL" // Default voice
    })
    const [coreImageFile, setCoreImageFile] = useState<File | null>(null)
    const [coreElementsFile, setCoreElementsFile] = useState<File | null>(null)
    const router = useRouter()

    async function uploadImage(file: File, type: 'core-image' | 'core-elements'): Promise<string> {
        const fileExt = file.name.split('.').pop()
        const fileName = `${Date.now()}-${type}.${fileExt}`
        const filePath = `cinema-uploads/${fileName}`

        const { error: uploadError } = await supabase.storage
            .from('cinema-images')
            .upload(filePath, file, {
                cacheControl: '3600',
                upsert: false
            })

        if (uploadError) throw uploadError

        const { data: { publicUrl } } = supabase.storage
            .from('cinema-images')
            .getPublicUrl(filePath)

        return publicUrl
    }

    async function handleImageUpload(e: React.ChangeEvent<HTMLInputElement>, type: 'core-image' | 'core-elements') {
        const file = e.target.files?.[0]
        if (!file) return

        // Validate file type
        if (!file.type.startsWith('image/')) {
            alert('Please upload an image file (PNG, JPG, etc.)')
            return
        }

        // Validate file size (max 10MB)
        if (file.size > 10 * 1024 * 1024) {
            alert('Image size must be less than 10MB')
            return
        }

        if (type === 'core-image') {
            setCoreImageFile(file)
        } else {
            setCoreElementsFile(file)
        }
    }

    function removeImage(type: 'core-image' | 'core-elements') {
        if (type === 'core-image') {
            setCoreImageFile(null)
            setFormData({ ...formData, core_image_url: "" })
        } else {
            setCoreElementsFile(null)
            setFormData({ ...formData, core_elements_url: "" })
        }
    }

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

            if (!user) throw new Error("Not authenticated. Please log in.")

            // Validate required fields
            if (!formData.name.trim()) {
                throw new Error("Project name is required")
            }
            if (!formData.creative_direction.trim()) {
                throw new Error("Creative direction is required")
            }
            if (!coreImageFile) {
                throw new Error("Core image is required")
            }
            if (!coreElementsFile) {
                throw new Error("Core elements board is required")
            }

            // Check credit balance
            const { getUserCredits, deductCredits } = await import('@/lib/credits')
            const creditInfo = await getUserCredits(user.id)

            if (!creditInfo) {
                throw new Error("Unable to fetch credit balance. Please try again.")
            }

            const CREDITS_PER_PROJECT = 10

            if (creditInfo.balance < CREDITS_PER_PROJECT) {
                throw new Error(`Insufficient credits. You have ${creditInfo.balance} credits, but need ${CREDITS_PER_PROJECT} to create a project.`)
            }

            // Upload images
            setUploading(true)
            const [coreImageUrl, coreElementsUrl] = await Promise.all([
                uploadImage(coreImageFile, 'core-image'),
                uploadImage(coreElementsFile, 'core-elements')
            ])
            setUploading(false)

            // Create the project
            const { data, error } = await supabase
                .from('cinema_projects')
                .insert({
                    user_id: user.id,
                    name: formData.name,
                    creative_direction: formData.creative_direction,
                    core_image_url: coreImageUrl,
                    core_elements_url: coreElementsUrl,
                    voice_id: formData.voice_id,
                    status: 'draft'
                })
                .select()
                .single()

            if (error) throw error

            // Deduct credits
            const deductResult = await deductCredits(user.id, CREDITS_PER_PROJECT, formData.name)

            if (!deductResult.success) {
                console.warn('Project created but credit deduction failed:', deductResult.error)
            }

            router.push(`/cinema/editor/${data.id}`)
        } catch (error: any) {
            console.error('Error creating project:', error)
            alert(`Failed to create project: ${error.message || error}`)
        } finally {
            setLoading(false)
            setUploading(false)
        }
    }

    return (
        <div className="max-w-2xl mx-auto">
            <Card>
                <CardHeader>
                    <CardTitle>Create New Cinema Project</CardTitle>
                    <CardDescription>
                        Define your video concept and upload visual references
                    </CardDescription>
                </CardHeader>
                <CardContent>
                    <form onSubmit={handleSubmit} className="space-y-6">
                        {/* Project Name */}
                        <div className="space-y-2">
                            <Label htmlFor="name">Project Name *</Label>
                            <Input
                                id="name"
                                placeholder="e.g., Gentle Monster Mars Campaign"
                                required
                                value={formData.name}
                                onChange={(e) => setFormData({ ...formData, name: e.target.value })}
                            />
                        </div>

                        {/* Creative Direction */}
                        <div className="space-y-2">
                            <Label htmlFor="creative_direction">Creative Direction *</Label>
                            <textarea
                                id="creative_direction"
                                className="flex min-h-[150px] w-full rounded-md border border-input bg-transparent px-3 py-2 text-sm shadow-sm placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring disabled:cursor-not-allowed disabled:opacity-50"
                                placeholder="Describe your video concept in detail...&#10;&#10;Example:&#10;Create a 40-second cinematic ad for [brand/product]. The aesthetic should be [mood/style]. Use [character/setting description]. The video should [key scenes/actions]. 5 scenes total. Mood: [emotional tone]."
                                required
                                value={formData.creative_direction}
                                onChange={(e) => setFormData({ ...formData, creative_direction: e.target.value })}
                            />
                            <p className="text-xs text-muted-foreground">
                                💡 Be specific about brand, mood, visual style, and key elements. More detail = better results.
                            </p>
                        </div>

                        {/* Core Image Upload */}
                        <div className="space-y-2">
                            <Label htmlFor="core_image">Core Image (Product/Brand) *</Label>
                            {!coreImageFile ? (
                                <div className="border-2 border-dashed border-input rounded-md p-6 text-center hover:border-primary/50 transition-colors">
                                    <input
                                        type="file"
                                        id="core_image"
                                        accept="image/*"
                                        className="hidden"
                                        onChange={(e) => handleImageUpload(e, 'core-image')}
                                    />
                                    <label htmlFor="core_image" className="cursor-pointer">
                                        <Upload className="mx-auto h-8 w-8 text-muted-foreground mb-2" />
                                        <p className="text-sm text-muted-foreground">
                                            Click to upload your main product or brand image
                                        </p>
                                        <p className="text-xs text-muted-foreground mt-1">
                                            PNG, JPG up to 10MB
                                        </p>
                                    </label>
                                </div>
                            ) : (
                                <div className="relative border rounded-md p-4 flex items-center gap-3">
                                    <img
                                        src={URL.createObjectURL(coreImageFile)}
                                        alt="Core image preview"
                                        className="w-20 h-20 object-cover rounded"
                                    />
                                    <div className="flex-1">
                                        <p className="text-sm font-medium">{coreImageFile.name}</p>
                                        <p className="text-xs text-muted-foreground">
                                            {(coreImageFile.size / 1024 / 1024).toFixed(2)} MB
                                        </p>
                                    </div>
                                    <Button
                                        type="button"
                                        variant="ghost"
                                        size="sm"
                                        onClick={() => removeImage('core-image')}
                                    >
                                        <X className="h-4 w-4" />
                                    </Button>
                                </div>
                            )}
                            <p className="text-xs text-muted-foreground">
                                This image will appear in all scenes as a base layer
                            </p>
                        </div>

                        {/* Core Elements Upload */}
                        <div className="space-y-2">
                            <Label htmlFor="core_elements">Core Elements (Mood Board) *</Label>
                            {!coreElementsFile ? (
                                <div className="border-2 border-dashed border-input rounded-md p-6 text-center hover:border-primary/50 transition-colors">
                                    <input
                                        type="file"
                                        id="core_elements"
                                        accept="image/*"
                                        className="hidden"
                                        onChange={(e) => handleImageUpload(e, 'core-elements')}
                                    />
                                    <label htmlFor="core_elements" className="cursor-pointer">
                                        <Upload className="mx-auto h-8 w-8 text-muted-foreground mb-2" />
                                        <p className="text-sm text-muted-foreground">
                                            Click to upload your mood board
                                        </p>
                                        <p className="text-xs text-muted-foreground mt-1">
                                            Should include: Character, Setting, Product sections
                                        </p>
                                    </label>
                                </div>
                            ) : (
                                <div className="relative border rounded-md p-4 flex items-center gap-3">
                                    <img
                                        src={URL.createObjectURL(coreElementsFile)}
                                        alt="Elements board preview"
                                        className="w-20 h-20 object-cover rounded"
                                    />
                                    <div className="flex-1">
                                        <p className="text-sm font-medium">{coreElementsFile.name}</p>
                                        <p className="text-xs text-muted-foreground">
                                            {(coreElementsFile.size / 1024 / 1024).toFixed(2)} MB
                                        </p>
                                    </div>
                                    <Button
                                        type="button"
                                        variant="ghost"
                                        size="sm"
                                        onClick={() => removeImage('core-elements')}
                                    >
                                        <X className="h-4 w-4" />
                                    </Button>
                                </div>
                            )}
                            <p className="text-xs text-muted-foreground">
                                💡 Use a 2x2 grid with Character, Setting, Product, and Mood sections
                            </p>
                        </div>

                        {/* Voice Selection (Optional) */}
                        <div className="space-y-2">
                            <Label htmlFor="voice_id">Voiceover Voice (Optional)</Label>
                            <select
                                id="voice_id"
                                className="flex h-9 w-full rounded-md border border-input bg-transparent px-3 py-1 text-sm shadow-sm transition-colors focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring disabled:cursor-not-allowed disabled:opacity-50"
                                value={formData.voice_id}
                                onChange={(e) => setFormData({ ...formData, voice_id: e.target.value })}
                            >
                                <option value="EXAVITQu4vr4xnSDxMaL">Professional Male (Default)</option>
                                <option value="21m00Tcm4TlvDq8ikWAM">Rachel - Calm Female</option>
                                <option value="AZnzlk1XvdvUeBnXmlld">Domi - Strong Female</option>
                                <option value="ErXwobaYiN019PkySvjV">Antoni - Warm Male</option>
                                <option value="MF3mGyEYCl7XYWbV9V6O">Elli - Energetic Female</option>
                                <option value="TxGEqnHWrfWFTfGW9XjX">Josh - Deep Male</option>
                            </select>
                            <p className="text-xs text-muted-foreground">
                                Select the voice for your AI-generated script
                            </p>
                        </div>

                        {/* Submit Buttons */}
                        <div className="flex justify-end gap-4">
                            <Button type="button" variant="outline" onClick={() => router.back()}>
                                Cancel
                            </Button>
                            <Button type="submit" disabled={loading || uploading}>
                                {uploading ? "Uploading images..." : loading ? "Creating..." : "Create Project"}
                            </Button>
                        </div>
                    </form>
                </CardContent>
            </Card>
        </div>
    )
}

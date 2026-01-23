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
   
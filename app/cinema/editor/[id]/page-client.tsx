"use client"

import { useEffect, useState, useCallback } from "react"
import { useParams, useRouter } from "next/navigation"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Badge } from "@/components/ui/badge"
import { Trash2, Plus, Play, Loader2, Image as ImageIcon, Film } from "lucide-react"
import { supabase } from "@/lib/supabase"

interface Scene {
    id: string
    scene_number: number
    start_image_prompt: string
    end_image_prompt: string
    transition_prompt: string
    start_image_url: string | null
    end_image_url: string | null
    video_url: string | null
    status: string
}

interface Project {
    id: string
    name: string
    status: string
}

export default function CinemaEditorClient({ projectId }: { projectId: string }) {
    const [project, setProject] = useState<Project | null>(null)
    const [scenes, setScenes] = useState<Scene[]>([])
    const [loading, setLoading] = useState(true)
    const [generating, setGenerating] = useState(false)

    // Realtime subscription ref
    useEffect(() => {
        fetchData()

        // Realtime subscription for scene updates
        const channel = supabase
            .channel('cinema-editor')
            .on(
                'postgres_changes',
                {
                    event: '*',
                    schema: 'public',
                    table: 'cinema_scenes',
                    filter: `project_id=eq.${projectId}`
                },
                (payload) => {
                    console.log('Realtime update:', payload)
                    // Simple refresh or merge. Merging is better for UX.
                    if (payload.eventType === 'UPDATE') {
                        setScenes(current => current.map(scene =>
                            scene.id === payload.new.id ? { ...scene, ...payload.new as Scene } : scene
                        ))
                    } else if (payload.eventType === 'INSERT') {
                        setScenes(current => [...current, payload.new as Scene].sort((a, b) => a.scene_number - b.scene_number))
                    }
                }
            )
            .subscribe()

        return () => {
            supabase.removeChannel(channel)
        }
    }, [projectId])

    async function fetchData() {
        try {
            setLoading(true)
            const { data: projectData, error: projectError } = await supabase
                .from('cinema_projects')
                .select('*')
                .eq('id', projectId)
                .single()

            if (projectError) throw projectError
            setProject(projectData)

            const { data: scenesData, error: scenesError } = await supabase
                .from('cinema_scenes')
                .select('*')
                .eq('project_id', projectId)
                .order('scene_number', { ascending: true })

            if (scenesError) throw scenesError
            setScenes(scenesData || [])
        } catch (error) {
            console.error("Error fetching data:", error)
        } finally {
            setLoading(false)
        }
    }

    async function addScene() {
        const newSceneNumber = scenes.length + 1
        const { data, error } = await supabase
            .from('cinema_scenes')
            .insert({
                project_id: projectId,
                scene_number: newSceneNumber,
                start_image_prompt: "",
                end_image_prompt: "",
                transition_prompt: ""
            })
            .select()
            .single()

        if (error) {
            console.error("Error adding scene:", error)
            return
        }
        // State will update via realtime or we can push manually for faster UI
        setScenes([...scenes, data])
    }

    async function updateScene(id: string, updates: Partial<Scene>) {
        // Optimistic update
        setScenes(scenes.map(s => s.id === id ? { ...s, ...updates } : s))

        await supabase.from('cinema_scenes').update(updates).eq('id', id)
    }

    async function deleteScene(id: string) {
        if (!confirm("Are you sure?")) return;

        setScenes(scenes.filter(s => s.id !== id))
        await supabase.from('cinema_scenes').delete().eq('id', id)
    }

    async function startGeneration() {
        if (!project) return
        setGenerating(true)

        // Update project status to 'generating'
        // This is the trigger for n8n (or it triggers logic)
        await supabase.from('cinema_projects').update({ status: 'generating' }).eq('id', projectId)
        setProject({ ...project, status: 'generating' })

        // Also ensure all scenes are ready?
        // Optional: Reset scene status to pending if re-generating
    }

    if (loading) return <div className="p-8">Loading editor...</div>
    if (!project) return <div className="p-8">Project not found</div>

    return (
        <div className="space-y-6 max-w-5xl mx-auto pb-20">
            <div className="flex items-center justify-between border-b pb-4">
                <div>
                    <h1 className="text-2xl font-bold">{project.name}</h1>
                    <Badge variant={project.status === 'generating' ? "default" : "secondary"} className="mt-1">
                        {project.status}
                    </Badge>
                </div>
                <div className="flex gap-2">
                    <Button onClick={addScene} variant="outline">
                        <Plus className="mr-2 h-4 w-4" /> Add Scene
                    </Button>
                    <Button onClick={startGeneration} disabled={project.status === 'generating' || generating}>
                        {project.status === 'generating' ? (
                            <><Loader2 className="mr-2 h-4 w-4 animate-spin" /> Generating</>
                        ) : (
                            <><Play className="mr-2 h-4 w-4" /> Generate Project</>
                        )}
                    </Button>
                </div>
            </div>

            <div className="space-y-6">
                {scenes.map((scene, index) => (
                    <Card key={scene.id} className="relative">
                        <div className="absolute top-4 right-4">
                            <Button size="icon" variant="ghost" className="text-destructive h-8 w-8" onClick={() => deleteScene(scene.id)}>
                                <Trash2 className="h-4 w-4" />
                            </Button>
                        </div>
                        <CardHeader className="pb-2">
                            <CardTitle className="text-lg">Scene {scene.scene_number}</CardTitle>
                            <CardDescription>
                                Status: <span className={
                                    scene.status === 'done' ? 'text-green-500 font-medium' :
                                        scene.status === 'error' ? 'text-red-500 font-medium' :
                                            'text-muted-foreground'
                                }>{scene.status}</span>
                            </CardDescription>
                        </CardHeader>
                        <CardContent className="space-y-4">
                            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                                <div className="space-y-2">
                                    <Label>Start Image Prompt</Label>
                                    <Input
                                        value={scene.start_image_prompt || ''}
                                        onChange={e => updateScene(scene.id, { start_image_prompt: e.target.value })}
                                        placeholder="Describe the start frame..."
                                    />
                                    {scene.start_image_url && (
                                        <div className="mt-2 relative aspect-video rounded-md overflow-hidden bg-muted border">
                                            <img src={scene.start_image_url} alt="Start" className="object-cover w-full h-full" />
                                            <Badge className="absolute top-2 left-2 bg-black/50">Start</Badge>
                                        </div>
                                    )}
                                </div>
                                <div className="space-y-2">
                                    <Label>End Image Prompt</Label>
                                    <Input
                                        value={scene.end_image_prompt || ''}
                                        onChange={e => updateScene(scene.id, { end_image_prompt: e.target.value })}
                                        placeholder="Describe the end frame..."
                                    />
                                    {scene.end_image_url && (
                                        <div className="mt-2 relative aspect-video rounded-md overflow-hidden bg-muted border">
                                            <img src={scene.end_image_url} alt="End" className="object-cover w-full h-full" />
                                            <Badge className="absolute top-2 left-2 bg-black/50">End</Badge>
                                        </div>
                                    )}
                                </div>
                            </div>

                            <div className="space-y-2">
                                <Label>Transition / Motion Prompt</Label>
                                <Input
                                    value={scene.transition_prompt || ''}
                                    onChange={e => updateScene(scene.id, { transition_prompt: e.target.value })}
                                    placeholder="Describe the movement (e.g. camera zooms in...)"
                                />
                            </div>

                            {scene.video_url && (
                                <div className="mt-4 pt-4 border-t">
                                    <Label className="mb-2 block"><Film className="inline w-4 h-4 mr-1" /> Generated Video</Label>
                                    <video src={scene.video_url} controls className="w-full rounded-md border bg-black aspect-video" />
                                </div>
                            )}
                        </CardContent>
                    </Card>
                ))}

                {scenes.length === 0 && (
                    <div className="text-center py-12 text-muted-foreground border-2 border-dashed rounded-lg">
                        No scenes yet. Add a scene to get started.
                    </div>
                )}
            </div>
        </div>
    )
}

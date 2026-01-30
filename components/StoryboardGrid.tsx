
"use client"

import { useState, useEffect } from "react"
import { Card } from "@/components/ui/card"
import { Button } from "@/components/ui/button"
import { Loader2, Sparkles, Image as ImageIcon, CheckCircle2, AlertCircle } from "lucide-react"
import { cn } from "@/lib/utils"
import { PopcornSequence, StoryboardFrameDetails } from "@/types/cinema"
import { supabase } from "@/lib/supabase"

interface StoryboardGridProps {
    sequence: PopcornSequence;
    onFrameUpdate?: (frameId: number, url: string) => void;
}

export function StoryboardGrid({ sequence, onFrameUpdate }: StoryboardGridProps) {
    // Safe access to frames, handling potential structure mismatch
    // The sequence might be the plan itself (flat) or contain a plan property
    const planData = sequence ? ((sequence as any).plan || sequence) : null;
    const initialFrames = planData?.frames || [];
    const initialBackgrounds = planData?.backgrounds || [];

    // If no valid frames found, return Error UI instead of null
    if (!sequence || initialFrames.length === 0) {
        return (
            <div className="mt-4 p-4 border border-red-200 bg-red-50 rounded-xl text-red-600 flex items-center gap-3 shadow-sm">
                <AlertCircle className="w-5 h-5 flex-shrink-0" />
                <div className="text-sm font-medium">
                    Storyboard plan could not be generated. Please try confusing the AI less or refining your prompt. 🎬
                </div>
            </div>
        )
    }

    const [frames, setFrames] = useState<StoryboardFrameDetails[]>(initialFrames)
    const [generatingIds, setGeneratingIds] = useState<number[]>([])
    const [bgUrls, setBgUrls] = useState<Record<string, string>>({})

    const [hasStarted, setHasStarted] = useState(false)

    useEffect(() => {
        if (!hasStarted && !frames.every(f => f.url)) {
            generateAll()
        }
    }, [hasStarted, frames])

    const generateAll = async () => {
        if (hasStarted) return
        setHasStarted(true)

        // Step 1: Generate Backgrounds (Parallel)
        const newBgUrls: Record<string, string> = { ...bgUrls }

        if (initialBackgrounds.length > 0) {
            await Promise.all(initialBackgrounds.map(async (bg: any) => {
                if (newBgUrls[bg.id]) return;
                try {
                    const { data } = await supabase.functions.invoke('cinema-popcorn', {
                        body: {
                            action: 'generate_background',
                            background_plan: bg,
                            style: "Cinematic Realistic"
                        }
                    })
                    if (data?.url) newBgUrls[bg.id] = data.url
                } catch (e) {
                    console.error(`Bg ${bg.id} failed`, e)
                }
            }))
        } // Closing the if check

        setBgUrls(newBgUrls)

        // Step 2: Generate Frames (Parallel with Concurrency Limit)
        const PENDING_LIMIT = 3; // Max concurrent requests
        const queue = frames.filter(f => !f.url).map(f => f.frame_number);

        const processFrame = async (frameNum: number) => {
            const frame = frames.find(f => f.frame_number === frameNum);
            if (!frame) return;

            setGeneratingIds(prev => [...prev, frameNum])
            try {
                const { data } = await supabase.functions.invoke('cinema-popcorn', {
                    body: {
                        action: 'generate_frame',
                        frame_plan: frame,
                        all_references: sequence.references,
                        bg_url: newBgUrls[frame.background_id],
                        style: "Cinematic Realistic"
                    }
                })

                if (data?.url) {
                    const updatedUrl = data.url
                    setFrames(prev => prev.map(f =>
                        f.frame_number === frameNum ? { ...f, url: updatedUrl } : f
                    ))
                    onFrameUpdate?.(frameNum, updatedUrl)
                }
            } catch (err) {
                console.error("Frame Gen Error:", err)
            } finally {
                setGeneratingIds(prev => prev.filter(id => id !== frameNum))
            }
        };

        // Simple batching for concurrency
        for (let i = 0; i < queue.length; i += PENDING_LIMIT) {
            const batch = queue.slice(i, i + PENDING_LIMIT);
            await Promise.all(batch.map(id => processFrame(id)));
        }

        setHasStarted(false) // Allow retry if needed
    }

    return (
        <div className="space-y-6 mt-4">
            <div className="flex items-center justify-between">
                <div>
                    <h3 className="text-lg font-bold text-white flex items-center gap-2">
                        <Sparkles className="w-5 h-5 text-yellow-400" />
                        Planned Storyboard
                    </h3>
                    <p className="text-zinc-400 text-sm">Sequence of {frames.length} cinematic frames</p>
                </div>
                {!frames.every(f => f.url) && (
                    <Button
                        size="sm"
                        onClick={generateAll}
                        disabled={generatingIds.length > 0}
                        className="bg-indigo-600 hover:bg-indigo-500 text-white gap-2"
                    >
                        {generatingIds.length > 0 ? <Loader2 className="w-4 h-4 animate-spin" /> : <Sparkles className="w-4 h-4" />}
                        {generatingIds.length > 0 ? "Generating Sequence..." : "Generate Sequence"}
                    </Button>
                )}
            </div>

            <div className="grid grid-cols-2 md:grid-cols-3 gap-4">
                {frames.map((frame, index) => (
                    <Card key={`${frame.frame_number}-${index}`} className="bg-zinc-900 border-zinc-800 overflow-hidden group">
                        <div className="aspect-video bg-zinc-950 relative flex items-center justify-center">
                            {frame.url ? (
                                <img src={frame.url} alt={`Frame ${frame.frame_number}`} className="w-full h-full object-cover" />
                            ) : (
                                <div className="flex flex-col items-center gap-2 text-zinc-600">
                                    {generatingIds.includes(frame.frame_number) ? (
                                        <>
                                            <Loader2 className="w-6 h-6 animate-spin text-indigo-400" />
                                            <span className="text-[10px] uppercase tracking-widest font-bold text-indigo-400/80">Generating...</span>
                                        </>
                                    ) : (
                                        <>
                                            <ImageIcon className="w-6 h-6" />
                                            <span className="text-[10px] uppercase tracking-widest font-bold">Planned</span>
                                        </>
                                    )}
                                </div>
                            )}
                            <div className="absolute top-2 left-2 px-2 py-0.5 rounded bg-black/60 backdrop-blur-md border border-white/10 text-[10px] font-bold text-white uppercase tracking-tighter">
                                Frame {frame.frame_number}
                            </div>
                        </div>
                        <div className="p-3 space-y-1">
                            <div className="flex items-center justify-between">
                                <span className="text-[10px] font-black uppercase tracking-widest text-indigo-400">
                                    {frame.shot_type}
                                </span>
                                <span className="text-[10px] text-zinc-500 font-medium">{frame.camera_angle}</span>
                            </div>
                            <p className="text-xs text-zinc-300 line-clamp-2 leading-relaxed">
                                {frame.description}
                            </p>
                        </div>
                    </Card>
                ))}
            </div>
        </div>
    )
}

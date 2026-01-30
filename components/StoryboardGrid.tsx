
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
    const [frames, setFrames] = useState<StoryboardFrameDetails[]>(sequence.plan.frames)
    const [isGenerating, setIsGenerating] = useState<number | null>(null)
    const [bgUrls, setBgUrls] = useState<Record<string, string>>({})

    const generateAll = async () => {
        // Step 1: Generate Backgrounds
        const newBgUrls: Record<string, string> = { ...bgUrls }
        for (const bg of sequence.plan.backgrounds) {
            if (newBgUrls[bg.id]) continue;

            const { data, error } = await supabase.functions.invoke('cinema-popcorn', {
                body: {
                    action: 'generate_background',
                    background_plan: bg,
                    style: "Cinematic Realistic"
                }
            })
            if (data?.url) newBgUrls[bg.id] = data.url
        }
        setBgUrls(newBgUrls)

        // Step 2: Generate Frames sequentially to maintain consistency
        for (const frame of frames) {
            if (frame.url) continue;

            setIsGenerating(frame.frame_number)

            try {
                const { data, error } = await supabase.functions.invoke('cinema-popcorn', {
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
                        f.frame_number === frame.frame_number ? { ...f, url: updatedUrl } : f
                    ))
                    onFrameUpdate?.(frame.frame_number, updatedUrl)
                }
            } catch (err) {
                console.error("Frame Gen Error:", err)
            }
        }
        setIsGenerating(null)
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
                        disabled={isGenerating !== null}
                        className="bg-indigo-600 hover:bg-indigo-500 text-white gap-2"
                    >
                        {isGenerating !== null ? <Loader2 className="w-4 h-4 animate-spin" /> : <Sparkles className="w-4 h-4" />}
                        Generate Sequence
                    </Button>
                )}
            </div>

            <div className="grid grid-cols-2 md:grid-cols-3 gap-4">
                {frames.map((frame) => (
                    <Card key={frame.frame_number} className="bg-zinc-900 border-zinc-800 overflow-hidden group">
                        <div className="aspect-video bg-zinc-950 relative flex items-center justify-center">
                            {frame.url ? (
                                <img src={frame.url} alt={`Frame ${frame.frame_number}`} className="w-full h-full object-cover" />
                            ) : (
                                <div className="flex flex-col items-center gap-2 text-zinc-600">
                                    {isGenerating === frame.frame_number ? (
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

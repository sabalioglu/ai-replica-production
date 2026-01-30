"use client"

import { useState, useEffect } from "react"
import { Card } from "@/components/ui/card"
import { Button } from "@/components/ui/button"
import { Loader2, Sparkles, Image as ImageIcon, CheckCircle2, AlertCircle, Video, Play } from "lucide-react"
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
    const [animatingIds, setAnimatingIds] = useState<number[]>([])
    const [bgUrls, setBgUrls] = useState<Record<string, string>>({})
    const [anchorImageUrl, setAnchorImageUrl] = useState<string | null>(null)
    const [isCreatingAnchor, setIsCreatingAnchor] = useState(false)

    const [hasStarted, setHasStarted] = useState(false)

    useEffect(() => {
        if (!hasStarted && !frames.every(f => f.url)) {
            generateAll()
        }
    }, [hasStarted, frames])

    const generateAll = async () => {
        if (hasStarted) return
        setHasStarted(true)

        // Step 1: Create Subject/Product Anchor (Sequential)
        let currentAnchorUrl = anchorImageUrl;
        if (!currentAnchorUrl) {
            setIsCreatingAnchor(true);
            try {
                const { data } = await supabase.functions.invoke('cinema-popcorn', {
                    body: {
                        action: 'create_anchor_image',
                        prompt: sequence.plan.consistency_rules || "Blue earbuds, high quality product visualization",
                        reference_urls: sequence.references.filter(r => r.url).map(r => r.url),
                        style: "Cinematic Realistic"
                    }
                });
                if (data?.url) {
                    currentAnchorUrl = data.url;
                    setAnchorImageUrl(data.url);
                }
            } catch (e) {
                console.error("Anchor creation failed", e);
            } finally {
                setIsCreatingAnchor(false);
            }
        }

        // Step 2: Generate Backgrounds (Parallel)
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
        }

        setBgUrls(newBgUrls)

        // Step 3: Generate Frames (Batched)
        const PENDING_LIMIT = 2; // Focus on quality
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
                        anchor_image_url: currentAnchorUrl || undefined,
                        style: "Cinematic Realistic"
                    }
                })

                if (data?.url) {
                    const updatedUrl = data.url
                    setFrames(prev => prev.map(f =>
                        f.frame_number === frameNum ? { ...f, url: updatedUrl } : f
                    ))
                    if (onFrameUpdate) onFrameUpdate(frameNum, updatedUrl)
                }
            } catch (err) {
                console.error(`Frame ${frameNum} Gen Error:`, err)
            } finally {
                setGeneratingIds(prev => prev.filter(id => id !== frameNum))
            }
        };

        // Batch processing
        for (let i = 0; i < queue.length; i += PENDING_LIMIT) {
            const batch = queue.slice(i, i + PENDING_LIMIT);
            await Promise.all(batch.map(id => processFrame(id)));
        }

        setHasStarted(false)
    }

    const handleAnimateFrame = async (frameNumber: number, imageUrl: string, visualPrompt: string) => {
        if (animatingIds.includes(frameNumber)) return;

        setAnimatingIds(prev => [...prev, frameNumber]);

        try {
            const { data, error } = await supabase.functions.invoke('cinema-popcorn', {
                body: {
                    action: 'generate_video',
                    image_url: imageUrl,
                    prompt: visualPrompt
                }
            });

            if (data?.url) {
                setFrames(prev => prev.map(f =>
                    f.frame_number === frameNumber ? { ...f, video_url: data.url } : f
                ));
                if (onFrameUpdate) onFrameUpdate(frameNumber, data.url);
            } else {
                console.error("Video generation failed:", error);
            }
        } catch (e) {
            console.error("Animate Error:", e);
        } finally {
            setAnimatingIds(prev => prev.filter(id => id !== frameNumber));
        }
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
                        disabled={generatingIds.length > 0 || isCreatingAnchor}
                        className="bg-indigo-600 hover:bg-indigo-500 text-white gap-2 transition-all duration-300 active:scale-95"
                    >
                        {(generatingIds.length > 0 || isCreatingAnchor) ? <Loader2 className="w-4 h-4 animate-spin" /> : <Sparkles className="w-4 h-4" />}
                        {isCreatingAnchor ? "Locking Subject..." : generatingIds.length > 0 ? "Directing Scenes..." : "Generate Sequence"}
                    </Button>
                )}
            </div>

            <div className="grid grid-cols-2 md:grid-cols-2 lg:grid-cols-4 gap-6">
                {frames.map((frame, index) => {
                    const isStart = !frame.is_keyframe_b;
                    const isPair = !!frame.linked_frame_id;

                    return (
                        <div key={`${frame.frame_number}-${index}`} className={cn(
                            "relative space-y-3",
                            isStart && isPair && "col-span-1"
                        )}>
                            {/* Visual Linking indicator for Start Frame */}
                            {isStart && isPair && (
                                <div className="absolute -right-4 top-1/2 -translate-y-1/2 z-10 hidden lg:block">
                                    <div className="w-8 h-0.5 bg-indigo-500/30 dashed" />
                                </div>
                            )}

                            <Card className={cn(
                                "bg-zinc-900 border-zinc-800 overflow-hidden group transition-all duration-300",
                                generatingIds.includes(frame.frame_number) && "ring-2 ring-indigo-500/50"
                            )}>
                                <div className="aspect-video bg-zinc-950 relative flex items-center justify-center">
                                    {frame.video_url ? (
                                        <video
                                            src={frame.video_url}
                                            className="w-full h-full object-cover"
                                            autoPlay
                                            loop
                                            muted
                                            playsInline
                                        />
                                    ) : frame.url ? (
                                        <img src={frame.url} alt={`Frame ${frame.frame_number}`} className="w-full h-full object-cover" />
                                    ) : (
                                        <div className="flex flex-col items-center gap-2 text-zinc-600">
                                            {generatingIds.includes(frame.frame_number) ? (
                                                <>
                                                    <Loader2 className="w-6 h-6 animate-spin text-indigo-400" />
                                                    <span className="text-[10px] uppercase tracking-widest font-bold text-indigo-400/80">Capturing...</span>
                                                </>
                                            ) : (
                                                <>
                                                    <ImageIcon className="w-6 h-6" />
                                                    <span className="text-[10px] uppercase tracking-widest font-bold">Planned</span>
                                                </>
                                            )}
                                        </div>
                                    )}

                                    {/* Keyframe Label */}
                                    <div className={cn(
                                        "absolute top-2 left-2 px-2 py-0.5 rounded backdrop-blur-md border border-white/10 text-[9px] font-black uppercase tracking-widest",
                                        frame.is_keyframe_b ? "bg-amber-500/80 text-black" : "bg-indigo-600/80 text-white"
                                    )}>
                                        {frame.is_keyframe_b ? "End Keyframe" : "Start Keyframe"}
                                    </div>

                                    {frame.url && !frame.video_url && (
                                        <div className="absolute inset-0 flex items-center justify-center bg-black/40 opacity-0 group-hover:opacity-100 transition-opacity">
                                            <Button
                                                size="sm"
                                                onClick={() => handleAnimateFrame(frame.frame_number, frame.url!, frame.description)}
                                                disabled={animatingIds.includes(frame.frame_number)}
                                                className="bg-indigo-600 hover:bg-indigo-500 text-white rounded-full h-10 px-4 gap-2 shadow-xl"
                                            >
                                                {animatingIds.includes(frame.frame_number) ? (
                                                    <Loader2 className="w-4 h-4 animate-spin" />
                                                ) : (
                                                    <Video className="w-4 h-4" />
                                                )}
                                                {animatingIds.includes(frame.frame_number) ? "Animating..." : "Animate"}
                                            </Button>
                                        </div>
                                    )}
                                </div>

                                <div className="p-3 space-y-2">
                                    <div className="flex items-center justify-between">
                                        <span className="text-[10px] font-black uppercase tracking-widest text-indigo-400">
                                            {frame.shot_type}
                                        </span>
                                        <span className="text-[10px] text-zinc-500 font-medium">{frame.camera_angle}</span>
                                    </div>

                                    <p className="text-xs text-zinc-300 line-clamp-2 leading-relaxed">
                                        {frame.description}
                                    </p>

                                    {/* Motion Description for Start Frames */}
                                    {isStart && frame.motion_description && (
                                        <div className="pt-2 mt-2 border-t border-white/5 flex items-start gap-2">
                                            <div className="w-1 h-1 rounded-full bg-indigo-500 mt-1.5" />
                                            <p className="text-[10px] text-indigo-300/80 italic font-medium leading-tight">
                                                {frame.motion_description}
                                            </p>
                                        </div>
                                    )}
                                </div>
                            </Card>
                        </div>
                    )
                })}
            </div>
        </div>
    )
}

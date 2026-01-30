"use client"

import { useState, useRef, useEffect } from "react"

import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { ScrollArea } from "@/components/ui/scroll-area"
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar"
import { Card } from "@/components/ui/card"
import { Paperclip, Send, Loader2, Sparkles, Film, Download, RefreshCw, X, Play } from "lucide-react"
import { CinemaControls } from "@/components/CinemaControls"
import { StoryboardGrid } from "@/components/StoryboardGrid"
import { cn } from "@/lib/utils"
import { PopcornSequence } from "@/types/cinema"
import { supabase } from "@/lib/supabase"
import { toast } from "sonner"

// --- Media Preview Component (Dark Theme) ---
const MediaPreview = ({ src, type, onAnimate, isAnimating }: { src: string, type: 'image' | 'video', onAnimate?: () => void, isAnimating?: boolean }) => {
    return (
        <div className="mt-3 rounded-xl overflow-hidden border border-zinc-800 shadow-lg relative group bg-zinc-950/50">
            {type === 'image' ? (
                <>
                    <img src={src} alt="Preview" className="w-full h-auto object-cover" />
                    {onAnimate && (
                        <div className="absolute bottom-3 right-3 opacity-0 group-hover:opacity-100 transition-opacity">
                            <button
                                onClick={onAnimate}
                                disabled={isAnimating}
                                className="bg-black/80 hover:bg-black text-white text-xs px-4 py-2 rounded-full flex items-center gap-2 border border-zinc-700 backdrop-blur-md transition-all font-medium"
                            >
                                {isAnimating ? <Loader2 className="w-3 h-3 animate-spin" /> : <Film className="w-3 h-3 text-purple-400" />}
                                {isAnimating ? "Animating..." : "Animate"}
                            </button>
                        </div>
                    )}
                </>
            ) : (
                <div className="relative">
                    <video src={src} controls autoPlay loop className="w-full h-auto" />
                    <div className="absolute top-2 right-2">
                        <a href={src} download className="p-2 bg-black/50 text-white rounded-full hover:bg-black/70 transition-colors">
                            <Download className="w-4 h-4" />
                        </a>
                    </div>
                </div>
            )}
        </div>
    )
}

interface DirectorChatProps {
    onFinalize: (data: any) => void
}

export function DirectorChat({ onFinalize }: DirectorChatProps) {
    // Chat State
    const [messages, setMessages] = useState<Array<{
        role: string,
        content: string | any,
        id?: string,
        type?: string,
        mediaUrl?: string,
        projectPlan?: any,
        specs?: any,
        previewUrl?: string | null,
        videoUrl?: string | null,
        storyboard?: PopcornSequence
    }>>([
        {
            role: 'assistant',
            content: "Hello! I'm your AI Creative Director. Describe your cinematic vision...",
            id: 'welcome'
        }
    ])
    const [input, setInput] = useState("")
    const [isLoading, setIsLoading] = useState(false)
    const [uploadedImage, setUploadedImage] = useState<string | null>(null)
    const messagesEndRef = useRef<HTMLDivElement>(null)

    // Missing state variables added
    const [finalPlan, setFinalPlan] = useState<any>(null)
    const [isProcessing, setIsProcessing] = useState(false)
    const [isGeneratingPreview, setIsGeneratingPreview] = useState<string | null>(null) // ID of message generating
    const [isAnimating, setIsAnimating] = useState<string | null>(null) // ID of message animating
    const [recentPrompt, setRecentPrompt] = useState("")

    // Console & Generation Settings
    const [genSettings, setGenSettings] = useState({
        aspectRatio: '16:9',
        resolution: 'HD',
        batchSize: 1
    })

    // Studio State (Manual Controls)
    const [manualSpecs, setManualSpecs] = useState<any>({
        camera: "",
        lens: "",
        lighting: "",
        mood: ""
    })

    const scrollToBottom = () => {
        messagesEndRef.current?.scrollIntoView({ behavior: "smooth" })
    }

    useEffect(() => {
        scrollToBottom()
    }, [messages])

    const handleFinalizeProject = () => {
        setIsProcessing(true)
        // Simulate processing for now or call onFinalize
        setTimeout(() => {
            setIsProcessing(false)
            onFinalize(finalPlan || { messages })
        }, 1500)
    }

    const handleSendMessage = async () => {
        if ((!input.trim() && !uploadedImage) || isLoading) return

        const userMsg = { role: 'user', content: input, id: crypto.randomUUID() }
        setMessages(prev => [...prev, userMsg])
        setInput("")
        setRecentPrompt(input)
        setIsLoading(true)

        try {
            const response = await fetch(`${process.env.NEXT_PUBLIC_SUPABASE_URL}/functions/v1/cinema-director`, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    "Authorization": `Bearer ${process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY}`
                },
                body: JSON.stringify({
                    action: "chat",
                    prompt: input,
                    image_url: uploadedImage || undefined,
                    history: messages.map(m => ({ role: m.role, content: m.content })),
                    specs: manualSpecs, // Send manual overrides
                    settings: genSettings // Send aspect ratio/resolution
                })
            })

            const data = await response.json()
            if (data.error) throw new Error(data.error)

            // If AI suggests specs, update our manual controls state ONLY if not manually set?
            // User requested manual control overrides. So let's say AI suggests, but user can change it.
            // We'll update state to show what AI thinks, but user can click to change.
            let messageContent = data.content;
            let storyboardInfo = null;

            if (typeof data.content === 'object') {
                if (data.content.specs) {
                    setManualSpecs((prev: any) => ({
                        ...prev,
                        ...data.content.specs
                    }))
                }
                if (data.content.storyboard) {
                    storyboardInfo = data.content.storyboard;
                }
                // Extract the text message to prevent React render error (Error #31)
                messageContent = data.content.message || JSON.stringify(data.content);
            }

            setMessages(prev => [...prev, {
                role: 'assistant',
                content: messageContent,
                id: crypto.randomUUID(),
                storyboard: storyboardInfo // Pass the AI-generated storyboard
            }])
            if (uploadedImage) setUploadedImage(null)

        } catch (error) {
            console.error("Chat error:", error)
            setMessages(prev => [...prev, { role: 'assistant', content: `Error: ${error instanceof Error ? error.message : "Connection error"}`, id: crypto.randomUUID() }])
        } finally {
            setIsLoading(false)
        }
    }

    const handleGeneratePreview = async (msgId: string, prompt: string, specs: any) => {
        setIsGeneratingPreview(msgId);
        setIsLoading(true)

        // Find the last relevant context prompt if empty
        const effectivePrompt = prompt || [...messages].reverse().find(m => m.role === 'user')?.content || "Cinematic product shot";

        try {
            const response = await fetch(`${process.env.NEXT_PUBLIC_SUPABASE_URL}/functions/v1/cinema-director`, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    "Authorization": `Bearer ${process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY}`
                },
                body: JSON.stringify({
                    action: "generate_preview",
                    prompt: effectivePrompt,
                    specs: specs,
                    settings: genSettings
                })
            });

            if (!response.ok) throw new Error("Preview generation failed");
            const data = await response.json();

            // Update the SPECIFIC message with the preview URL
            setMessages(prev => prev.map(m =>
                m.id === msgId
                    ? { ...m, previewUrl: data.image_url, videoUrl: null }
                    : m
            ));

        } catch (error) {
            console.error(error);
            // Maybe show toast or error state on the button
        } finally {
            setIsLoading(false);
            setIsGeneratingPreview(null);
        }
    };

    const handleAnimatePreview = async (msgId: string, imageUrl: string) => {
        setIsLoading(true);
        setIsAnimating(msgId); // Set specific message as animating

        try {
            const response = await fetch(`${process.env.NEXT_PUBLIC_SUPABASE_URL}/functions/v1/cinema-director`, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    "Authorization": `Bearer ${process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY}`
                },
                body: JSON.stringify({
                    action: "animate_preview",
                    image_url: imageUrl
                })
            });

            if (!response.ok) throw new Error("Animation start failed");
            const data = await response.json();
            const taskId = data.task_id;

            const pollInterval = setInterval(async () => {
                try {
                    const statusRes = await fetch(`${process.env.NEXT_PUBLIC_SUPABASE_URL}/functions/v1/cinema-director`, {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/json",
                            "Authorization": `Bearer ${process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY}`
                        },
                        body: JSON.stringify({
                            action: "check_status",
                            task_id: taskId
                        })
                    });
                    const statusData = await statusRes.json();

                    if (statusData.status === 'done') {
                        clearInterval(pollInterval);
                        setIsLoading(false);
                        setIsAnimating(null);

                        // Update the message with the video URL
                        setMessages(prev => prev.map(m =>
                            m.id === msgId
                                ? { ...m, videoUrl: statusData.video_url, type: 'video_preview' }
                                : m
                        ));

                    } else if (statusData.status === 'error') {
                        clearInterval(pollInterval);
                        setIsLoading(false);
                        setIsAnimating(null);
                        throw new Error(statusData.error);
                    }
                } catch (e) {
                    console.error("Polling error", e);
                    clearInterval(pollInterval);
                    setIsLoading(false);
                    setIsAnimating(null);
                }
            }, 5000);

        } catch (error) {
            console.error(error);
            setIsLoading(false);
            setIsAnimating(null);
        }
    };

    const handleFileUpload = (e: React.ChangeEvent<HTMLInputElement>) => {
        const file = e.target.files?.[0]
        if (file) {
            const reader = new FileReader()
            reader.onloadend = () => setUploadedImage(reader.result as string)
            reader.readAsDataURL(file)
        }
    }

    return (
        <div className="flex flex-col h-[calc(100vh-64px)] bg-white">
            {/* Header - Now Minimal & Light */}
            <div className="flex items-center justify-between px-6 py-3 border-b border-gray-100 bg-white/80 backdrop-blur-md sticky top-0 z-10">
                <div className="flex items-center gap-3">
                    <div className="h-10 w-10 rounded-xl bg-purple-600 flex items-center justify-center shadow-lg shadow-purple-200">
                        <Sparkles className="w-5 h-5 text-white" />
                    </div>
                    <div>
                        <h2 className="font-bold text-gray-900 leading-tight">AI Director</h2>
                        <p className="text-xs font-medium text-purple-600 bg-purple-50 px-2 py-0.5 rounded-full w-fit">Interactive Studio Pro</p>
                    </div>
                </div>
                <div className="flex gap-2">
                    <Button
                        variant="outline"
                        size="sm"
                        className="hidden md:flex gap-2 border-gray-200 hover:bg-gray-50 text-gray-700"
                        disabled={!finalPlan}
                        onClick={handleFinalizeProject}
                    >
                        {isProcessing ? <Loader2 className="w-4 h-4 animate-spin" /> : <div className="w-2 h-2 rounded-full bg-green-500 animate-pulse" />}
                        {finalPlan ? "Export Project" : "Planning..."}
                    </Button>
                </div>
            </div>

            {/* Chat Area - Full Width & Light */}
            <div className="flex-1 overflow-hidden relative bg-gray-50/50">
                <ScrollArea className="h-full px-4 md:px-[10%] py-6">
                    <div className="max-w-4xl mx-auto flex flex-col gap-6 pb-32">
                        {messages.map((msg, idx) => (
                            <div
                                key={msg.id || idx}
                                className={cn(
                                    "flex gap-4 max-w-[85%]",
                                    msg.role === 'user' ? "ml-auto flex-row-reverse" : ""
                                )}
                            >
                                <Avatar className={cn(
                                    "w-8 h-8 mt-1 border shadow-sm",
                                    msg.role === 'ai' ? "border-purple-100 bg-purple-50" : "border-gray-100 bg-gray-100"
                                )}>
                                    {msg.role === 'assistant' ? (
                                        <div className="flex items-center justify-center text-xs font-bold text-purple-600">AI</div>
                                    ) : (
                                        <div className="flex items-center justify-center text-xs font-bold text-gray-600">ME</div>
                                    )}
                                </Avatar>

                                <div className={cn(
                                    "p-4 rounded-2xl shadow-sm text-sm leading-relaxed",
                                    msg.role === 'user'
                                        ? "bg-gray-900 text-white rounded-tr-sm"
                                        : "bg-white border border-gray-100 text-gray-800 rounded-tl-sm"
                                )}>
                                    {/* Render Text */}
                                    <div className="whitespace-pre-wrap">{msg.content}</div>

                                    {/* Render Media Preview if User Uploaded */}
                                    {msg.type === 'image' && msg.mediaUrl && (
                                        <div className="mt-3 rounded-lg overflow-hidden border border-gray-200 shadow-sm md:max-w-sm">
                                            <img src={msg.mediaUrl} alt="Upload" className="w-full h-auto object-cover" />
                                        </div>
                                    )}

                                    {/* Render AI Attachments (Plan/Spec Card) */}
                                    {msg.role === 'ai' && msg.projectPlan && (
                                        <div className="mt-4 p-4 bg-purple-50/50 rounded-xl border border-purple-100">
                                            <div className="flex items-center gap-2 mb-2">
                                                <div className="p-1 rounded bg-purple-100 text-purple-600">
                                                    <Download className="w-3 h-3" />
                                                </div>
                                                <span className="font-semibold text-gray-900">Project Plan Generated</span>
                                            </div>
                                            <div className="text-xs text-gray-500 mb-3">
                                                Includes visual direction, key shots, and technical specs.
                                            </div>
                                            <Button size="sm" className="w-full bg-white text-purple-700 border border-purple-200 hover:bg-purple-50 shadow-sm">
                                                View Full Plan
                                            </Button>
                                        </div>
                                    )}

                                    {/* Cinema Spec Visualizer with Preview Generation */}
                                    {msg.role === 'ai' && msg.specs && (
                                        <div className="mt-4 space-y-3">
                                            {/* Spec Card */}
                                            <div className="grid grid-cols-2 gap-2 text-xs">
                                                <div className="p-2 bg-gray-50 rounded border border-gray-100">
                                                    <div className="font-medium text-gray-500 mb-0.5">Camera</div>
                                                    <div className="text-gray-900 font-semibold">{msg.specs.camera}</div>
                                                </div>
                                                <div className="p-2 bg-gray-50 rounded border border-gray-100">
                                                    <div className="font-medium text-gray-500 mb-0.5">Lens</div>
                                                    <div className="text-gray-900 font-semibold">{msg.specs.lens}</div>
                                                </div>
                                                <div className="p-2 bg-gray-50 rounded border border-gray-100">
                                                    <div className="font-medium text-gray-500 mb-0.5">Lighting</div>
                                                    <div className="text-gray-900 font-semibold">{msg.specs.lighting}</div>
                                                </div>
                                                <div className="p-2 bg-gray-50 rounded border border-gray-100">
                                                    <div className="font-medium text-gray-500 mb-0.5">Mood</div>
                                                    <div className="text-gray-900 font-semibold">{msg.specs.mood}</div>
                                                </div>
                                            </div>

                                            {/* Action Buttons */}
                                            {!msg.previewUrl && (
                                                <Button
                                                    onClick={() => handleGeneratePreview(msg.id!, recentPrompt, msg.specs)}
                                                    size="sm"
                                                    className="w-full bg-gray-900 text-white hover:bg-gray-800 shadow-sm gap-2"
                                                    disabled={isGeneratingPreview === msg.id}
                                                >
                                                    {isGeneratingPreview === msg.id ? (
                                                        <>
                                                            <Loader2 className="w-3.5 h-3.5 animate-spin" />
                                                            Rendering Studio Preview...
                                                        </>
                                                    ) : (
                                                        <>
                                                            <Sparkles className="w-3.5 h-3.5 text-purple-300" />
                                                            Generate Visual Preview
                                                        </>
                                                    )}
                                                </Button>
                                            )}

                                            {/* Preview Result */}
                                            {msg.previewUrl && (
                                                <div className="relative group rounded-xl overflow-hidden border border-gray-200 shadow-md">
                                                    <MediaPreview
                                                        src={msg.previewUrl}
                                                        type="image"
                                                        isAnimating={isAnimating === msg.id}
                                                        onAnimate={() => handleAnimatePreview(msg.id!, msg.previewUrl!)}
                                                    />
                                                </div>
                                            )}
                                        </div>
                                    )}

                                    {/* Render Storyboard Grid */}
                                    {msg.storyboard && (
                                        <StoryboardGrid
                                            sequence={msg.storyboard}
                                        />
                                    )}

                                </div>
                            </div>
                        ))}
                    </div>
                </ScrollArea>


            </div>

            {/* Input Area - Light Theme */}
            {/* Premium Prompt Console - Light Theme */}
            <div className="p-6 bg-white border-t border-gray-100">
                <div className="max-w-4xl mx-auto">
                    <div className="bg-[#fcfcfc] border border-gray-200 rounded-[2rem] p-4 shadow-[0_20px_50px_rgba(0,0,0,0.05)] transition-all duration-500 focus-within:shadow-[0_20px_60px_rgba(139,92,246,0.1)] focus-within:border-purple-200">

                        {/* Row 1: Upload + Input */}
                        <div className="flex gap-4 items-start mb-4">
                            <div className="flex flex-col">
                                <input
                                    id="file-upload"
                                    type="file"
                                    accept="image/*"
                                    className="hidden"
                                    onChange={handleFileUpload}
                                />
                                <button
                                    onClick={() => document.getElementById('file-upload')?.click()}
                                    className="w-11 h-11 flex items-center justify-center rounded-2xl bg-gray-100 text-gray-400 hover:text-purple-600 hover:bg-purple-50 transition-all border border-gray-100"
                                >
                                    <Paperclip className="w-5 h-5" />
                                </button>
                            </div>

                            <div className="flex-1 flex flex-col relative min-h-[44px]">
                                {uploadedImage && (
                                    <div className="mb-2 relative group w-fit">
                                        <img src={uploadedImage} alt="Upload preview" className="h-16 rounded-xl border border-gray-200 shadow-sm" />
                                        <button
                                            onClick={() => setUploadedImage(null)}
                                            className="absolute -top-2 -right-2 bg-red-500 text-white rounded-full w-5 h-5 flex items-center justify-center text-xs opacity-0 group-hover:opacity-100 transition-opacity"
                                        >
                                            <X className="w-3 h-3" />
                                        </button>
                                    </div>
                                )}
                                <textarea
                                    value={input}
                                    onChange={(e) => setInput(e.target.value)}
                                    onKeyDown={(e) => {
                                        if (e.key === 'Enter' && !e.shiftKey) {
                                            e.preventDefault();
                                            handleSendMessage();
                                        }
                                    }}
                                    placeholder="Describe your cinematic vision..."
                                    className="w-full bg-transparent resize-none outline-none text-[15px] leading-relaxed text-gray-900 placeholder-gray-400 font-medium py-2 min-h-[44px] max-h-[160px]"
                                    rows={1}
                                    style={{ height: 'auto' }}
                                    onInput={(e) => {
                                        const target = e.target as HTMLTextAreaElement;
                                        target.style.height = 'auto';
                                        target.style.height = `${target.scrollHeight}px`;
                                    }}
                                />
                            </div>
                        </div>

                        {/* Row 2: Controls + Generate */}
                        <div className="flex flex-wrap items-center justify-between gap-4 border-t border-gray-100 pt-4">

                            {/* Settings Group */}
                            <div className="flex items-center gap-4 flex-shrink-0">
                                {/* Aspect Ratio */}
                                <div className="flex items-center gap-1 bg-gray-100 p-1 rounded-xl border border-gray-100">
                                    {['16:9', '9:16', '1:1'].map((ratio) => (
                                        <button
                                            key={ratio}
                                            onClick={() => setGenSettings(prev => ({ ...prev, aspectRatio: ratio }))}
                                            className={cn(
                                                "px-2 py-1 rounded-lg text-[10px] font-black tracking-tighter transition-all",
                                                genSettings.aspectRatio === ratio
                                                    ? "bg-white text-purple-600 shadow-sm"
                                                    : "text-gray-400 hover:text-gray-600"
                                            )}
                                        >
                                            {ratio}
                                        </button>
                                    ))}
                                </div>
                                <div className="h-6 w-px bg-gray-200" />
                                {/* Resolution */}
                                <div className="flex items-center gap-1 bg-gray-100 p-1 rounded-xl border border-gray-100">
                                    {['HD', '2K', '4K'].map((res) => (
                                        <button
                                            key={res}
                                            onClick={() => setGenSettings(prev => ({ ...prev, resolution: res }))}
                                            className={cn(
                                                "px-2 py-1 rounded-lg text-[10px] font-black tracking-tight transition-all",
                                                genSettings.resolution === res
                                                    ? "bg-purple-600 text-white shadow-lg shadow-purple-200"
                                                    : "text-gray-400 hover:text-gray-600"
                                            )}
                                        >
                                            {res}
                                        </button>
                                    ))}
                                </div>
                            </div>

                            {/* Preset Tools + Generate */}
                            <div className="flex items-center gap-3 flex-wrap justify-end">
                                <CinemaControls
                                    specs={manualSpecs}
                                    onSpecChange={(key, val) => setManualSpecs((prev: any) => ({ ...prev, [key]: val }))}
                                    className="scale-90 origin-right"
                                />



                                <Button
                                    onClick={handleSendMessage}
                                    disabled={isLoading || (!input && !uploadedImage)}
                                    className="custom-gradient-btn rounded-2xl px-6 h-10 font-bold text-xs uppercase tracking-tight active:scale-95 flex items-center gap-2"
                                >
                                    <span>{isLoading ? "Thinking..." : "Generate"}</span>
                                    {isLoading ? <Loader2 className="w-4 h-4 animate-spin" /> : <Sparkles className="w-4 h-4" />}
                                </Button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    )
}

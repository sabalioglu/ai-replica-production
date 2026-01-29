
"use client"

import { useState, useRef, useEffect } from "react"

import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { ScrollArea } from "@/components/ui/scroll-area"
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar"
import { Card } from "@/components/ui/card"
import { Paperclip, Send, Loader2, Sparkles, Film, Settings2, Download, RefreshCw, X } from "lucide-react"
import { CinemaControls } from "@/components/CinemaControls" // New import

// --- Media Preview Component ---
const MediaPreview = ({ src, type, onAnimate, isAnimating }: { src: string, type: 'image' | 'video', onAnimate?: () => void, isAnimating?: boolean }) => {
    return (
        <div className="mt-3 rounded-xl overflow-hidden border border-gray-200 shadow-sm relative group bg-gray-50">
            {type === 'image' ? (
                <>
                    <img src={src} alt="Preview" className="w-full h-auto object-cover" />
                    {onAnimate && (
                        <div className="absolute bottom-3 right-3 opacity-0 group-hover:opacity-100 transition-opacity">
                            <button
                                onClick={onAnimate}
                                disabled={isAnimating}
                                className="bg-white/90 hover:bg-white text-gray-900 text-xs px-3 py-1.5 rounded-full flex items-center gap-2 border border-gray-200 shadow-md transition-all font-medium"
                            >
                                {isAnimating ? <Loader2 className="w-3 h-3 animate-spin" /> : <Film className="w-3 h-3 text-purple-600" />}
                                {isAnimating ? "Animating..." : "Animate"}
                            </button>
                        </div>
                    )}
                </>
            ) : (
                <div className="relative">
                    <video src={src} controls autoPlay loop className="w-full h-auto" />
                    <div className="absolute top-2 right-2">
                        <a href={src} download className="p-1.5 bg-black/50 text-white rounded-full hover:bg-black/70 transition-colors">
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
    const [messages, setMessages] = useState<Array<{ role: string, content: string | any, id?: string }>>([
        {
            role: 'assistant',
            content: "Hello! I'm your AI Creative Director. Describe your product and vision, or upload an image to start."
        }
    ])
    const [input, setInput] = useState("")
    const [isLoading, setIsLoading] = useState(false)
    const [uploadedImage, setUploadedImage] = useState<string | null>(null)
    const messagesEndRef = useRef<HTMLDivElement>(null)

    // Studio State (Manual Controls)
    const [manualSpecs, setManualSpecs] = useState<any>({
        camera: "",
        lens: "",
        lighting: "",
        mood: ""
    })
    const [showControls, setShowControls] = useState(true) // Always visible on desktop ideally

    const scrollToBottom = () => {
        messagesEndRef.current?.scrollIntoView({ behavior: "smooth" })
    }

    useEffect(() => {
        scrollToBottom()
    }, [messages])

    const handleSendMessage = async () => {
        if ((!input.trim() && !uploadedImage) || isLoading) return

        const userMsg = { role: 'user', content: input }
        setMessages(prev => [...prev, userMsg])
        setInput("")
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
                })
            })

            const data = await response.json()
            if (data.error) throw new Error(data.error)

            // If AI suggests specs, update our manual controls state
            if (typeof data.content === 'object' && data.content.specs) {
                setManualSpecs((prev: any) => ({
                    ...prev,
                    ...data.content.specs
                }))
            }

            setMessages(prev => [...prev, { role: 'assistant', content: data.content }])
            if (uploadedImage) setUploadedImage(null)

        } catch (error) {
            console.error("Chat error:", error)
            setMessages(prev => [...prev, { role: 'assistant', content: `Error: ${error instanceof Error ? error.message : "Connection error"}` }])
        } finally {
            setIsLoading(false)
        }
    }

    const handleGeneratePreview = async () => {
        setIsLoading(true);
        const loadingId = Date.now().toString();

        // Find the last relevant context prompt
        const lastUserMessage = [...messages].reverse().find(m => m.role === 'user')?.content || "Cinematic product shot";

        setMessages(prev => [...prev, { role: 'assistant', content: "Generating preview with current settings...", id: loadingId }]);

        try {
            const response = await fetch(`${process.env.NEXT_PUBLIC_SUPABASE_URL}/functions/v1/cinema-director`, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    "Authorization": `Bearer ${process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY}`
                },
                body: JSON.stringify({
                    action: "generate_preview",
                    prompt: lastUserMessage, // Use chat context + specs
                    specs: manualSpecs // Use MANUAL specs
                })
            });

            if (!response.ok) throw new Error("Preview generation failed");
            const data = await response.json();

            setMessages(prev => prev.map(m =>
                m.id === loadingId
                    ? { role: 'assistant', content: { image_url: data.image_url, type: 'image_preview' } }
                    : m
            ));

        } catch (error) {
            console.error(error);
            setMessages(prev => prev.filter(m => m.id !== loadingId));
        } finally {
            setIsLoading(false);
        }
    };

    const handleAnimatePreview = async (imageUrl: string) => {
        setIsLoading(true);
        const loadingId = Date.now().toString();
        setMessages(prev => [...prev, { role: 'assistant', content: "Animating preview...", id: loadingId }]);

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
                        setMessages(prev => prev.map(m =>
                            m.id === loadingId
                                ? { role: 'assistant', content: { video_url: statusData.video_url, type: 'video_preview' } }
                                : m
                        ));
                    } else if (statusData.status === 'error') {
                        clearInterval(pollInterval);
                        setIsLoading(false);
                        throw new Error(statusData.error);
                    }
                } catch (e) {
                    console.error("Polling error", e);
                    clearInterval(pollInterval);
                    setIsLoading(false);
                }
            }, 5000);

        } catch (error) {
            console.error(error);
            setMessages(prev => prev.filter(m => m.id !== loadingId));
            setIsLoading(false);
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
        <div className="flex justify-center w-full min-h-[800px] p-4 bg-gray-50/50">
            <Card className="flex w-full max-w-6xl h-[800px] shadow-2xl border border-gray-200 overflow-hidden bg-white ring-1 ring-gray-200/50">

                {/* LEFT: Chat & Preview Area */}
                <div className="flex-1 flex flex-col border-r border-gray-100 relative">
                    {/* Header */}
                    <div className="p-4 border-b border-gray-100 bg-white/80 backdrop-blur flex justify-between items-center z-10 sticky top-0">
                        <div className="flex items-center gap-3">
                            <div className="bg-purple-100 p-2 rounded-lg">
                                <Sparkles className="w-5 h-5 text-purple-600" />
                            </div>
                            <div>
                                <h3 className="font-bold text-gray-900 leading-tight">AI Director</h3>
                                <p className="text-xs text-gray-500">Interactive Studio</p>
                            </div>
                        </div>
                        {/* Mobile Toggle for Controls */}
                        <Button variant="ghost" size="icon" className="md:hidden" onClick={() => setShowControls(!showControls)}>
                            <Settings2 className="w-5 h-5 text-gray-500" />
                        </Button>
                    </div>

                    {/* Messages */}
                    <ScrollArea className="flex-1 p-6 bg-gray-50/30">
                        <div className="space-y-6 max-w-2xl mx-auto pb-10">
                            {messages.map((m, i) => (
                                <div key={i} className={`flex gap-4 ${m.role === 'user' ? 'justify-end' : 'justify-start'}`}>
                                    {m.role === 'assistant' && (
                                        <Avatar className="h-8 w-8 mt-1 ring-2 ring-white shadow-sm">
                                            <AvatarImage src="/director-avatar.png" />
                                            <AvatarFallback className="bg-gradient-to-br from-purple-500 to-indigo-600 text-white font-bold text-xs">AI</AvatarFallback>
                                        </Avatar>
                                    )}

                                    <div className={`
                                        relative p-4 rounded-2xl max-w-[85%] text-sm leading-relaxed shadow-sm transition-all
                                        ${m.role === 'user'
                                            ? 'bg-gray-900 text-white rounded-tr-sm'
                                            : 'bg-white border border-gray-100 text-gray-700 rounded-tl-sm hover:shadow-md'}
                                    `}>
                                        {typeof m.content === 'string' ? (
                                            <p className="whitespace-pre-wrap">{m.content}</p>
                                        ) : m.content.type === 'image_preview' ? (
                                            <MediaPreview
                                                src={m.content.image_url}
                                                type="image"
                                                onAnimate={() => handleAnimatePreview(m.content.image_url)}
                                                isAnimating={isLoading}
                                            />
                                        ) : m.content.type === 'video_preview' ? (
                                            <MediaPreview src={m.content.video_url} type="video" />
                                        ) : (
                                            <div className="space-y-2">
                                                <p className="font-medium">{m.content.message}</p>
                                                {/* Specs are now shown in the side panel, but we can summarize here if needed */}
                                                <div className="flex flex-wrap gap-1 mt-2">
                                                    {Object.entries(m.content.specs || {}).map(([k, v]) => (
                                                        <span key={k} className="text-[10px] bg-gray-100 text-gray-500 px-2 py-1 rounded-full border border-gray-200 uppercase tracking-wide">
                                                            {String(v)}
                                                        </span>
                                                    ))}
                                                </div>
                                            </div>
                                        )}
                                    </div>

                                    {m.role === 'user' && (
                                        <Avatar className="h-8 w-8 mt-1 ring-2 ring-white shadow-sm">
                                            <AvatarFallback className="bg-gray-200 text-gray-600 font-bold text-xs">U</AvatarFallback>
                                        </Avatar>
                                    )}
                                </div>
                            ))}
                            <div ref={messagesEndRef} />
                        </div>
                    </ScrollArea>

                    {/* Input */}
                    <div className="p-4 bg-white border-t border-gray-100">
                        {uploadedImage && (
                            <div className="mb-3 relative w-fit group">
                                <img src={uploadedImage} alt="Upload preview" className="h-20 rounded-lg border border-gray-200 shadow-sm object-cover" />
                                <button
                                    onClick={() => setUploadedImage(null)}
                                    className="absolute -top-2 -right-2 bg-white text-gray-400 hover:text-red-500 border border-gray-200 rounded-full w-6 h-6 flex items-center justify-center text-sm shadow-sm transition-colors"
                                >
                                    <X className="w-3 h-3" />
                                </button>
                            </div>
                        )}
                        <div className="flex gap-2 max-w-2xl mx-auto relative bg-gray-50 p-1.5 rounded-full border border-gray-200 focus-within:ring-2 focus-within:ring-purple-100 focus-within:border-purple-300 transition-all shadow-sm">
                            <Button
                                variant="ghost"
                                size="icon"
                                className="text-gray-400 hover:text-purple-600 hover:bg-purple-50 rounded-full"
                                onClick={() => document.getElementById('file-upload')?.click()}
                            >
                                <Paperclip className="w-4 h-4" />
                            </Button>
                            <input
                                id="file-upload"
                                type="file"
                                accept="image/*"
                                className="hidden"
                                onChange={handleFileUpload}
                            />

                            <Input
                                value={input}
                                onChange={(e) => setInput(e.target.value)}
                                onKeyDown={(e) => e.key === 'Enter' && handleSendMessage()}
                                placeholder="Describe your vision..."
                                className="bg-transparent border-0 focus-visible:ring-0 text-gray-800 placeholder:text-gray-400 h-10 px-2"
                                disabled={isLoading}
                            />

                            <Button
                                onClick={handleSendMessage}
                                disabled={isLoading || (!input && !uploadedImage)}
                                size="icon"
                                className="rounded-full bg-purple-600 hover:bg-purple-700 text-white shadow-sm w-10 h-10 shrink-0"
                            >
                                {isLoading ? <Loader2 className="w-4 h-4 animate-spin" /> : <Send className="w-4 h-4 ml-0.5" />}
                            </Button>
                        </div>
                    </div>
                </div>

                {/* RIGHT: Studio Panel (Controls) */}
                {showControls && (
                    <div className="w-[320px] bg-gray-50 border-l border-gray-100 p-6 flex flex-col gap-6 overflow-y-auto">
                        <div>
                            <h4 className="font-bold text-gray-900 mb-1">Studio Settings</h4>
                            <p className="text-xs text-gray-500 mb-4">Customize the visual style manually or let AI decide.</p>

                            {/* Pro Controls Component */}
                            <CinemaControls
                                specs={manualSpecs}
                                onSpecChange={(key, val) => setManualSpecs((prev: any) => ({ ...prev, [key]: val }))}
                            />
                        </div>

                        <div className="h-px bg-gray-200 w-full" />

                        {/* Quick Actions */}
                        <div className="mt-auto space-y-3">
                            <Button
                                onClick={handleGeneratePreview}
                                disabled={isLoading}
                                className="w-full bg-gradient-to-r from-purple-600 to-indigo-600 hover:from-purple-700 hover:to-indigo-700 text-white shadow-lg shadow-purple-200 border-0 h-11"
                            >
                                <Sparkles className="w-4 h-4 mr-2" />
                                Generate New Preview
                            </Button>

                            <Button
                                onClick={() => onFinalize({ messages, specs: manualSpecs })}
                                variant="outline"
                                className="w-full border-gray-300 text-gray-600 hover:bg-gray-100 hover:text-gray-900 h-10"
                            >
                                <CheckCircle2 className="w-4 h-4 mr-2" />
                                Finalize & Export Brief
                            </Button>
                        </div>

                        {/* Status/Tips */}
                        <div className="bg-blue-50 border border-blue-100 p-3 rounded-lg text-xs text-blue-700">
                            <strong>Pro Tip:</strong> Select a specific "Look" to override the AI's default style logic.
                        </div>
                    </div>
                )}
            </Card>
        </div>
    )
}

// Missing icon import catch
import { CheckCircle2 } from "lucide-react"


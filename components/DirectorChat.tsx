
"use client"

import { useState, useRef, useEffect } from "react"

import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { ScrollArea } from "@/components/ui/scroll-area"
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar"
import { Card } from "@/components/ui/card"
import { Paperclip, Send, Clapperboard, CheckCircle2 } from "lucide-react"

interface DirectorChatProps {
    onFinalize: (data: any) => void
}

export function DirectorChat({ onFinalize }: DirectorChatProps) {
    const [isReadyParams, setIsReadyParams] = useState<any>(null)

    // Using verify-less generic chat for now to talk to our edge function proxy
    // In a real Vercel AI SDK setup, we'd point to /api/chat. 
    // Here we simulate the chat hook or use a simple custom implementation 
    // if Vercel SDK isn't fully routed to Supabase Edge Functions yet.
    // For this implementation, we will build a custom chat handler to talk 
    // directly to our 'cinema-director' Edge Function.

    const [messages, setMessages] = useState<Array<{ role: string, content: string }>>([
        {
            role: 'assistant',
            content: "Hello! I'm your AI Creative Director. Let's create a stunning video ad. First, please upload a photo of your product or describe what you want to make."
        }
    ])
    const [input, setInput] = useState("")
    const [isLoading, setIsLoading] = useState(false)
    const [uploadedImage, setUploadedImage] = useState<string | null>(null)

    const messagesEndRef = useRef<HTMLDivElement>(null)

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
            // Call the AI Director Edge Function
            const response = await fetch(`${process.env.NEXT_PUBLIC_SUPABASE_URL}/functions/v1/cinema-director`, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    "Authorization": `Bearer ${process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY}`
                },
                action: "chat",
                prompt: input,
                image_url: uploadedImage || undefined,
                history: [...messages, userMsg], // Send updated history including new user message
            })

            const data = await response.json()

            if (data.error) {
                throw new Error(data.error)
            }

            setMessages(prev => [...prev, { role: 'assistant', content: data.content }])

            // Clear image after sending to not re-send it contextually every time unless needed?
            // For now, let's keep it in state or clear it. Let's clear it to indicate "sent".
            if (uploadedImage) setUploadedImage(null)

            // Check if Director signaled "Ready" (this would come from structured output in a real app)
            // For now, we simulate a "Finalize" button appearing after 3-4 turns or based on keywords.
            // In production, the Edge Function should return a structured `is_ready: true` flag.

        } catch (error) {
            console.error("Chat error:", error)
            setMessages(prev => [...prev, { role: 'assistant', content: "I'm having trouble connecting to the studio. Please try again." }])
        } finally {
            setIsLoading(false)
        }
    }

    const handleFileUpload = (e: React.ChangeEvent<HTMLInputElement>) => {
        const file = e.target.files?.[0]
        if (file) {
            // In a real app, upload to Supabase Storage and get URL.
            // For this demo/MVP, we'll try to use a data URI or presume pre-uploaded URL.
            // Since we can't easily upload to storage without user context here, 
            // let's assume the user pastes a URL or we handle file reading to Data URI (limited size).
            const reader = new FileReader()
            reader.onloadend = () => {
                setUploadedImage(reader.result as string)
            }
            reader.readAsDataURL(file)
        }
    }

    return (
        <Card className="flex flex-col h-[700px] w-full max-w-4xl mx-auto shadow-2xl border-0 overflow-hidden bg-zinc-950 text-zinc-100">

            {/* Header */}
            <div className="p-4 border-b border-zinc-800 bg-zinc-900/50 flex justify-between items-center backdrop-blur">
                <div className="flex items-center gap-3">
                    <Avatar className="h-10 w-10 border border-purple-500/30">
                        <AvatarImage src="/director-avatar.png" />
                        <AvatarFallback className="bg-purple-900 text-purple-200">AI</AvatarFallback>
                    </Avatar>
                    <div>
                        <h3 className="font-semibold text-lg flex items-center gap-2">
                            Creative Director <span className="text-xs bg-purple-500/20 text-purple-400 px-2 py-0.5 rounded-full">BETA</span>
                        </h3>

                    </div>
                </div>

                {/* Finalize Button (Visible when 'Ready') - For testing, always visible but disabled */}
                <Button
                    onClick={() => onFinalize({ messages })} // Pass conversation history as context
                    variant="outline"
                    className="border-green-800 bg-green-900/10 text-green-400 hover:bg-green-900/20 transition-all"
                >
                    <CheckCircle2 className="w-4 h-4 mr-2" />
                    Finalize Brief
                </Button>
            </div>

            {/* Chat Area */}
            <ScrollArea className="flex-1 p-4 bg-[url('/grid-pattern.svg')] bg-repeat opacity-90">
                <div className="space-y-4 max-w-3xl mx-auto">
                    {messages.map((m, i) => (
                        <div key={i} className={`flex gap-3 ${m.role === 'user' ? 'justify-end' : 'justify-start'}`}>

                            {m.role === 'assistant' && (
                                <Avatar className="h-8 w-8 mt-1 border border-zinc-700">
                                    <AvatarFallback className="bg-zinc-800">D</AvatarFallback>
                                </Avatar>
                            )}

                            <div
                                className={`p-3 rounded-2xl max-w-[80%] text-sm leading-relaxed shadow-sm
                  ${m.role === 'user'
                                        ? 'bg-purple-600 text-white rounded-tr-none'
                                        : 'bg-zinc-800/80 border border-zinc-700 text-zinc-200 rounded-tl-none'
                                    }`}
                            >
                                {m.content}

                                {/* Show image preview if this message had an attachment (simulated logic) */}
                                {/* In real app, we'd store attachments in message object */}
                            </div>

                            {m.role === 'user' && (
                                <Avatar className="h-8 w-8 mt-1 border border-zinc-700">
                                    <AvatarFallback className="bg-zinc-800">U</AvatarFallback>
                                </Avatar>
                            )}
                        </div>
                    ))}
                    <div ref={messagesEndRef} />
                </div>
            </ScrollArea>

            {/* Input Area */}
            <div className="p-4 bg-zinc-900/80 border-t border-zinc-800 backdrop-blur-md">

                {uploadedImage && (
                    <div className="mb-2 relative w-fit group">
                        <img src={uploadedImage} alt="Upload preview" className="h-20 rounded-lg border border-zinc-600" />
                        <button
                            onClick={() => setUploadedImage(null)}
                            className="absolute -top-2 -right-2 bg-red-500 text-white rounded-full w-5 h-5 flex items-center justify-center text-xs opacity-0 group-hover:opacity-100 transition-opacity"
                        >
                            ×
                        </button>
                    </div>
                )}

                <div className="flex gap-2 max-w-3xl mx-auto relative">
                    <Button
                        variant="ghost"
                        size="icon"
                        className="text-zinc-400 hover:text-zinc-100 hover:bg-zinc-800"
                        onClick={() => document.getElementById('file-upload')?.click()}
                    >
                        <Paperclip className="w-5 h-5" />
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
                        placeholder="Describe your product, mood, or audience..."
                        className="bg-zinc-950/50 border-zinc-700 focus-visible:ring-purple-500/50 text-zinc-200"
                        disabled={isLoading}
                    />

                    <Button
                        onClick={handleSendMessage}
                        disabled={isLoading || (!input && !uploadedImage)}
                        className="bg-purple-600 hover:bg-purple-500 text-white shadow-lg transition-all"
                    >
                        {isLoading ? (
                            <div className="animate-spin rounded-full h-4 w-4 border-2 border-white/20 border-t-white" />
                        ) : (
                            <Send className="w-4 h-4" />
                        )}
                    </Button>
                </div>
                <p className="text-center text-[10px] text-zinc-500 mt-2">
                    AI Director can make mistakes. Review the final brief before generating.
                </p>
            </div>
        </Card>
    )
}

"use client"

import * as React from "react"
import { X } from "lucide-react"
import { cn } from "@/lib/utils"

interface DialogProps {
    open: boolean
    onOpenChange: (open: boolean) => void
    children: React.ReactNode
    title?: string
}

export function CinemaDialog({ open, onOpenChange, children, title }: DialogProps) {
    if (!open) return null

    // Perfectly centered with heavy backdrop blur and premium scale-in animation
    return (
        <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/40 backdrop-blur-xl animate-in fade-in duration-500">
            <div className="relative w-full max-w-3xl max-h-[85vh] bg-white rounded-[2.5rem] shadow-[0_40px_80px_-20px_rgba(0,0,0,0.4)] overflow-hidden flex flex-col animate-in zoom-in-90 fade-in duration-500 cubic-bezier(0.16, 1, 0.3, 1)">
                <div className="flex items-center justify-between px-6 py-5 border-b border-gray-100 shrink-0 bg-white/80 backdrop-blur-md z-20">
                    <h2 className="text-xl font-black text-gray-900 tracking-tighter uppercase">{title || "Select Option"}</h2>
                    <button
                        onClick={() => onOpenChange(false)}
                        className="p-2.5 rounded-full hover:bg-gray-100 text-gray-400 hover:text-gray-900 transition-all active:scale-90"
                    >
                        <X className="w-5 h-5" />
                    </button>
                </div>
                <div className="flex-1 overflow-y-auto p-4 sm:p-6 scrollbar-thin scrollbar-thumb-gray-300 scrollbar-track-transparent bg-gray-50/50">
                    {children}
                </div>
            </div>
        </div>
    )
}

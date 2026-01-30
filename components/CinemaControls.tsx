"use client"

import React, { useState } from 'react';
import { Camera, Aperture, Sun, Palette, Film, ChevronDown, Check, Scan, MoveVertical, Lightbulb } from 'lucide-react';
import {
    CAMERA_OPTIONS,
    LENS_OPTIONS,
    FILM_STOCK_OPTIONS,
    MOVIE_LOOK_OPTIONS,
    CAMERA_ANGLE_OPTIONS,
    SHOT_FRAMING_OPTIONS,
    LIGHTING_OPTIONS,
    SelectionOption
} from '@/lib/cinema-presets';
import { CinemaDialog } from '@/components/ui/cinema-dialog';
import { cn } from '@/lib/utils';

interface CinemaControlsProps {
    specs: any;
    onSpecChange: (key: string, value: string) => void;
    className?: string;
}

export function CinemaControls({ specs, onSpecChange, className }: CinemaControlsProps) {
    const [activeModal, setActiveModal] = useState<string | null>(null);

    const openModal = (key: string) => setActiveModal(key);
    const closeModal = () => setActiveModal(null);

    const handleSelect = (key: string, value: string) => {
        onSpecChange(key, value);
        closeModal();
    };

    const ControlButton = ({ label, value, icon, onClick, active }: any) => (
        <button
            onClick={onClick}
            className={cn(
                "flex items-center gap-2 px-3 py-2 rounded-lg text-xs font-medium transition-all border shadow-sm whitespace-nowrap",
                active
                    ? "bg-purple-50 border-purple-200 text-purple-700 font-semibold"
                    : "bg-white border-gray-200 text-gray-600 hover:bg-gray-50 hover:text-gray-900"
            )}
        >
            {icon}
            <span className="uppercase tracking-wider">{label}</span>
            {value && (
                <>
                    <div className="w-px h-3 bg-gray-300 mx-1" />
                    <span className="text-gray-900 truncate max-w-[100px] font-semibold">{value}</span>
                </>
            )}
            <ChevronDown className="w-3 h-3 ml-1 opacity-50" />
        </button>
    );

    const renderGrid = (options: SelectionOption[], key: string) => (
        <div className="grid grid-cols-3 gap-2 sm:gap-3">
            {options.map((opt) => {
                const isSelected = specs[key] === opt.label;
                return (
                    <button
                        key={opt.id}
                        onClick={() => handleSelect(key, opt.label)}
                        className={cn(
                            "relative group flex flex-col justify-end aspect-[4/5] rounded-xl border-2 transition-all duration-300 text-left overflow-hidden",
                            isSelected
                                ? "border-purple-600 bg-white shadow-xl shadow-purple-100 ring-2 ring-purple-600/20"
                                : "border-gray-100 bg-white hover:border-gray-300 hover:shadow-lg hover:shadow-gray-200/50"
                        )}
                    >
                        {/* Visual Background - Persistent 100% visibility for premium feel */}
                        {opt.image ? (
                            <>
                                <img
                                    src={opt.image}
                                    alt={opt.label}
                                    className="absolute inset-0 w-full h-full object-cover opacity-90 transition-all duration-500 group-hover:scale-105 group-hover:opacity-100"
                                />
                                <div className="absolute inset-0 bg-gradient-to-t from-black/90 via-black/20 to-transparent transition-opacity duration-300 group-hover:from-black" />
                            </>
                        ) : (
                            <div className={cn(
                                "absolute inset-0 opacity-40 transition-opacity duration-300 group-hover:opacity-60 bg-gradient-to-br",
                                key === 'camera' ? "from-blue-600 via-zinc-900 to-black" :
                                    key === 'lens' ? "from-emerald-600 via-zinc-900 to-black" :
                                        key === 'angle' ? "from-red-600 via-zinc-900 to-black" :
                                            key === 'framing' ? "from-orange-600 via-zinc-900 to-black" :
                                                key === 'lighting' ? "from-yellow-600 via-zinc-900 to-black" :
                                                    key === 'stock' ? "from-cyan-600 via-zinc-900 to-black" :
                                                        "from-purple-600 via-zinc-900 to-black" // mood
                            )} />
                        )}

                        {/* Content Overlay */}
                        <div className="relative z-10 p-3 w-full transition-transform duration-300 group-hover:translate-y-[-2px]">
                            {isSelected && (
                                <div className="absolute top-[-40px] right-2 bg-purple-600 rounded-full p-1 shadow-lg animate-in zoom-in-50">
                                    <Check className="w-3 h-3 text-white" />
                                </div>
                            )}
                            <p className={cn(
                                "font-black uppercase tracking-tighter text-[10px] sm:text-xs leading-tight transition-all duration-300 drop-shadow-md",
                                opt.image ? "text-white" : "text-gray-900"
                            )}>
                                {opt.label}
                            </p>
                            {opt.description && (
                                <p className={cn(
                                    "text-[8px] sm:text-[9px] mt-0.5 line-clamp-1 opacity-70 transition-all duration-300 group-hover:opacity-100",
                                    opt.image ? "text-gray-200" : "text-gray-500"
                                )}>
                                    {opt.description}
                                </p>
                            )}
                        </div>
                    </button>
                );
            })}
        </div>
    );

    return (
        <>
            <div className={cn("flex flex-wrap gap-2 items-center", className)}>
                {/* 1. SUBJECT (Angle + Framing) */}
                <div className="flex items-center gap-1 bg-white/50 p-1 rounded-xl border border-gray-100">
                    <Control
                        label="Subject"
                        icon={<Film className="w-3.5 h-3.5 text-blue-500" />}
                        value={specs.angle || specs.framing ? "Set" : ""}
                        onClick={() => openModal('subject_group')}
                        active={!!(specs.angle || specs.framing)}
                    />
                </div>

                {/* 2. LIGHTING (Source + Stock) */}
                <div className="flex items-center gap-1 bg-white/50 p-1 rounded-xl border border-gray-100">
                    <Control
                        label="Lighting"
                        icon={<Sun className="w-3.5 h-3.5 text-yellow-500" />}
                        value={specs.lighting || specs.stock ? "Set" : ""}
                        onClick={() => openModal('lighting_group')}
                        active={!!(specs.lighting || specs.stock)}
                    />
                </div>

                {/* 3. CAMERA (Body + Lens) */}
                <div className="flex items-center gap-1 bg-white/50 p-1 rounded-xl border border-gray-100">
                    <Control
                        label="Camera"
                        icon={<Camera className="w-3.5 h-3.5 text-emerald-500" />}
                        value={specs.camera || specs.lens ? "Set" : ""}
                        onClick={() => openModal('camera_group')}
                        active={!!(specs.camera || specs.lens)}
                    />
                </div>

                {/* 4. STYLE (Mood/Look) */}
                <div className="flex items-center gap-1 bg-white/50 p-1 rounded-xl border border-gray-100">
                    <Control
                        label="Style"
                        icon={<Palette className="w-3.5 h-3.5 text-purple-500" />}
                        value={specs.mood}
                        onClick={() => openModal('mood')}
                        active={!!specs.mood}
                    />
                </div>
            </div>

            {/* Modals - Rendered outside the scaled container to ensure proper fixed positioning */}
            <CinemaDialog title="Subject Specs" open={activeModal === 'subject_group'} onOpenChange={closeModal}>
                <div className="space-y-6">
                    <div>
                        <h4 className="text-[10px] font-black uppercase tracking-widest text-gray-400 mb-3 ml-1">Angle</h4>
                        {renderGrid(CAMERA_ANGLE_OPTIONS, 'angle')}
                    </div>
                    <div>
                        <h4 className="text-[10px] font-black uppercase tracking-widest text-gray-400 mb-3 ml-1">Framing</h4>
                        {renderGrid(SHOT_FRAMING_OPTIONS, 'framing')}
                    </div>
                </div>
            </CinemaDialog>

            <CinemaDialog title="Lighting & Stock" open={activeModal === 'lighting_group'} onOpenChange={closeModal}>
                <div className="space-y-6">
                    <div>
                        <h4 className="text-[10px] font-black uppercase tracking-widest text-gray-400 mb-3 ml-1">Source</h4>
                        {renderGrid(LIGHTING_OPTIONS, 'lighting')}
                    </div>
                    <div>
                        <h4 className="text-[10px] font-black uppercase tracking-widest text-gray-400 mb-3 ml-1">Film Stock</h4>
                        {renderGrid(FILM_STOCK_OPTIONS, 'stock')}
                    </div>
                </div>
            </CinemaDialog>

            <CinemaDialog title="Camera Rig" open={activeModal === 'camera_group'} onOpenChange={closeModal}>
                <div className="space-y-6">
                    <div>
                        <h4 className="text-[10px] font-black uppercase tracking-widest text-gray-400 mb-3 ml-1">Body</h4>
                        {renderGrid(CAMERA_OPTIONS, 'camera')}
                    </div>
                    <div>
                        <h4 className="text-[10px] font-black uppercase tracking-widest text-gray-400 mb-3 ml-1">Lens</h4>
                        {renderGrid(LENS_OPTIONS, 'lens')}
                    </div>
                </div>
            </CinemaDialog>

            <CinemaDialog title="Select Visual Style" open={activeModal === 'mood'} onOpenChange={closeModal}>
                {renderGrid(MOVIE_LOOK_OPTIONS, 'mood')}
            </CinemaDialog>
        </>
    );
}

// Internal helper alias
const Control = ({ label, value, icon, onClick, active }: any) => (
    <button
        onClick={onClick}
        className={cn(
            "flex items-center gap-2 px-3 py-2 rounded-lg text-xs font-medium transition-all border shadow-sm whitespace-nowrap active:scale-95",
            active
                ? "bg-purple-50 border-purple-200 text-purple-700 font-semibold"
                : "bg-white border-gray-200 text-gray-600 hover:bg-gray-50 hover:text-gray-900"
        )}
    >
        {icon}
        <span className="uppercase tracking-wider">{label}</span>
        {value && (
            <>
                <div className="w-px h-3 bg-gray-300 mx-1" />
                <span className="text-gray-900 truncate max-w-[100px] font-semibold">{value}</span>
            </>
        )}
        <ChevronDown className="w-3 h-3 ml-1 opacity-50" />
    </button>
);


import React from 'react';
import { Camera, Aperture, Sun, Palette, Film } from 'lucide-react'; // Added icons
import {
    CAMERA_OPTIONS,
    LENS_OPTIONS,
    LIGHTING_OPTIONS,
    MOVIE_LOOK_OPTIONS,
    SelectionOption
} from '@/lib/cinema-presets';

interface CinemaControlsProps {
    specs: any;
    onSpecChange: (key: string, value: string) => void;
    className?: string; // Allow custom classNames for layout
}

export function CinemaControls({ specs, onSpecChange, className }: CinemaControlsProps) {

    // Helper to render a select group
    const renderSelect = (label: string, icon: React.ReactNode, options: SelectionOption[], value_key: string) => (
        <div className="space-y-1.5">
            <label className="text-xs font-semibold text-gray-500 uppercase tracking-wider flex items-center gap-1.5">
                {icon}
                {label}
            </label>
            <div className="relative">
                <select
                    value={specs[value_key] || ''}
                    onChange={(e) => onSpecChange(value_key, e.target.value)}
                    className="w-full bg-gray-50 border border-gray-200 text-gray-900 text-sm rounded-lg focus:ring-purple-500 focus:border-purple-500 block p-2.5 appearance-none cursor-pointer hover:bg-white hover:border-purple-300 transition-colors"
                >
                    <option value="">Auto / AI Recommended</option>
                    {options.map((opt) => (
                        <option key={opt.id} value={opt.label}>
                            {opt.label}
                        </option>
                    ))}
                </select>
                {/* Custom arrow if needed, but browser default is okay for now or use lucide ChevronDown absolute right */}
            </div>
        </div>
    );

    return (
        <div className={`grid grid-cols-2 gap-4 ${className}`}>
            {renderSelect("Camera", <Camera className="w-3.5 h-3.5" />, CAMERA_OPTIONS, "camera")}
            {renderSelect("Lens", <Aperture className="w-3.5 h-3.5" />, LENS_OPTIONS, "lens")}
            {renderSelect("Lighting", <Sun className="w-3.5 h-3.5" />, LIGHTING_OPTIONS, "lighting")}
            {renderSelect("Look", <Palette className="w-3.5 h-3.5" />, MOVIE_LOOK_OPTIONS, "mood")}
            {/* Mapping "mood" key to MOVIE_LOOK_OPTIONS for now as it aligns with "Style/Mood" */}
        </div>
    );
}

export interface StoryboardFrameDetails {
    frame_number: number;
    shot_type: string;
    camera_angle: string;
    description: string;
    background_id: string;
    consistency_rules?: string;
    lighting_override?: string;
    mood_override?: string;
    is_keyframe_b?: boolean; // True if this is an "End Frame"
    linked_frame_id?: string; // ID/Number of the paired Start/End frame
    motion_description?: string; // Description of the movement between A and B
    url?: string;
    video_url?: string;
    status?: 'idle' | 'generating' | 'completed' | 'error';
}

export interface StoryboardBackground {
    id: string;
    description: string;
    url?: string;
}

export interface PopcornSequence {
    plan: {
        backgrounds: StoryboardBackground[];
        frames: StoryboardFrameDetails[];
        consistency_rules?: string;
    };
    references: Array<{
        type: string;
        url: string;
        description: string;
        key_features: string[];
    }>;
}

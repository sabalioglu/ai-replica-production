
export interface StoryboardFrameDetails {
    frame_number: number;
    shot_type: string;
    camera_angle: string;
    description: string;
    background_id: string;
    consistency_rules?: string;
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
    };
    references: any[];
}

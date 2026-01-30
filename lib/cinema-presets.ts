
export interface SelectionOption {
    id: string;
    label: string;
    image: string | null;
    description?: string;
    value?: string; // For prompt engineering if different from label
}

// 1. CAMERA BODIES
export const CAMERA_OPTIONS: SelectionOption[] = [
    { id: 'cam-16mm', label: '16mm Film Camera', image: '/assets/Camera Bodies/16 mm FILM CAMERA.png' },
    { id: 'cam-35mm', label: '35mm Film Camera', image: '/assets/Camera Bodies/35 mm FILM CAMERA.png' },
    { id: 'cam-8mm', label: '8mm Film Camera', image: '/assets/Camera Bodies/8 mm FILM CAMERA.png' },
    { id: 'cam-aaton', label: 'Aaton XTR', image: '/assets/Camera Bodies/AATON XTR.png' },
    { id: 'cam-alexa65', label: 'ARRI Alexa 65', image: '/assets/Camera Bodies/ARRI ALEXA 65.png' },
    { id: 'cam-alexamini', label: 'ARRI Alexa Mini', image: '/assets/Camera Bodies/ARRI ALEXA MINI.png' },
    { id: 'cam-blackmagic', label: 'Blackmagic URSA', image: '/assets/Camera Bodies/BLACKMAGIC URSA.png' },
    { id: 'cam-bolex', label: 'Bolex H16', image: '/assets/Camera Bodies/BOLEX H16.png' },
    { id: 'cam-c500', label: 'Canon C500', image: '/assets/Camera Bodies/CANON C500.png' },
    { id: 'cam-r5', label: 'Canon EOS R5', image: '/assets/Camera Bodies/CANON EOS R5.png' },
    { id: 'cam-xt4', label: 'Fujifilm X-T4', image: '/assets/Camera Bodies/FUJIFILM X‑T4.png' },
    { id: 'cam-hasselblad', label: 'Hasselblad X1D II', image: '/assets/Camera Bodies/HASSELBLAD X1D II.png' },
    { id: 'cam-panavision', label: 'Panavision Panaflex', image: '/assets/Camera Bodies/PANAVISION PANAFLEX.png' },
    { id: 'cam-red-komodo', label: 'RED Komodo', image: '/assets/Camera Bodies/RED KOMODO.png' },
    { id: 'cam-red-vraptor', label: 'RED V-Raptor', image: '/assets/Camera Bodies/RED V‑RAPTOR.png' },
    { id: 'cam-sony-venice', label: 'Sony Venice', image: '/assets/Camera Bodies/SONY VENICE.png' },
    { id: 'cam-sony-fx6', label: 'Sony FX6', image: '/assets/Camera Bodies/SONY FX6.png' },
];

// 2. LENSES (Optics & Perspective) - Refined Technical Distinction
export const LENS_OPTIONS: SelectionOption[] = [
    { id: 'ln-14mm', label: '14mm Ultra Wide', image: '/assets/ui/optimized/ln_14mm.jpg', description: 'Extremely wide field of view with significant spatial expansion.' },
    { id: 'ln-24mm', label: '24mm Wide Angle', image: '/assets/ui/optimized/ln_24mm.jpg', description: 'Standard wide lens for architectural or environmental depth.' },
    { id: 'ln-35mm', label: '35mm Standard', image: '/assets/Focal Length/35mm Standard.png', description: 'Natural perspective, legendary for storytelling and street photography.' },
    { id: 'ln-50mm', label: '50mm Normal', image: '/assets/Focal Length/50mm Normal.png', description: 'Mimics the human eye perspective with minimal distortion.' },
    { id: 'ln-85mm', label: '85mm Portrait', image: '/assets/Focal Length/85mm Portrait.png', description: 'Flattering compression, ideal for subject isolation (bokeh).' },
    { id: 'ln-100mm', label: '100mm Macro', image: '/assets/Focal Length/100mm Macro.png', description: 'Specialized for extreme close-up detail with high magnification.' },
    { id: 'ln-135mm', label: '135mm Telephoto', image: '/assets/Focal Length/135mm Telephoto.png', description: 'Tight compression, pulls distant subjects closer to the background.' },
    { id: 'ln-200mm', label: '200mm Long Telephoto', image: '/assets/Focal Length/200mm Long Telephoto.png', description: 'Extreme background compression and very narrow field of view.' },
];

// 3. ANGLE (Creative Perspective)
export const CAMERA_ANGLE_OPTIONS: SelectionOption[] = [
    { id: 'ang-eye', label: 'Eye Level', image: '/assets/ui/optimized/angle_eye_level.jpg', description: 'Natural perspective, mimics human sight.' },
    { id: 'ang-low', label: 'Low Angle', image: '/assets/ui/optimized/angle_low_angle.jpg', description: 'Shot from below, makes subject look heroic.' },
    { id: 'ang-high', label: 'High Angle', image: '/assets/ui/optimized/angle_high_angle.jpg', description: 'Shot from above, emphasizing vulnerability.' },
    { id: 'ang-bird', label: 'Bird\'s Eye View', image: '/assets/ui/optimized/ang_bird.jpg', description: 'Directly overhead for layout clarity.' },
    { id: 'ang-worm', label: 'Worm\'s Eye View', image: '/assets/ui/optimized/ang_worm.jpg', description: 'Extreme low perspective from the ground.' },
    { id: 'ang-dutch', label: 'Dutch Angle', image: '/assets/ui/optimized/ang_dutch.jpg', description: 'Tilted horizon to create unease.' },
    { id: 'ang-pov', label: 'POV', image: '/assets/ui/optimized/ang_pov.jpg', description: 'Seeing through the eyes of a character.' },
];

// 4. FRAMING (Compositional Scope)
export const SHOT_FRAMING_OPTIONS: SelectionOption[] = [
    { id: 'frm-ecu', label: 'Extreme Close Up', image: '/assets/ui/optimized/frm_ecu.jpg', description: 'Focus on minute details like eyes.' },
    { id: 'frm-cu', label: 'Close Up', image: '/assets/ui/optimized/frm_cu.jpg', description: 'Face/Subject focus for intimacy.' },
    { id: 'frm-ms', label: 'Medium Shot', image: '/assets/ui/optimized/frm_ms.jpg', description: 'Standard compositional framing.' },
    { id: 'frm-cowboy', label: 'Cowboy Shot', image: '/assets/ui/optimized/frm_cowboy.jpg', description: 'Mid-thigh up, heroic framing.' },
    { id: 'frm-ws', label: 'Wide Shot', image: '/assets/ui/optimized/frm_ws.jpg', description: 'Subject within their environment.' },
    { id: 'frm-ews', label: 'Extreme Wide Shot', image: '/assets/ui/optimized/frm_ews.jpg', description: 'Large scale landscape composition.' },
];

// 5. LIGHTING (Atmosphere & Source)
export const LIGHTING_OPTIONS: SelectionOption[] = [
    { id: 'lgt-natural', label: 'Natural Light', image: '/assets/ui/optimized/lighting_natural.jpg', description: 'Authentic ambient illumination.' },
    { id: 'lgt-golden', label: 'Golden Hour', image: '/assets/ui/optimized/lighting_golden.jpg', description: 'Warm sunset glow for aesthetics.' },
    { id: 'lgt-blue', label: 'Blue Hour', image: '/assets/ui/optimized/lighting_blue.jpg', description: 'Cool twilight atmospheric light.' },
    { id: 'lgt-noon', label: 'Hard Noon Light', image: '/assets/ui/optimized/lighting_noon.jpg', description: 'Harsh shadows and high contrast.' },
    { id: 'lgt-studio', label: 'Studio Lighting', image: '/assets/ui/optimized/lighting_studio.jpg', description: 'Professional, controlled setup.' },
    { id: 'lgt-neon', label: 'Cyberpunk Neon', image: '/assets/ui/optimized/lighting_neon.jpg', description: 'Electric, vibrant nightlife colors.' },
    { id: 'lgt-softbox', label: 'Softbox', image: '/assets/ui/optimized/lighting_softbox.jpg', description: 'Soft, flattering diffused source.' },
    { id: 'lgt-cinematic', label: 'Dramatic Cinematic', image: '/assets/ui/optimized/lighting_cinematic.jpg', description: 'High contrast mood lighting.' },
];

// 6. FILM STOCK (Replaces Lighting/Generic) - from Assets/Film Stock
export const FILM_STOCK_OPTIONS: SelectionOption[] = [
    { id: 'fs-bw', label: 'Black & White', image: '/assets/Film Stock/Black and White Film (Generic Preset).png' },
    { id: 'fs-cinestill800', label: 'Cinestill 800T', image: '/assets/Film Stock/Cinestill 800T.png' },
    { id: 'fs-cinestill50', label: 'Cinestill 50D', image: '/assets/Film Stock/Cinestill 50D.png' },
    { id: 'fs-portra400', label: 'Kodak Portra 400', image: '/assets/Film Stock/Kodak Portra 400.png' },
    { id: 'fs-portra800', label: 'Kodak Portra 800', image: '/assets/Film Stock/Kodak Portra 800.png' },
    { id: 'fs-vision3', label: 'Kodak Vision3 500T', image: '/assets/Film Stock/Kodak Vision3 500T.png' },
    { id: 'fs-gold200', label: 'Kodak Gold 200', image: '/assets/Film Stock/Kodak Gold 200.png' },
    { id: 'fs-ektar100', label: 'Kodak Ektar 100', image: '/assets/Film Stock/Kodak Ektar 100.png' },
    { id: 'fs-tri-x', label: 'Kodak Tri-X 400', image: '/assets/Film Stock/Kodak Tri-X 400.png' },
    { id: 'fs-fuji-provia', label: 'Fuji Provia 100F', image: '/assets/Film Stock/Fuji Provia 100F.png' },
    { id: 'fs-fuji-velvia', label: 'Fuji Velvia 50', image: '/assets/Film Stock/Fuji Velvia 50.png' },
    { id: 'fs-technicolor', label: 'Technicolor', image: '/assets/Film Stock/Technicolor.png' },
    { id: 'fs-ilford-delta', label: 'Ilford Delta 3200', image: '/assets/Film Stock/Ilford Delta 3200.png' },
];

// 7. MOOD / LOOK - from Assets/Movie Look & Aesthetic
export const MOVIE_LOOK_OPTIONS: SelectionOption[] = [
    { id: 'mv-bladerunner', label: 'Blade Runner', image: '/assets/Movie Look & Aesthetic/Blade Runner (Aesthetic).jpeg' },
    { id: 'mv-matrix', label: 'The Matrix', image: '/assets/Movie Look & Aesthetic/The Matrix (Aesthetic).jpeg' },
    { id: 'mv-wes', label: 'Wes Anderson', image: '/assets/Movie Look & Aesthetic/Wes Anderson.jpeg' },
    { id: 'mv-nolan', label: 'Christopher Nolan', image: '/assets/Movie Look & Aesthetic/Christopher Nolan.jpeg' },
    { id: 'mv-fincher', label: 'David Fincher', image: '/assets/Movie Look & Aesthetic/David Fincher.jpeg' },
    { id: 'mv-tarantino', label: 'Quentin Tarantino', image: '/assets/Movie Look & Aesthetic/Quentin Tarantino.jpeg' },
    { id: 'mv-kubrick', label: 'Stanley Kubrick', image: '/assets/Movie Look & Aesthetic/Stanley Kubrick.jpeg' },
    { id: 'mv-dune', label: 'Denis Villeneuve', image: '/assets/Movie Look & Aesthetic/Denis Villeneuve.jpeg' },
    { id: 'mv-deakins', label: 'Roger Deakins', image: '/assets/Movie Look & Aesthetic/Roger Deakins.jpeg' },
    { id: 'mv-noir', label: 'Film Noir', image: '/assets/Movie Look & Aesthetic/Film Noir.jpeg' },
    { id: 'mv-neonoir', label: 'Neo-Noir', image: '/assets/Movie Look & Aesthetic/Neo-Noir.jpeg' },
    { id: 'mv-wong', label: 'Wong Kar-wai', image: '/assets/Movie Look & Aesthetic/Wong Kar-wai.jpeg' },
];

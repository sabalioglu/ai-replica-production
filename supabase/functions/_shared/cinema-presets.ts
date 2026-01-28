
export interface SelectionOption {
    id: string;
    label: string;
    description?: string;
    type: 'camera' | 'lens' | 'film_stock' | 'lighting' | 'angle' | 'shot_type' | 'look' | 'genre' | 'photographer';
}

export const CAMERA_OPTIONS: SelectionOption[] = [
    { id: 'arri-alexa-65', label: 'ARRI ALEXA 65', type: 'camera' },
    { id: 'arri-alexa-mini', label: 'ARRI ALEXA MINI', type: 'camera' },
    { id: 'blackmagic-ursa', label: 'BLACKMAGIC URSA', type: 'camera' },
    { id: 'canon-c500', label: 'CANON C500', type: 'camera' },
    { id: 'canon-eos-r5', label: 'CANON EOS R5', type: 'camera' },
    { id: 'fujifilm-xt4', label: 'FUJIFILM X-T4', type: 'camera' },
    { id: 'red-komodo', label: 'RED KOMODO', type: 'camera' },
    { id: 'red-v-raptor', label: 'RED V-RAPTOR', type: 'camera' },
    { id: 'sony-fx6', label: 'SONY FX6', type: 'camera' },
    { id: 'sony-venice', label: 'SONY VENICE', type: 'camera' },
    { id: '16mm-film-camera', label: '16mm FILM CAMERA', type: 'camera' },
    { id: '35mm-film-camera', label: '35mm FILM CAMERA', type: 'camera' },
    { id: '8mm-film-camera', label: '8mm FILM CAMERA', type: 'camera' },
    { id: 'bolex-h16', label: 'BOLEX H16', type: 'camera' },
    { id: 'panavision-panaflex', label: 'PANAVISION PANAFLEX', type: 'camera' },
];

export const LENS_OPTIONS: SelectionOption[] = [
    { id: '14mm-ultra-wide', label: '14mm Ultra Wide', type: 'lens' },
    { id: '24mm-wide-angle', label: '24mm Wide Angle', type: 'lens' },
    { id: '35mm-standard', label: '35mm Standard', type: 'lens' },
    { id: '50mm-normal', label: '50mm Normal', type: 'lens' },
    { id: '85mm-portrait', label: '85mm Portrait', type: 'lens' },
    { id: '100mm-macro', label: '100mm Macro', type: 'lens' },
    { id: '135mm-telephoto', label: '135mm Telephoto', type: 'lens' },
    { id: '200mm-long-telephoto', label: '200mm Long Telephoto', type: 'lens' },
];

export const FILM_STOCK_OPTIONS: SelectionOption[] = [
    { id: 'kodak-portra-400', label: 'Kodak Portra 400', type: 'film_stock' },
    { id: 'kodak-portra-800', label: 'Kodak Portra 800', type: 'film_stock' },
    { id: 'kodak-gold-200', label: 'Kodak Gold 200', type: 'film_stock' },
    { id: 'kodak-ektar-100', label: 'Kodak Ektar 100', type: 'film_stock' },
    { id: 'kodak-tri-x-400', label: 'Kodak Tri-X 400', type: 'film_stock' },
    { id: 'kodak-vision3-500t', label: 'Kodak Vision3 500T', type: 'film_stock' },
    { id: 'cinestill-800t', label: 'Cinestill 800T', type: 'film_stock' },
    { id: 'cinestill-50d', label: 'Cinestill 50D', type: 'film_stock' },
    { id: 'fuji-provia-100f', label: 'Fuji Provia 100F', type: 'film_stock' },
    { id: 'fuji-velvia-50', label: 'Fuji Velvia 50', type: 'film_stock' },
    { id: 'fuji-superia-400', label: 'Fuji Superia 400', type: 'film_stock' },
    { id: 'ilford-hp5-plus', label: 'Ilford HP5 Plus', type: 'film_stock' },
    { id: 'ilford-delta-3200', label: 'Ilford Delta 3200', type: 'film_stock' },
    { id: 'technicolor', label: 'Technicolor', type: 'film_stock' },
];

export const MOVIE_LOOK_OPTIONS: SelectionOption[] = [
    { id: 'blade-runner', label: 'Blade Runner Aesthetic', type: 'look' },
    { id: 'the-matrix', label: 'The Matrix Aesthetic', type: 'look' },
    { id: 'wes-anderson', label: 'Wes Anderson', type: 'look' },
    { id: 'christopher-nolan', label: 'Christopher Nolan', type: 'look' },
    { id: 'denis-villeneuve', label: 'Denis Villeneuve', type: 'look' },
    { id: 'david-fincher', label: 'David Fincher', type: 'look' },
    { id: 'quintin-tarantino', label: 'Quentin Tarantino', type: 'look' },
    { id: 'stanley-kubrick', label: 'Stanley Kubrick', type: 'look' },
    { id: 'ridley-scott', label: 'Ridley Scott', type: 'look' },
    { id: 'roger-deakins', label: 'Roger Deakins', type: 'look' },
    { id: 'terrence-malick', label: 'Terrence Malick', type: 'look' },
    { id: 'wong-kar-wai', label: 'Wong Kar-wai', type: 'look' },
    { id: 'film-noir', label: 'Film Noir', type: 'look' },
    { id: 'neo-noir', label: 'Neo-Noir', type: 'look' },
];

export const GENRE_OPTIONS: SelectionOption[] = [
    { id: 'cinematic', label: 'Cinematic', type: 'genre' },
    { id: 'commercial', label: 'Commercial', type: 'genre' },
    { id: 'fashion', label: 'Fashion', type: 'genre' },
    { id: 'portrait', label: 'Portrait', type: 'genre' },
    { id: 'product', label: 'Product Photography', type: 'genre' },
    { id: 'landscape', label: 'Landscape', type: 'genre' },
    { id: 'documentary', label: 'Documentary', type: 'genre' },
    { id: 'editorial', label: 'Editorial', type: 'genre' },
    { id: 'photojournalism', label: 'Photojournalism', type: 'genre' },
    { id: 'street', label: 'Street Photography', type: 'genre' },
    { id: 'architectural', label: 'Architectural', type: 'genre' },
];

export const LIGHTING_OPTIONS: SelectionOption[] = [
    { id: 'natural', label: 'Natural Light', type: 'lighting' },
    { id: 'golden-hour', label: 'Golden Hour', type: 'lighting' },
    { id: 'blue-hour', label: 'Blue Hour', type: 'lighting' },
    { id: 'hard-lighting', label: 'Hard Lighting', type: 'lighting' },
    { id: 'soft-lighting', label: 'Soft Lighting', type: 'lighting' },
    { id: 'volumetric', label: 'Volumetric Lighting', type: 'lighting' },
    { id: 'neon', label: 'Neon Glow', type: 'lighting' },
    { id: 'chiaroscuro', label: 'Chiaroscuro', type: 'lighting' },
];

export const SHOT_TYPE_OPTIONS: SelectionOption[] = [
    { id: 'close-up', label: 'Close Up', type: 'shot_type' },
    { id: 'medium-shot', label: 'Medium Shot', type: 'shot_type' },
    { id: 'wide-shot', label: 'Wide Shot', type: 'shot_type' },
    { id: 'cinematic-wide', label: 'Cinematic Wide', type: 'shot_type' },
    { id: 'pov', label: 'POV', type: 'shot_type' },
];

export const ANGLE_OPTIONS: SelectionOption[] = [
    { id: 'eye-level', label: 'Eye Level', type: 'angle' },
    { id: 'low-angle', label: 'Low Angle', type: 'angle' },
    { id: 'high-angle', label: 'High Angle', type: 'angle' },
    { id: 'dutch-angle', label: 'Dutch Angle', type: 'angle' },
    { id: 'birds-eye', label: 'Bird\'s Eye', type: 'angle' },
];

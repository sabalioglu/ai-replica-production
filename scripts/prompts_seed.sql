-- Auto-generated Prompt Seed File
TRUNCATE TABLE cinematic_prompts;
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Wide quote card with portrait and Chinese/English customization',
                    'A prompt for generating a wide quote card featuring a famous person’s portrait, with a brown background, light-gold serif quote text, and layout where text occupies two-thirds and the person one-third. The quote text and author are parameterized for reuse.',
                    'A wide quote card featuring a famous person, with a brown background and a light-gold serif font for the quote: “{argument name="famous_quote" default="Stay Hungry, Stay Foolish"}” and smaller text: “—{argument name="author" default="Steve Jobs"}.” There is a large, subtle quotation mark before the text. The portrait of the person is on the left, the text on the right. The text occupies two-thirds of the image and the portrait one-third, with a slight gradient transition effect on the portrait.',
                    'Portrait',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1763886933714_5zqn1e_G6QBjQHbgAE3Yt_.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Premium liquid glass Bento grid product infographic with 8 modules',
                    'Create an Infographics with bento grid 8 module layout, user can specify any product name in Food, Medicine, tech etc category, choose language, Background style, Hero grid style',
                    'Input Variable: [insert product name]
Language: [insert language]

System Instruction:
Create an image of premium liquid glass Bento grid product infographic with 8 modules (card 2 to 8 show text titles only).
1) Product Analysis:
→ Identify product''s dominant natural color → "hero color"
→ Identify category: FOOD / MEDICINE / TECH
2) Color Palette (derived from hero):
→ Product + accents: full saturation hero color
→ Icons, borders: muted hero (30-40% saturation, never black)
3) Visual Style:
→ Hero product: real photography (authentic, premium), 3D Glass version [choose one]
→ Cards: Apple liquid glass (85-90% transparent) with Whisper-thin borders and Subtle drop shadow for floating depth and reflecting the background color
→ Background stays behind cards and high blur where cards are [choose one]:
  - Ethereal: product essence, light caustics, abstract glow
  - Macro: product texture close-up, heavily blurred
  - Pattern: product repeated softly at 10-15% opacity
  - Context: relevant environment, blurred + desaturated
→ Add subtle motion effect
→ Asymmetric Bento grid, 16:9 landscape
→ Hero card: 28-30% | Info modules: 70-72%
4) Module Content (8 Cards):
M1 — Hero: Product displayed as real photo / 3D glass / stylized interpretation (choose one)in beautiful form + product name label
M2 — Core Benefits: 4 unique benefits + hero-color icons
M3 — How to Use: 4 usage methods + icons
M4 — Key Metrics: 5 EXACT data points
Format: [icon] [Label] [Bold Value] [Unit]
FOOD: Calories: [X] kcal/100g, Carbs: [X]g (fiber [X]g, sugar [X]g), Protein: [X]g, [Key Vitamin]: [X]mg ([X]% DV), [Key Mineral]: [X]mg ([X]% DV)
MEDICINE:Active: [name], Strength: [X] mg, Onset: [X] min, Duration: [X] hrs, Half-life: [X] hrs 
TECH:Chip: [model], Battery: [X] hrs, Weight: [X]g,[Key spec]: [value], Connectivity: [protocols]
M5 — Who It''s For: 4 recommended groups with green checkmark icons | 3 caution groups with amber warning icons
M6 — Important Notes: 4 precautions + warning icons
M7 — Quick Reference:
→ FOOD: Glycemic Index + dietary tags with icons
→ MEDICINE: Side effects + severity with icons
→ TECH: Compatibility + certifications with icons
M8 — Did You Know: 3 facts (origin, science, global stat) + icons
Output: 1 image, 16:9 landscape, ultra-premium liquid glass infographic.',
                    'Product',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1768962051381_l9uih4_537980579-6f29d32a-c786-40c4-bd5a-79c640737496.png'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Hand-drawn style header image prompt from photo',
                    'Prompt for a hand-drawn style header image of a person introducing Nano Banana Pro',
                    'Completely recreate the uploaded person.
Make it a header image for a note article where that person introduces “Nano Banana Pro”.
Aspect ratio: horizontal 16:9.
Style and colors: simple, hand-drawn style, italic, with a blue and green gradient.
Title text: “In-depth explanation of Google’s new AI ‘Nano Banana Pro’”.',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1763885651870_4szbai_G6VZiROagAAqsIh.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Watercolor map of Germany with labeled states',
                    'A German prompt to generate a watercolor-style map of Germany where all federal states are labeled in ballpoint pen, useful for educational or infographic-style maps.',
                    'Generate a map of Germany in watercolor style, on which all federal states are labeled in ballpoint pen.',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1763886061720_fzgqaq_G6RIeSZXgAA7cOf.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'New Year''s Day Special: Four-Panel Puzzle for 2026 Blessing',
                    'A detailed multi-panel prompt for Nano Banana Pro, creating a 2x2 grid photo collage where a single female character, in four different outfits and settings, pieces together a puzzle that spells ''2026 New Year''s Day Happy'' in the center. The prompt specifies precise facial feature retention, clothing details, background elements, and photographic parameters for a fashion magazine style.',
                    '[Key: Maintain precise facial features, retain original face structure, the character in the image must be completely consistent with the uploaded reference image] High-end photo studio 2x2 grid photo. Top-left panel (Navy Blue background): The character wears a navy blue uniform-style dress, decorated with gold buttons, vintage curls with a blue beret and pearl earrings. She holds up a huge puzzle piece (top-left piece, with the number "20" on it) with both hands, moving it towards the center of the frame. Her eyes are focused on the central puzzle area, her expression is serious, with a slight smile. The background features navy stripes, an anchor, and the text "Set Sail for the New Year". Top-right panel (Cherry Blossom Pink background): The same woman wears a pink lace dress, a pearl necklace, a princess hairstyle with a pink rose hairpin and crystal earrings. She holds up the top-right puzzle piece (with the number "26" on it) with both hands, moving it towards the center to connect with the top-left piece. Her eyes look at the puzzle seam, her expression is focused and expectant, and her body leans forward. The background features pink cherry blossoms, the text "Beautiful Encounter", butterflies, and petals. Bottom-left panel (Mint Green background): The same woman wears a mint green cotton and linen dress, in an artistic style, with natural long hair, a green hairband, and wooden earrings. She holds up the bottom-left puzzle piece (with the text "New Year''s Day" on it) with both hands, moving it upwards to connect with the top-left piece. Her eyes look at the puzzle, her expression is serious, and her mouth is slightly pursed. The background features green plants, the text "Hope Grows", new sprouts, and leaves. Bottom-right panel (Lemon Yellow background): The same woman wears a yellow dress with a sunflower pattern, pigtails with yellow bows. She pushes in the last bottom-right puzzle piece (with the text "Happy" on it) to complete the puzzle. The four pieces perfectly form the complete pattern "2026 New Year''s Day Happy" in the center of the frame. She tilts her head back, looking at the completed puzzle, her face beaming with a successful, joyful smile. The center of the frame bursts with golden light and confetti. The background features a yellow sun, the text "Complete Success", smiley faces, and sunflowers. The puzzle pieces converge from the four corners to the center to form a complete picture. Clear makeup, bright ring light, 85mm lens, f/1.8 aperture, four-panel composition with puzzle interaction, fashion magazine style.',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1767455034932_ivuvu0_G9V-MszakAEAIBw.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Vintage Patent Document for an Invention',
                    'A prompt designed to generate an image of a vintage United States patent document from the late 1800s. It specifies details like precise technical drawings, handwritten annotations, aged paper texture, foxing stains, an embossed seal, and a wax stamp, making it ideal for historical or archival aesthetics.',
                    'A vintage patent document for {argument name="invention" default="INVENTION"}, styled after late 1800s United States Patent Office filings. The page features precise technical drawings with numbered callouts (Fig. 1, Fig. 2, Fig. 3) showing front, side, and exploded views. Handwritten annotations in fountain-pen ink describe mechanisms. The paper is aged ivory with foxing stains and soft fold creases. An official embossed seal and red wax stamp appear in the corner. A hand-signed inventor''s name and date appear at the bottom. The entire image feels like a recovered archival document—authoritative, historic, and slightly mysterious.',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1766940094520_1mg5pd_G8_m2ZVWEAAMG7y.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Chalkboard-style AI news summary',
                    'A Japanese prompt for turning AI news content into a hand-drawn, teacher-style chalkboard diagram with explanations.',
                    'Using the following content, summarize the news in a chalkboard-style, hand‑written look, and break it down with diagrams and easy‑to‑understand expressions as if a teacher had written it.
—-
Search results from Grok',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1763885620059_vzaj75_G6WfVvIbAAEgvYg.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Detailed mirror-selfie otaku room scene',
                    'A very detailed Nano Banana prompt describing a female mirror selfie in a blue-toned otaku computer corner, with full specifications for character, environment, lighting, camera, and negative prompts.',
                    '### Scene
Mirror selfie in an otaku-style computer corner, blue color tone.

### Subject
* Gender expression: female
* Age: around 25
* Ethnicity: East Asian
* Body type: slim, with a defined waist; natural body proportions
* Skin tone: light neutral tone
* Hairstyle:
    * Length: waist-length hair
    * Style: straight with slightly curled ends
    * Color: medium brown
* Pose:
    * Stance: standing in a slight contrapposto pose
    * Right hand: holding a smartphone in front of her face (identity hidden)
    * Left arm: naturally hanging down alongside the torso
    * Torso: body leaning slightly back; waist and abdomen exposed
* Clothing:
    * Top: light blue cropped knit cardigan, top two buttons fastened; a blue French-style bra faintly visible
    * Bottom: denim ultra-short shorts, with a blue satin ribbon bow on each side of the hips
    * Socks: blue and white horizontal striped over-the-knee socks
    * Accessory: a blue cute mascot phone case

### Environment
* Description: bedroom computer corner seen through a wall-mounted mirror
* Furnishings:
    * White desk
    * Single monitor showing a soft blue wallpaper (no readable text)
    * Mechanical keyboard with white keycaps on a blue desk mat
    * Mouse on a small blue mouse pad
    * PC tower on the right side with blue case lighting
    * Three anime figures on or near the PC tower
    * A poster of a pagoda on the wall
    * Cat-shaped desk lamp with blue accents
    * A transparent glass of water
    * A tall green leafy plant by the window (on the left side of the frame)
* Color replacement: replace all originally pink elements (clothes and room decor) with blue tones (baby blue to sky blue/periwinkle blue).

### Lighting
* Light source: daylight coming from a large window on the left side of the camera, through sheer curtains
* Light quality: soft, diffused light
* White balance (K): 5200

### Camera
* Mode: smartphone rear camera shooting via the mirror (no portrait/bokeh mode)
* Equivalent focal length (mm): 26
* Distances (m):
    * Subject to mirror: 0.6
    * Camera to mirror: 0.5
* Exposure:
    * Aperture (f): 1.8
    * ISO: 100
    * Shutter speed (s): 0.01
    * Exposure compensation (EV): -0.3
* Focus: focus on the torso and shorts in the mirror image
* Depth of field: natural smartphone deep depth of field; background clearly visible with no artificial blur
* Composition:
    * Aspect ratio: 1:1
    * Crop: from the top of the head to mid-thigh; include the desk, monitor, PC tower, and plant in the frame
    * Angle: slightly high angle from the mirror’s point of view
    * Composition note: keep the subject centered; to avoid wide-angle edge distortion, have her stand a bit further away and crop to a square later.

### Negative prompts
* Any appearance of pink/magenta anywhere
* Beauty filters/over-smoothed skin; poreless skin look
* Exaggerated or distorted anatomy
* NSFW, see-through fabrics, wardrobe malfunctions
* Logos, brand names, or readable user interface text
* Fake portrait-mode blur, CGI/illustration feel',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1763889946850_689z0h_G23i3sJW0AASGUw.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Edo-period Ukiyo-e reinterpretation of a modern scene',
                    'A highly-structured image prompt to depict a modern-day scene reimagined as an Edo-period Japanese Ukiyo-e woodblock print, with detailed guidance on anachronistic tech, composition, texture, and color.',
                    'A Japanese Edo-period Ukiyo-e woodblock print. The overall feeling is a surreal collaboration between masters like Hokusai and Hiroshige, reimagining modern technology through an ancient lens.

**The scene:** {argument name="modern scene" default="a busy Shibuya scramble crossing"}

**Edo transformation logic:**
Characters wear Edo-era kimono but perform modern actions. All technology is transformed into surreal Edo equivalents:
* Smartphones are glowing, illustrated paper scrolls being read intently.
* Metro stations and trains are giant articulated wooden centipede carriages shuffling through crowds.
* Skyscrapers are reimagined as endless, towering wooden pagodas reaching into dramatic clouds.
* Robots and mecha appear as giant, armored woodblock golems.

The composition uses a flattened perspective with large, bold, hand-carved ink outlines. The background features heavily stylized Ukiyo-e wave patterns and dramatic, swirling clouds, with a distant Mt. Fuji visible on the horizon.

The image must look like a physical print, not a digital painting.
* Texture: strong visible wood grain texture and rough paper fibers throughout the piece.
* Printing imperfections: pigment bleeding is evident. Simulate hand-pressed plates with slight color misalignment for authenticity.
* Color palette: strictly limited to traditional mineral pigments, with dominant use of Prussian blue, vermilion red, and muted yellow ochre.
* Lighting: soft, flat, shadow-free lighting with no digital gradients.

Aspect ratio is 3:4 vertical poster. Include vertical Japanese calligraphy describing the scene and a traditional red artist seal stamp in a corner.',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1764915832381_renotr_G7FuPlzbYAAsuo2.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Profile / Avatar - Extreme Close-up Beauty Selfie with Heavy Blush',
                    'A prompt for generating an extreme close-up beauty selfie portrait of a woman with platinum blonde hair. It focuses heavily on makeup details, specifically ''heavy pink blush'' across the cheeks and nose bridge, aiming for a soft, dreamy, youthful aesthetic captured with a smartphone camera and natural indoor daylight.',
                    '{
  "prompt": "Close-up beauty selfie portrait, young woman with long {argument name="hair color" default="platinum white blonde"} straight hair, tilted head angle rotated sideways, looking at camera with soft dreamy expression, light blue grey eyes with long dark lashes, heavy pink blush makeup across cheeks and nose bridge, glossy pink nude lips, fair porcelain skin, natural eyebrows, wearing blue top or sweater visible at edge, soft natural daylight, extreme close-up face shot, beauty content aesthetic, iPhone selfie style, intimate portrait angle, youthful fresh makeup look",
  "negative_prompt": "outdoor harsh lighting, dark hair, full body shot, studio professional lighting, heavy eye makeup, serious expression",
  "style": "beauty selfie, close-up portrait, soft natural lighting, social media aesthetic, fresh youthful makeup",
  "aspect_ratio": "3:4",
  "camera": {
    "type": "smartphone front camera selfie",
    "angle": "tilted rotated angle, close-up from above",
    "framing": "extreme close-up, face only filling frame"
  },
  "lighting": {
    "type": "soft natural indoor daylight",
    "quality": "soft diffused light, flattering on skin, no harsh shadows",
    "atmosphere": "bright airy indoor setting"
  },
  "mood": "soft, dreamy, youthful, fresh, intimate, feminine",
  "color_palette": "platinum blonde, pink blush, glossy pink lips, light blue eyes, fair skin, blue clothing accent",
  "subject_features": {
    "hair": "long platinum white blonde, straight silky texture, falling around face, middle parted",
    "skin": "fair, porcelain, smooth, natural",
    "eyes": "light blue grey, large, soft gaze at camera, long dark lashes, minimal eye makeup",
    "lips": "glossy pink nude, full natural shape, slightly parted",
    "eyebrows": "natural brown, soft fluffy shape",
    "expression": "soft, dreamy, relaxed, gentle, slightly pouty"
  },
  "makeup": {
    "blush": "{argument name="blush style" default="heavy pink blush applied across both cheeks and bridge of nose, sun-kissed flush effect"}",
    "lips": "glossy pink nude lip gloss",
    "eyes": "minimal eyeshadow, long natural lashes",
    "base": "natural dewy skin, no heavy foundation",
    "style": "youthful fresh faced, blushy doll-like makeup trend"
  },
  "wardrobe": {
    "visible": "blue top or sweatshirt partially visible at bottom edge of frame"
  },
  "pose": {
    "head": "tilted sideways, rotated angle creating diagonal composition",
    "gaze": "looking directly at camera",
    "framing": "face fills entire frame, extreme close-up"
  },
  "setting": {
    "location": "indoor, likely home or car",
    "background": "minimal, blurred, light neutral tones",
    "atmosphere": "casual intimate selfie setting"
  }
}',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769582010053_19t5sy_G_rBiSuaUAAgHsS.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Profile / Avatar - Minimal Character Illustration Template',
                    'A simple template prompt for generating minimal character illustrations with simplified features, flat colors, and soft curves, suitable for clean, visually calm designs.',
                    'Illustrate a minimal character of {argument name="character type" default="[CHARACTER TYPE]"} with simplified facial features (dots and lines only). Use flat colors, soft curves, and no textures. Neutral pose, centered, on a plain background. Cute, calm, and visually clean.',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769581924144_ur0pd1_G_q96GuawAAnIn8.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Profile / Avatar - Cold Allure Dark Portrait Prompt for Nano Banana Pro',
                    'A highly detailed, multi-lingual prompt (Chinese and English) for Gemini Nano Banana Pro to create an ultra-photorealistic, seductive dark portrait. The prompt focuses heavily on micro-expressions (subtle smile, hooded eyes, parted lips), hyper-detailed skin texture, specific lighting (ring light/softbox), and maintaining the facial identity from an uploaded reference image.',
                    'Pure black cool-tone backdrop max contrast Downcast direct gaze, slightly parted lips + subtle corner smile oozing cold allure, ultimate premium chill vibe!

Pure black cool-tone background provides ultimate contrast for a downcast gaze directly at the camera, slightly parted lips + subtle corner smile releasing cold allure and charm, maximizing the premium chill vibe!

{
    "subject": {
        "core_identity": "Use the same face from the reference image without changing facial features, fair skin with warm golden undertones, seductive beauty, long voluminous wavy {argument name="hair color" default="honey-blonde"} hair",
        "skin_and_facial_details": "hyper-detailed photorealistic skin:1.4, smooth yet visible fine pores especially around nose and cheeks, strong subsurface scattering creating soft luminous glow, subtle natural imperfections, dramatic catchlights from ring light and phone flash, thick defined eyeliner and long lashes, full glossy lips with fine texture and high shine:1.3",
        "hair": "long voluminous wavy honey-blonde hair with golden highlights, cascading over pillow and shoulder, realistic strand separation, soft bounce and strong shine from direct ring light illumination:1.2",
        "body_figure": "curvaceous hourglass silhouette with pronounced feminine proportions:1.3, full natural bust softly pressed against pillow and ribbed fabric, defined waist visible in relaxed side-lying pose, rounded hips and thighs implied under cropped top, natural asymmetry in reclined posture",
        "micro_expression": "soft bedroom gaze looking directly at camera with slightly hooded eyes, subtly parted glossy lips in gentle seductive pout, faint knowing smile at corners, conveying intimate, alluring, relaxed confidence and private sensuality through heavy-lidded eyes and relaxed facial muscles:1.2"
    },
    "apparel_and_materials": "off-white cream long-sleeve ribbed crop top with tight stretchy knit texture, fabric clinging softly to curves with realistic compression wrinkles at elbow and under bust, subtle sheen and light transmission showing skin warmth underneath, natural drape and fold patterns from side-lying pose:1.3",
    "pose_and_action": "intimate side-lying bedroom selfie pose on pillow, body angled toward camera, head resting on arm or pillow, right hand likely holding phone just out of frame, relaxed shoulder and neck line, posture conveys private relaxation, sensual vulnerability and inviting closeness through reclined position and direct eye contact:1.2",
    "scene_and_environment": "dim modern bedroom interior at night, dark black curtains or wall backdrop, strong ring light or softbox creating dramatic side illumination, neutral bedding and pillow, private cozy intimate space with cinematic low-key atmosphere:1.1",
    "lighting_shadows_and_color_design": "strong directional ring light or beauty softbox from upper right creating dramatic side lighting, deep volumetric s',
                    'Portrait',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769582018699_gya2e1_G_q1EEXXAAAH8NY.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Profile / Avatar - Beach Selfie Portrait with Peach Fruit',
                    'A detailed JSON prompt for generating a summer vacation selfie portrait on a tropical beach. It specifies the subject''s appearance (platinum blonde hair, light freckles), props (fresh peach fruit, wired earphones), and golden hour lighting for a relaxed, natural aesthetic.',
                    '{
  "prompt": "Beach selfie portrait, young woman with long platinum white blonde wavy hair blowing in wind, holding fresh ripe {argument name="fruit" default="peach"} fruit in right hand near face, white wired earphones in ears with cable visible, silver pendant necklace with round charm, wearing black halter neck top, red nail polish on fingernails, light green grey eyes looking directly at camera, fair skin with natural light freckles, natural pink lips neutral expression, turquoise blue ocean water in background, sandy beach shoreline visible, bright blue sky with white fluffy clouds, golden hour summer sunlight, vacation selfie aesthetic, Mediterranean tropical beach vibes, close-up portrait framing face and shoulders, windswept natural hair texture",
  "negative_prompt": "indoor, studio lighting, dark hair, heavy makeup, winter clothing, nighttime, harsh shadows",
  "style": "beach vacation selfie, summer portrait, natural daylight photography, travel lifestyle content",
  "aspect_ratio": "3:4",
  "camera": {
    "type": "smartphone front camera selfie",
    "angle": "straight on, eye level, close-up",
    "framing": "close-up portrait, face and upper shoulders visible"
  },
  "lighting": {
    "type": "natural bright summer sunlight",
    "quality": "warm golden hour beach light, soft natural illumination",
    "atmosphere": "bright sunny beach day"
  },
  "mood": "relaxed, summery, casual, vacation vibes, natural, fresh",
  "color_palette": "platinum blonde, black top, turquoise ocean, blue sky, white clouds, peach orange fruit, red nails, fair skin tones",
  "subject_features": {
    "hair": "long platinum white blonde, wavy windblown texture, natural beach waves, middle parted",
    "skin": "fair, natural with light freckles, sun-kissed glow",
    "eyes": "light green grey, direct gaze at camera, natural lashes",
    "lips": "natural pink, neutral relaxed expression",
    "eyebrows": "natural brown, soft shape",
    "expression": "neutral, relaxed, soft, casual"
  },
  "accessories": {
    "earphones": "white wired earbuds with cable hanging down",
    "necklace": "silver chain with round pendant charm",
    "nails": "red nail polish"
  },
  "wardrobe": {
    "top": "black halter neck top with thin straps tied around neck"
  },
  "props": {
    "fruit": "fresh ripe peach held in right hand near chin and cheek, red and orange colored"
  },
  "pose": {
    "hand": "right hand holding peach up near face",
    "gaze": "looking directly at camera",
    "expression": "neutral relaxed"
  },
  "setting": {
    "location": "tropical or Mediterranean beach",
    "background": "turquoise blue clear ocean water, sandy beach shoreline, bright blue sky with scattered white clouds",
    "atmosphere": "sunny summer vacation day, warm beach setting"
  }
}',
                    'Portrait',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769581928530_o01knc_G_qrC0SWUAA3IYJ.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Profile / Avatar - Exaggerated Hourglass Mirror Selfie with Gudetama Hoodie',
                    'A highly specific JSON prompt for generating a mirror selfie featuring a woman with an extremely exaggerated hourglass figure and hyper-voluminous proportions. She is wearing a cropped Gudetama graphic hoodie and a minimal black string thong in a brightly lit, modern bohemian living room.',
                    '{
  "subject": {
    "description": "A young woman with silver hair taking a mirror selfie.",
    "body": {
      "build": "Extremely exaggerated hourglass figure with hyper-voluminous proportions.",
      "torso": "A very narrow, defined waist contrasts sharply with incredibly large, full breasts pushed upwards under the hoodie. The bust is significantly prominent and ample.",
      "lower_body": "Massive, wide, and voluptuous hips and glutes with extreme curvature. The gluteus muscles and surrounding tissues are greatly amplified, creating a dramatic and deep waist-to-hip ratio and substantial thigh definition in the tight black thong."
    },
    "wardrobe": {
      "top": "A light beige hoodie pulled up to reveal the midriff. It features a large graphic of {argument name="character name" default="Gudetama the lazy egg"} character with Japanese text, including ''ぐでたま'' and ''Lazy Egg'' written around it. The text on the sleeve is partially visible.",
      "bottom": "A minimal black string thong that accentuates the massive hips and glutes."
    }
  },
  "camera": {
    "perspective": "Full-length mirror selfie taken by the subject, standing, holding a smartphone.",
    "lens": "Wide-angle smartphone camera lens, capturing the entire figure.",
    "format": "9:16 vertical portrait aspect ratio."
  },
  "lighting": {
    "setup": "Bright, natural daylight streaming in from a large window to the right and behind the subject.",
    "quality": "Soft, diffused light creating gentle highlights on the skin and hair, with soft shadows defining the body''s exaggerated contours."
  },
  "scene": {
    "environment": "A brightly lit, modern bohemian living room reflected in a large standing mirror.",
    "details": "To the left is a black metal shelving unit filled with numerous potted green plants and books. In the background, there is a wooden dining table and chairs, a jute rug, and a doorway leading to another sunlit area.",
    "textures": "Light oak wood plank flooring, woven rug, cotton hoodie fabric, smooth mirror glass."
  }
}',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769581977805_q3hlan_G_qpAUpW8AAQoL-.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Profile / Avatar - High-Angle Close-up Portrait on Hollywood Walk of Fame',
                    'A detailed prompt for a high-angle, close-up portrait photograph with a social media aesthetic. It features a young woman kneeling on the Hollywood Walk of Fame, looking up at the camera, emphasizing natural freckles, gold jewelry, and warm golden hour sunlight.',
                    '{  
  "prompt": "A high-angle, close-up portrait photograph taken from directly above, capturing a young women looking straight up with a soft, neutral expression. She has long, shoulder-length brown hair in a ponytail and fair skin with prominent natural freckles across her nose, cheeks, and forehead. Her light brown eyes with long dark lashes make direct eye contact. She is wearing a pink off-shoulder sleeveless top with ruffle details, a deep V-neck, multiple gold and diamond rings on her fingers, small gold hoop earrings, and a gold chain necklace with a ruby stone pendant. Both of her hands are resting on her knees as she kneels on the concrete Walk of Fame in Los Angeles, with a star visible. Soft, warm golden hour sunlight casts a diagonal shadow across the pavement. The image has a natural, intimate, candid feel with a social media aesthetic.",  
  "negative_prompt": "indoor, studio lighting, heavy makeup, dark hair, side angle, full body, harsh shadows",  
  "style": "natural portrait photography, golden hour outdoor, intimate close-up, social media aesthetic",  
  "aspect_ratio": "9:16",  
  "camera": {  
    "type": "smartphone portrait or mirrorless camera",  
    "angle": "high overhead angle looking down at subject looking up",  
    "framing": "close-up portrait, head shoulders and hands visible"  
  },  
  "lighting": {  
    "type": "natural golden hour sunlight",  
    "quality": "warm soft afternoon sun, diagonal light creating gentle shadow on concrete",  
    "atmosphere": "warm outdoor natural light, intimate mood"  
  },  
  "mood": "intimate, soft, natural, candid, warm, gentle",  
  "color_palette": "long straight black, purple clothing, gold jewelry accents, warm skin tones, grey concrete, natural freckle tones",  
  "subject_features": {  
    "hair": "long black straight shoulder length, soft waves, middle parted, natural texture",  
    "skin": "fair with natural freckles across nose cheeks and forehead, sun-kissed",  
    "eyes": "light blue, large, looking directly up at camera, long dark lashes",  
    "lips": "red mauve, soft full shape",  
    "eyebrows": "natural dark brown, well groomed",  
    "expression": "soft neutral, intimate, slightly pouty, direct eye contact",  
    "freckles": "natural scattered freckles prominent across nose bridge, cheeks, forehead"  
  },  
  "accessories": {  
    "piercings": "small silver hoop on belly",  
    "earrings": "small diamond spirals hoop earrings",  
    "rings": "multiple gold and diamonds stacking rings on both hands fingers",  
    "necklace": "delicate gold chain necklace with skull pendant"  
  },  
  "wardrobe": {  
    "top": "{argument name="top color" default="white"} off-shoulder sleeveless top, ribbed texture, ruffle frill details on sleeve cuffs, bare shoulders exposed",  
    "bottom": "short denim miniskirt"  
  },  
  "pose": {  
    "position": "sitting or kneeling on ground of walk of fame in los angeles with gold star vip on the ground",  
    "hands": "both re"
  } 
}',
                    'Portrait',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769581977878_tmgvz3_G_qhi-0XAAAit1v.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Profile / Avatar - Photorealistic Studio Portrait with Gentle Expression',
                    'A highly structured JSON prompt for generating an 8K photorealistic studio portrait of a female subject, focusing on a gentle, relaxed smile, specific clothing details (muted pink V-neck dress), and minimal makeup, set against a deep dark red background.',
                    '{
  "image_type": "photorealistic portrait",
  "resolution_target": "8K ultra high definition",
  "aspect_ratio": "1:1",
  "camera_view": {
    "framing": "medium portrait",
    "angle": "eye-level",
    "focus": "sharp focus on subject",
    "depth_of_field": "shallow, smooth background blur"
  },
  "subject": {
    "gender_presentation": "female-presenting",
    "age_range_visual": "adult",
    "skin_tone": "fair/light",
    "facial_expression": {
      "expression": "gentle relaxed smile",
      "mouth": "lips slightly parted",
      "teeth": "upper teeth visible",
      "emotion": "calm, approachable"
    },
    "eyes": {
      "color": "light blue-green",
      "shape": "almond-shaped",
      "gaze_direction": "looking directly at camera",
      "eyelashes": "visible, moderately defined"
    },
    "eyebrows": {
      "color": "light blonde",
      "shape": "natural, softly arched"
    },
    "hair": {
      "color": "light blonde",
      "length": "shoulder-length",
      "texture": "soft, slightly wavy",
      "parting": "side-parted",
      "styling": "loose, natural volume"
    }
  },
  "pose": {
    "body_position": "seated",
    "shoulders": "relaxed",
    "arms": "hands clasped together resting near lap",
    "posture": "upright but casual"
  },
  "clothing": {
    "top": {
      "type": "sleeveless dress",
      "neckline": "V-neck",
      "fabric": "lightweight, flowing",
      "base_color": "{argument name="dress color" default="muted pink / dusty rose"}",
      "pattern": "small irregular white dash-like markings",
      "fit": "relaxed fit"
    }
  },
  "accessories": {
    "necklaces": [
      {
        "type": "thin gold chain",
        "details": "small evenly spaced charm elements"
      },
      {
        "type": "longer gold chain",
        "details": "round pendant and elongated oval pendant"
      }
    ]
  },
  "makeup": {
    "complexion": "natural finish",
    "blush": "soft pink on cheeks",
    "lip_color": "natural pink",
    "eye_makeup": "minimal, subtle enhancement"
  },
  "background": {
    "type": "solid color",
    "color": "{argument name="background color" default="deep dark red / maroon"}",
    "texture": "smooth, uniform",
    "lighting_effect": "evenly lit with slight gradient falloff"
  },
  "lighting": {
    "key_light": "soft frontal lighting",
    "shadow_quality": "soft shadows",
    "contrast": "moderate",
    "skin_highlights": "natural highlights on cheeks and forehead"
  },
  "image_quality": {
    "sharpness": "high",
    "noise": "none visible",
    "detail_level": "very high, skin texture visible",
    "color_accuracy": "natural and balanced"
  },
  "overall_style": "professional studio portrait, clean, minimal, photorealistic"
}',
                    'Portrait',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769581926636_6ftb81_G_pma-gXwAAnJOT.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Profile / Avatar - Intimate Golden Hour Portrait on Walk of Fame',
                    'A detailed JSON prompt for generating an intimate, natural portrait of a female subject (Ana de Armas) sitting or kneeling on the Walk of Fame in Los Angeles. It specifies golden hour lighting, a high overhead camera angle, and detailed features like natural freckles and specific jewelry for a social media aesthetic.',
                    '{
  "prompt": "Portrait photography from above, {argument name="subject name" default="Ana de Armas"} with long brown shoulder length ponytail hair, looking up directly at camera, both hands resting resting kneels, sitting or kneeling on concrete walk of fame in los angeles, wearing a white off-shoulder sleeveless top with ruffle details on sleeves with V deep necklace, natural freckles scattered across face nose and forehead, light brown eyes with long dark eyelashes, red mauve lips, multiple gold and diamonds rings on fingers, small gold hoop earrings, gold chain with stone ruby necklace, fair skin with sun freckles, soft natural golden hour sunlight creating diagonal shadow on pavement, outdoor sidewalk setting, intimate close-up portrait, looking up at camera with soft neutral expression, iPhone style portrait photography, warm afternoon lighting",
  "negative_prompt": "indoor, studio lighting, heavy makeup, dark hair, side angle, full body, harsh shadows",
  "style": "natural portrait photography, golden hour outdoor, intimate close-up, social media aesthetic",
  "aspect_ratio": "3:4",
  "camera": {
    "type": "smartphone portrait or mirrorless camera",
    "angle": "high overhead angle looking down at subject looking up",
    "framing": "close-up portrait, head shoulders and hands visible"
  },
  "lighting": {
    "type": "natural golden hour sunlight",
    "quality": "warm soft afternoon sun, diagonal light creating gentle shadow on concrete",
    "atmosphere": "warm outdoor natural light, intimate mood"
  },
  "mood": "intimate, soft, natural, candid, warm, gentle",
  "color_palette": "long straight black, purple clothing, gold jewelry accents, warm skin tones, grey concrete, natural freckle tones",
  "subject_features": {
    "hair": "long black straight  shoulder length, soft waves, middle parted, natural texture",
    "skin": "fair with natural freckles across nose cheeks and forehead, sun-kissed",
    "eyes": "light blue, large, looking directly up at camera, long dark lashes",
    "lips": "red mauve, soft full shape",
    "eyebrows": "natural dark brown, well groomed",
    "expression": "soft neutral, intimate, slightly pouty, direct eye contact",
    "freckles": "natural scattered freckles prominent across nose bridge, cheeks, forehead"
  },
  "accessories": {
    "piercings": "small silver hoop on belly",
    "earrings": "small diamond spirals hoop earrings",
    "rings": "multiple gold and diamonds stacking rings on both hands fingers",
    "necklace": "delicate gold chain necklace with skull pendant"
  },
  "wardrobe": {
    "top": "white off-shoulder sleeveless top, ribbed texture, ruffle frill details on sleeve cuffs, bare shoulders exposed,"
"bottom": "short denim miniskirt,"
  },
  "pose": {
    "position": "sitting or kneeling on ground of walk of fame in los angeles with gold star vip on the ground",
    "hands": "both r"
  }
}',
                    'Portrait',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769581928218_75enn4_G_paYHCbkAAVAFo.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Profile / Avatar - 3D Chibi Cartoon Sticker Set Generation Prompt',
                    'A prompt for generating a set of 3D chibi-style cartoon stickers based on a reference face. It specifies the aesthetic (Pixar/Disney-inspired, glossy eyes, rounded face), character details (red leather jacket), multiple emotional poses, and technical requirements (smooth plastic texture, white outline, high resolution).',
                    'A cute 3D chibi-style cartoon sticker set, featuring the same character in multiple emotions and poses(using an uploaded face as a reference). Big expressive glossy eyes, soft rounded face, slightly oversized head, small body proportions.  Wearing a {argument name="jacket color" default="red"} leather jacket over a white top. Each pose shows different expressions: surprised, sad, confused, happy, thinking, winking, peace sign, shrugging. Pixar/Disney-inspired 3D render, smooth plastic-like texture, soft lighting, pastel beige background. Sticker-style white outline around each character, clean and minimal aesthetic, high detail, ultra cute, emoji-like expressions, high resolution, studio quality.',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769582037114_06q4zj_G_pErRwWsAAMppI.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Profile / Avatar - Glamorous Auburn-Haired Selfie Portrait Prompt',
                    'A detailed JSON prompt for the Nano Banana Pro model to generate a glamorous, high-quality selfie portrait of a young woman. The prompt specifies vibrant auburn red voluminous curls, piercing blue eyes, dewy skin, and a white fitted button-down shirt with a deep V-neck. It aims for a social media influencer aesthetic with soft, frontal beauty lighting and 4K photorealistic detail.',
                    '{
  "prompt": {
    "subject": {
      "demographics": "Young woman, approximately mid-20s",
      "hair": {
        "color": "{argument name="hair color" default="Vibrant auburn red"}",
        "texture": "Voluminous natural curls, tight spirals, slightly tousled and messy look",
        "length": "Long, cascading past shoulders"
      },
      "face": {
        "eyes": "Piercing blue, almond-shaped",
        "skin": "Fair complexion, dewy finish, radiant highlight on cheekbones and nose",
        "lips": "Full, glossy pink-nude lipstick, mouth slightly parted",
        "expression": "Alluring, confident, direct eye contact with camera"
      }
    },
    "apparel": {
      "clothing": "White fitted button-down shirt, deep V-neck plunging neckline, unbuttoned at top, long sleeves",
      "accessories": "Delicate gold chain necklace with small round pendant, white wireless earbud in right ear, small dangling earring"
    },
    "pose": {
      "type": "Selfie portrait",
      "angle": "Slightly high angle, head tilted to the right",
      "framing": "Close-up chest up, arm extended indicating handheld camera"
    },
    "environment": {
      "setting": "Indoor domestic bedroom or hallway",
      "background": "Softly out of focus, neutral beige walls, white paneled door visible on right, dark framed mirror or doorway on left",
      "details": "Simple, uncluttered home interior"
    },
    "lighting": {
      "type": "Soft, frontal beauty lighting (likely ring light or natural window light)",
      "effects": "Catchlights in eyes, specular highlights on forehead and cheeks, soft shadows under chin and hair"
    },
    "mood": {
      "atmosphere": "Casual yet glamorous, intimate, confident",
      "style": "Social media influencer aesthetic, ''getting ready'' vibe"
    },
    "camera_details": {
      "type": "Smartphone front-facing camera simulation or 35mm portrait lens",
      "focus": "Sharp focus on eyes and face, shallow depth of field (bokeh) on background",
      "quality": "{argument name="image quality" default="4k, highly detailed texture (skin pores, individual hair strands), photorealistic"}"
    }
  }
}',
                    'Portrait',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769582043507_a7af4h_G_mxkn4W0AEFO55.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Profile / Avatar - Realistic portrait of a young woman winking in an upscale restaurant',
                    'This is a detailed image generation prompt designed to create a realistic, candid portrait of a young woman in an upscale restaurant setting, focusing on a playful expression and social media aesthetic. It specifies subject details, attire, environment, and technical camera settings for a high-quality result.',
                    '{
  "image_prompt": {
    "subject": {
      "type": "{argument name="subject type" default="Young woman"}",
      "hair": "{argument name="hair style" default="Long wavy red hair, ginger, tied back in a messy ponytail, loose strands framing face"}",
      "face": "Fair skin, beautiful facial features, light makeup",
      "expression": "Winking one eye, playful smile, flirting, looking directly at camera",
      "pose": "Leaning forward, resting chin on hand, elbow on table, portrait shot"
    },
    "attire": {
      "clothing": "Black sleeveless dress, sweetheart neckline, corset style top",
      "accessories": "Gold cross necklace, small hoop earrings"
    },
    "environment": {
      "location": "Upscale restaurant, dinner setting",
      "foreground": "White tablecloth, silver cutlery (fork and knife), glass of white wine",
      "background": "Blurred background (bokeh), other diners, warm ambient restaurant lighting, restaurant interior"
    },
    "technical_details": {
      "style": "Realistic photography, candid shot, social media aesthetic, high quality",
      "lighting": "Soft warm indoor lighting, slightly dim",
      "camera": "Eye-level angle, shallow depth of field, focus on face"
    }
  }
}',
                    'Portrait',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769495305936_olgctl_G_mWUCoX0AE8dR4.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Profile / Avatar - Ultra-Realistic Professional Headshot for Creator Economy',
                    'A prompt designed to transform an uploaded image into an ultra-realistic professional headshot suitable for the modern creator economy. It specifies clean studio lighting, natural skin texture, sharp details, and a premium DSLR aesthetic.',
                    'Ultra realistic professional headshot of the person in the attached image with a modern creator economy aesthetic. Clean studio lighting with soft shadows, natural skin texture, sharp facial details, shallow depth of field, and a premium DSLR look. Subject wearing minimal, smart casual attire',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769495382597_fc68gv_G_mGZN6WYAAlaF8.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Profile / Avatar - Professional Studio Headshot Prompt',
                    'A detailed image generation prompt for creating an ultra-realistic, LinkedIn-quality professional studio headshot of a confident man in a modern, polished executive style. It specifies subject details, environment, lighting, and technical specifications like shallow depth of field and high resolution.',
                    '{
  "image_prompt": {
    "main_description": "Professional studio headshot of a confident, well-groomed man in his early 30s.",
    "subject_details": {
      "appearance": "Neat short hairstyle, sharp facial features, subtle stubble or clean-shaven",
      "expression": "Natural, friendly smile, confident",
      "apparel": "Dark blazer over a plain black or navy t-shirt"
    },
    "environment": {
      "setting": "Modern office background",
      "elements": "Softly blurred desk, monitor, and indoor plants",
      "depth": "Shallow depth of field"
    },
    "lighting_and_atmosphere": {
      "lighting_setup": "Soft diffused studio lighting, gentle key light, balanced fill",
      "color_grading": "Clean color grading, realistic skin tones",
      "mood": "Minimalist, polished, executive"
    },
    "technical_specs": {
      "style": "LinkedIn-quality professional photography, ultra-realistic",
      "focus": "Sharp focus, crisp details",
      "resolution": "High resolution"
    }
  }
}',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769495359664_h7y1w3_G_mCkH9a0AASUSk.jpg'],
                    '{"image_prompt":{"main_description":"Professional studio headshot of a confident, well-groomed man in his early 30s.","subject_details":{"appearance":"Neat short hairstyle, sharp facial features, subtle stubble or clean-shaven","expression":"Natural, friendly smile, confident","apparel":"Dark blazer over a plain black or navy t-shirt"},"environment":{"setting":"Modern office background","elements":"Softly blurred desk, monitor, and indoor plants","depth":"Shallow depth of field"},"lighting_and_atmosphere":{"lighting_setup":"Soft diffused studio lighting, gentle key light, balanced fill","color_grading":"Clean color grading, realistic skin tones","mood":"Minimalist, polished, executive"},"technical_specs":{"style":"LinkedIn-quality professional photography, ultra-realistic","focus":"Sharp focus, crisp details","resolution":"High resolution"}}}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Profile / Avatar - Hyper-Real Studio Portrait Poster Art Generator Prompt',
                    'A complex JSON prompt template designed to generate a hyper-realistic studio photograph of a person (using an uploaded face reference) in a tuxedo, surrounded by hands holding objects related to a specified theme (e.g., ''finance'' or ''gaming''), creating a poster art aesthetic.',
                    '{
  "task": "Generate a hyper-real studio photograph that matches the composition of the reference image: a centered adult person in a tuxedo, surrounded by many hands entering the frame from all sides holding objects toward the person, with a curtain backdrop whose color matches the theme.",
  "variables": {
    "USER_PHOTO": "<<UPLOAD_OR_URL_TO_USER_FACE_OR_PORTRAIT>>",
    "SUBJECT_THEME": "{argument name="subject theme" default="finance"}",
    "HAND_PROPS": [
      "<<PROP_1 RELATED TO SUBJECT_THEME>>",
      "<<PROP_2 RELATED TO SUBJECT_THEME>>",
      "<<PROP_3 RELATED TO SUBJECT_THEME>>",
      "<<PROP_4 RELATED TO SUBJECT_THEME>>",
      "<<PROP_5 RELATED TO SUBJECT_THEME>>",
      "<<PROP_6 RELATED TO SUBJECT_THEME>>",
      "<<PROP_7 RELATED TO SUBJECT_THEME>>",
      "<<PROP_8 RELATED TO SUBJECT_THEME>>"
    ]
  },
  "prompt": "Create an ultra photorealistic studio photo (hyper-real, DSLR look) with the SAME composition and framing as the reference: a centered adult person standing front-facing, waist-up to mid-thigh visible, wearing a dark navy tuxedo jacket, crisp white shirt, and black bow tie, smiling confidently. The person has round eyeglasses and neat facial hair (mustache + short beard), but the FACE must be replaced with the user''s likeness from USER_PHOTO while keeping natural skin texture, pores, and realistic facial proportions (no plastic skin, no cartooning). The lighting is clean professional studio lighting with soft shadows, high dynamic range, crisp detail.\n\nSurround the person with 8–10 different hands and forearms entering the frame from the edges (top, left, right, bottom), each holding an object and aiming it toward the center person (close to the face/upper torso). The hands belong to different people (varied sleeves/patterns/colors), but keep them realistic and anatomically correct.\n\nIMPORTANT: The ONLY changing elements across generations are: (1) the user''s face from USER_PHOTO, and (2) the objects held in the hands. Everything else stays consistent: the tuxedo pose, camera angle, lens look, and overall composition.\n\nOBJECT RULE: Select HAND_PROPS so they are strongly related to SUBJECT_THEME. The objects must be clearly visible, realistic, and varied (mix of modern and vintage if it fits). Examples by theme:\n- music: studio headphones, microphone, vinyl record, cassette, guitar pick, small synth, metronome\n- gaming: controller, handheld console, gaming headset, mouse, keyboard, VR accessory\n- cooking: chef thermometer, whisk, spice grinder, mini pan, piping bag, recipe card\n- finance: calculator, credit card reader, stock ticker printout, smartphone with finance app, receipt roll\n- fitness: smartwatch, resistance band, shaker bottle, jump rope handle\n\nBACKGROUND: Use a curtain backdrop (like a stage/studio curtain) with a color"',
                    'Portrait',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769495402969_g35tnj_G_l-QuqWkAAytg5.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Profile / Avatar - Intimate Bedhead POV Portrait',
                    'A structured prompt for generating an intimate, photorealistic POV/selfie portrait of a young woman with auburn hair and green-hazel eyes, lying supine on white bed linens, emphasizing a casual ''bedhead'' aesthetic, soft diffused lighting, and highly detailed skin texture.',
                    '{
  "prompt_structure": {
    "subject": {
      "appearance": "Young woman with fair skin and a dusting of natural freckles across the nose and cheeks. Striking green-hazel eyes accented with sharp, black winged eyeliner. Long, voluminous {argument name="hair color" default="deep red/auburn"} hair with a messy, wavy texture and wispy bangs framing the forehead.",
      "clothing": "Black ribbed knit camisole or tank top with delicate black lace trim along the neckline.",
      "pose": "Lying down supine on a soft surface, looking directly up at the camera. Head resting back, causing hair to fan out halo-like around the head. High-angle, point-of-view (POV) or selfie perspective.",
      "expression": "Soft, confident gaze, relaxed lips, slightly alluring and intimate."
    },
    "environment": {
      "setting": "Indoor bedroom setting, specifically on a bed.",
      "background": "White, crumpled bed linens and sheets with visible soft fabric texture. Minimalist and clean background focusing attention on the subject."
    },
    "lighting": {
      "type": "Soft, diffused natural daylight.",
      "direction": "Frontal lighting, likely from a nearby window, illuminating the face evenly without harsh shadows.",
      "details": "Clear catchlights in the eyes, soft highlights on the forehead and nose bridge."
    },
    "styling_and_mood": {
      "style": "Casual ''bedhead'' aesthetic, morning look, Gen Z fashion.",
      "mood": "Intimate, relaxed, cozy, effortlessly beautiful."
    },
    "technical_details": {
      "camera_settings": "Shot on 35mm lens or high-end smartphone camera, f/2.0 aperture for slight depth of field blurring the hair edges slightly while keeping the eyes in sharp focus.",
      "visual_quality": "Photorealistic, 8k resolution, raw photo style, highly detailed skin texture (visible pores and imperfections), realistic hair physics, authentic color grading."
    }
  }
}',
                    'Portrait',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769495340796_wdqavo_G_l49hobQAA_vfi.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Profile / Avatar - Extreme Hourglass Figure Mirror Selfie',
                    'A highly detailed, structured prompt for generating a mirror selfie of a European woman with an exaggerated hourglass figure, focusing on specific body proportions, wardrobe, accessories, and indoor lighting conditions.',
                    '{
  "subject": {
    "type": "Person",
    "description": "A European woman with fair skin, seated in a velvet chair and taking a mirror selfie. She has large, voluminous breasts and significantly large, prominent glutes, creating an extreme hourglass figure. Her legs are bare, with no tattoos, showing white-painted toenails and a gold ankle chain. Her hands feature long, elaborate nails.",
    "body": {
      "proportions": "Extreme hourglass figure, characterized by a very large bust, a slim waist, and excessively voluminous hips and glutes. The legs are toned but the primary focus is on the dramatic curve and mass of the lower body and upper torso.",
      "shoulders_waist_hip": "Shoulders are relatively narrow compared to the extremely wide hips. The waist-to-hip ratio is very pronounced, with a slender midsection sharply transitioning into substantial, curved hips and large, rounded glutes. The bust is also notably large and full.",
      "muscle_and_curve_details": "Curves are the dominant feature, with exceptionally full and rounded glutes visible below the short garment, and a large, rounded chest filling the bikini top. Muscles are less prominent due to the pronounced curvature and volume of the figure.",
      "skin": "Fair, smooth white skin with no tattoos."
    },
    "wardrobe": {
      "top": "{argument name="bikini top color and pattern" default="Black bikini top with neon green vertical stripes"}, showing cleavage.",
      "bottom": "Very short black shorts, sitting high on the hips and emphasizing the glutes.",
      "accessories": "Silver cross necklace, spiked bracelet, gold ankle chain.",
      "nails": "Long, sculptured nails with elaborate designs and white-painted toenails."
    },
    "pose": "Seated mirror selfie, one leg bent with the foot resting on the chair, the other leg extended towards the mirror. Phone held in one hand."
  },
  "camera": {
    "type": "Mirror Selfie",
    "lens": "Wide-angle phone camera lens.",
    "perspective": "Eye-level from the reflection.",
    "focus": "Sharp focus on the subject and the foreground foot."
  },
  "lighting": {
    "type": "Indoor Ambient",
    "setup": "Warm, soft overhead and ambient light from the apartment.",
    "quality": "Soft, slightly directional, creating shadows and highlights on the subject''s curves and skin.",
    "color": "Warm tones."
  },
  "scene": {
    "location": "Modern apartment interior.",
    "background": "Open-plan living area and kitchen, including grey cabinets, stainless steel refrigerator, and warm wall colors.",
    "props": "Grey tufted velvet chair, wooden side table, part of a doorframe.",
    "textures": "Soft velvet of the chair, smooth skin, glossy phone case, metallic appliances."
  }
}',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769495321741_woyjuc_G_lXLuoWoAAmZX8.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Profile / Avatar - Hyper-realistic portrait with a painting of the subject',
                    'A prompt for generating a hyper-realistic, cinematic 8K portrait where the subject (a young man) stands next to an easel. The canvas on the easel features a photorealistic painting of the subject wearing the same dress, creating a meta-artistic composition under warm studio lighting.',
                    'A hyper-realistic, cinematic 8K portrait of the same young man standing gracefully beside an easel with a large canvas. On the canvas is a stunning, photorealistic painting of herself, perfectly capturing his beauty, wearing the same dress as in real life. She proudly presents the artwork with a soft, confident expression. Studio lighting casts a warm glow, highlighting both her real face and the painted portrait. The composition is elegant, ultra-detailed, masterpiece quality, with perfect photorealism. Aspect ratio 9:16.',
                    'Portrait',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769495311929_o5q89j_G_lScrRaMAAmuMK.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Profile / Avatar - Ultra-Cute Chibi Character Prompt',
                    'A detailed prompt for generating an ultra-cute, glossy 3D illustration of a chibi character in a sporty street-fashion aesthetic. It requires using an uploaded face image for facial reference and specifies anime eyes, a pastel green monochrome theme, specific clothing items (mint-green cloth, Nike cap), and accessories (bubble tea, bags), aiming for a Pixar-style kawaii Instagram avatar.',
                    'create Ultra-cute chibi character using the uploaded face image as the exact facial reference, big sparkling anime eyes, soft baby-doll face, wearing a mint-green cloth, mint green Nike cap, holding bubble tea with black pearls and straw, small crossbody bag and matching tote bag, sporty street-fashion aesthetic, pastel green monochrome theme, glossy 3D illustration, pixar-style + kawaii style, smooth skin, soft lighting, high detail, centered composition, minimal background, aesthetic Instagram avatar, 4k quality',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769495431628_864c0j_G_lAn39bsAAPSnt.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Profile / Avatar - Soft Grunge Portrait with Black Cat',
                    'A structured prompt for generating a close-up portrait (selfie-style) of a young woman with a soft grunge/e-girl aesthetic, cradling a black cat against her cheek. It details her appearance, makeup (bold winged eyeliner), jewelry (gothic dagger pendant), and the moody, low ambient lighting.',
                    '{
  "prompt_data": {
    "subject": {
      "demographics": "Young woman in her early 20s",
      "hair": "Deep black, chin-to-shoulder length straight hair with blunt bangs framing the eyes",
      "skin": "Porcelain-fair skin with natural freckles dusted across the bridge of the nose, subtle pink flush on cheeks",
      "eyes": "Cool grey-blue eyes highlighted by bold winged eyeliner, defined lashes",
      "expression": "Calm, slightly introspective expression, direct eye contact with the camera"
    },
    "companion": {
      "animal": "Small black cat",
      "features": "Glossy black coat, amber-yellow eyes",
      "interaction": "Cat nestled against the subject’s cheek, gently cradled with one hand under its front"
    },
    "styling": {
      "apparel": "Minimal white sleeveless ribbed top",
      "jewelry": "Silver necklace with a gothic dagger-and-wings pendant featuring an eye symbol",
      "piercings": [
        "Silver septum ring",
        "Tiny silver nostril stud"
      ]
    },
    "environment": {
      "setting": "Quiet indoor room",
      "background": "Soft neutral wall in warm beige tones",
      "lighting": "Low, warm ambient lighting creating a moody, intimate atmosphere with gentle shadows"
    },
    "technical_specs": {
      "angle": "Close-up front-facing portrait (selfie-style)",
      "aesthetic": "Soft grunge / e-girl inspired look with strong light–dark contrast",
      "focus": "Crisp facial and eye detail, shallow depth of field with subtly blurred background"
    }
  }
}',
                    'Portrait',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769495392288_vg5032_G_kHfd3aQAAXKkM.jpg'],
                    '{"prompt_data":{"subject":{"demographics":"Young woman in her early 20s","hair":"Deep black, chin-to-shoulder length straight hair with blunt bangs framing the eyes","skin":"Porcelain-fair skin with natural freckles dusted across the bridge of the nose, subtle pink flush on cheeks","eyes":"Cool grey-blue eyes highlighted by bold winged eyeliner, defined lashes","expression":"Calm, slightly introspective expression, direct eye contact with the camera"},"companion":{"animal":"Small black cat","features":"Glossy black coat, amber-yellow eyes","interaction":"Cat nestled against the subject’s cheek, gently cradled with one hand under its front"},"styling":{"apparel":"Minimal white sleeveless ribbed top","jewelry":"Silver necklace with a gothic dagger-and-wings pendant featuring an eye symbol","piercings":["Silver septum ring","Tiny silver nostril stud"]},"environment":{"setting":"Quiet indoor room","background":"Soft neutral wall in warm beige tones","lighting":"Low, warm ambient lighting creating a moody, intimate atmosphere with gentle shadows"},"technical_specs":{"angle":"Close-up front-facing portrait (selfie-style)","aesthetic":"Soft grunge / e-girl inspired look with strong light–dark contrast","focus":"Crisp facial and eye detail, shallow depth of field with subtly blurred background"}}}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Social Media Post - Train-ad style book advertisement image',
                    'A detailed Japanese prompt for generating a 16:9 business-book-style advertisement featuring a specific book image with Japanese copy points.',
                    'Please generate an advertisement image.

==== Ad specifications ===
- Aspect ratio: 16:9 (horizontal)
- Product to advertise: the book in the first attached image
- Main eye-catcher: place the book from the first attached image in a three-dimensional way
- Language: Japanese
- Taste: advertisement for a business book

# Text to include:
- Pre-head copy: 【New print run decided about one week after release】

Book “{argument name="book_title_en" default="Designing from Zero with AI"}” now on sale and doing well.

Amazon Best Seller Ranking
Ranked No.1 in commercial design sales (as of 10/15)
https://t.co/QxbYpfFVj6',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1763885539326_yao7in_G6WBYReawAAcp2x.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Social Media Post - AI Prompt Template for Generating Viral Titles and Copy for Middle-Aged and Elde',
                    'A detailed, multi-step guide for a content creator using AI (likely an LLM like Gemini or similar) to generate viral titles and accompanying copy targeted at middle-aged and elderly audiences. Step 1 provides a template for generating 10 similar clickbait titles based on a set of examples. Step 2 provides a template for generating a short, rhyming, and conversational blessing copy based on a generated title.',
                    'Congratulations, 3 great happy events are coming to your home in 2026! Catch them quickly
Your wishes are about to manifest, everything you ask for will come true, good luck is rushing towards you
Your family is about to welcome a little noble son, quickly catch this good luck for the whole family!
Everything that makes you happy is boosting you, everything that makes you depressed is restraining you, don''t disbelieve it
The noble person for your child is on the way
May you, in the days to come, hold health in your left hand and wealth in your right, safe and smooth!
You are about to become prosperous, rising steadily to great wealth, meeting noble people easily, and great luck is coming
Starting in December, everything will go smoothly, all your wishes will be fulfilled beyond expectation, don''t doubt it, the whole of December is your lucky month
Only those with deep blessings will see this article, don''t disbelieve it
Energy tip: Your hardships are about to end, good days are rushing in
Don''t rush away, someone specifically asked me to bring three warm words, each containing full good luck
You are born lucky, whatever you think of comes, whatever you do succeeds

Summarize the writing style of the titles above, then expand your thinking, and based on your summary, write 10 similar viral titles for me.

I am a public account creator. Based on the title: "{argument name="title" default="You are born lucky, in 2026 whatever you think of comes, whatever you do succeeds"}". Write a blessing copy for me. Structure requirement: 5 paragraphs, 2 clauses per sentence. Style requirement: short, down-to-earth, colloquial expression, without AI stiff words or internet slang, understandable by middle-aged and elderly people.',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769582014771_t3rm4i_G_unQaRaUAAVM5x.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Social Media Post - Intimate Close-up Portrait with Direct Gaze and Ring Light',
                    'A complex JSON prompt for Nano Banana Pro focusing on generating an intimate, ultra-photorealistic close-up portrait. The prompt emphasizes a direct, seductive gaze, detailed skin texture (visible pores, subsurface scattering), specific hair and makeup details (chocolate-brown hair, coral-red glossy lips), and a cozy, low-key bedroom setting illuminated by a strong directional ring light. It requires using a reference image to maintain facial consistency.',
                    '{
    "subject": {
        "core_identity": "Use the same face from the reference image without changing facial features, fair skin with soft warm undertones, natural glamorous beauty, shoulder-length straight chocolate-brown hair with subtle warm tones",
        "skin_and_facial_details": "hyper-detailed photorealistic skin:1.4, visible fine pores on nose cheeks and chin, subtle subsurface scattering creating gentle luminous glow, natural small imperfections and faint texture, highly detailed irises with rich radial patterns and sharp catchlights from ring light and phone flash, defined brows, long curled lashes, full glossy lips with rich coral-red color and high shine:1.3",
        "hair": "shoulder-length straight chocolate-brown hair with warm undertones, clean blunt bob cut with soft face-framing layers, strands catching ring light with realistic shine separation and subtle movement:1.2",
        "body_figure": "slender yet softly curvaceous feminine silhouette with balanced proportions:1.2, gentle shoulder line exposed by low-cut top, visible delicate collarbones, natural bust contour softly pressed against fabric, slim waist and hips implied in close-up frame, natural asymmetry in relaxed reclined posture",
        "micro_expression": "direct intimate gaze with slightly hooded eyes looking into camera, softly parted glossy lips in gentle seductive pout, subtle knowing smile at corners, conveying private allure, relaxed confidence and sensual invitation through heavy-lidded eyes and relaxed facial expression:1.2"
    },
    "apparel_and_materials": "black velvet or plush cropped top with low neckline, soft luxurious fabric with deep pile texture, subtle sheen and light absorption creating rich dark tones, natural drape and compression folds around bust and shoulders from reclined pose:1.3",
    "pose_and_action": "intimate close-up bedroom selfie pose lying on bed or pillow, head tilted slightly toward camera, shoulders relaxed, body angled to show neck and collarbone line, posture conveys private relaxation, sensual closeness and inviting vulnerability through reclined position and direct eye contact:1.2",
    "scene_and_environment": "cozy modern bedroom interior, soft teal/blue-green curtains in background, warm ring light providing key illumination, neutral bedding, private intimate space with soft low-key atmosphere:1.1",
    "lighting_shadows_and_color_design": "strong directional ring light from upper front-right creating soft yet dramati',
                    'Portrait',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769582035395_aoa1st_G_uj5xjaAAASH7w.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Social Media Post - Minimalist Lifestyle Photography Prompt',
                    'A structured prompt for generating an editorial-style, highly realistic image of a young woman sitting casually indoors in a modern minimalist setting. It specifies natural daylight, neutral color palette, and a medium full-body shot.',
                    '{
  "image_generation": {
    "subject": {
      "description": "young woman sitting casually indoors",
      "pose": "sitting on a wooden stool with knees pulled up, holding a cold drink with both hands",
      "expression": "calm, neutral, slightly introspective",
      "gaze": "looking directly at the camera"
    },
    "appearance": {
      "hair": {
        "color": "natural black",
        "style": "long, straight, center-parted"
      },
      "face": {
        "skin_tone": "fair with natural blush",
        "makeup": "minimal, natural makeup"
      },
      "accessories": [
        "silver over-ear headphones",
        "brown leather shoulder bag"
      ]
    },
    "outfit": {
      "top": "{argument name="top color" default="white"} fitted tank top",
      "outerwear": "light beige textured overshirt",
      "bottom": "white relaxed-fit pants",
      "footwear": "gray sneakers with white stripes"
    },
    "environment": {
      "setting": "modern minimalist indoor space",
      "background_elements": [
        "concrete wall",
        "black refrigerator",
        "open doorway",
        "wooden table"
      ],
      "floor": "polished concrete"
    },
    "props": {
      "drink": "iced coffee in a transparent plastic cup with black straw",
      "furniture": "round wooden stool"
    },
    "lighting": {
      "type": "natural daylight",
      "direction": "side lighting from window",
      "quality": "soft and diffused"
    },
    "camera": {
      "angle": "eye-level",
      "framing": "medium full-body shot",
      "lens": "35mm",
      "depth_of_field": "moderate, background softly in focus"
    },
    "aesthetic": {
      "style": "minimalist lifestyle photography",
      "vibe": "cozy, relaxed, modern",
      "color_palette": "neutral tones, beige, white, gray"
    },
    "quality": {
      "realism": "highly realistic",
      "resolution": "high resolution",
      "look": "editorial lifestyle photo"
    }
  }
}',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769582042437_hg0qhu_G_udOq6WAAATbyr.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Social Media Post - Cinematic Festival Portrait Prompt',
                    'A detailed prompt for Nano Banana Pro on Gemini, requesting a cinematic, high-resolution, extreme close-up portrait of a young woman at an electronic music festival. The prompt specifies her appearance, pose, clothing, and the dramatic, vibrant lighting dominated by cyan and other colors. It explicitly requires using the character from an uploaded photo without alteration.',
                    'Create a cinematic, high-resolution, extreme close-up shot portrait of a young woman(character in the uploaded photo, no alternation) at an electronic music festival. She has long brunette black hair. She is looking back(joyful)over her shoulder with a calm, cool expression. She is wearing {argument name="accessories" default="round, retro-style sunglasses that reflect the surrounding lights"}, and a {argument name="clothing" default="white textured jacket"}. The lighting is dramatic and vibrant, dominated by streaks of cyan and',
                    'Portrait',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769582041036_dkngl4_G_uQZdvbAAE8WuC.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Social Media Post - Sydney Sweeney Wardrobe Selection Generator (4 Scenes)',
                    'A JSON prompt designed to generate four distinct images of Sydney Sweeney, each showcasing a different outfit and environment: a wetsuit on a lake boat, a cream suit on a luxury yacht at sunset, an emerald green evening gown in a hotel lobby, and a casual floral dress in a park. This prompt appears to be a structured input for an image generation system to select or generate diverse looks.',
                    '{
  "subject": "{argument name="subject name" default="Sydney Sweeney"}",
  "images": [
    {
      "id": "image_01",
      "scene": "Boat on Lake",
      "description": "Sydney Sweeney relaxing on a boat with a German Shepherd.",
      "action": "Hugging a large dog",
      "clothing": {
        "item": "Wetsuit  Swimwear",
        "color": "Black",
        "style": "Long sleeve, sleek"
      },
      "environment": {
        "location": "Lake",
        "background": "Pine forest and water",
        "lighting": "Daylight"
      }
    },
    {
      "id": "image_02",
      "scene": "Luxury Yacht",
      "description": "Sydney Sweeney standing on a yacht deck at sunset.",
      "action": "Holding a champagne glass, posing elegantly",
      "clothing": {
        "item": "Suit",
        "color": "Cream / Off-white",
        "style": "Oversized blazer, trousers, silk camisole",
        "accessories": "Layered necklaces"
      },
      "environment": {
        "location": "Coastal sea",
        "background": "Coastline with hills and buildings",
        "lighting": "Golden hour  Sunset"
      }
    },
    {
      "id": "image_03",
      "scene": "Luxury Interior",
      "description": "Sydney Sweeney sitting in an opulent hotel lobby or hall.",
      "action": "Sitting and smiling",
      "clothing": {
        "item": "Evening Gown",
        "color": "Emerald Green",
        "style": "Satin fabric with gold floral embroidery on the bodice",
        "accessories": "Gold clutch bag, drop earrings"
      },
      "environment": {
        "location": "Hotel Lobby / Ballroom",
        "background": "Marble columns, chandeliers",
        "lighting": "Warm indoor lighting"
      }
    },
    {
      "id": "image_04",
      "scene": "Park Bench",
      "description": "Sydney Sweeney sitting on a wooden bench in a park.",
      "action": "Resting with a book",
      "clothing": {
        "item": "Casual Outfit",
        "style": "Floral midi dress with denim jacket",
        "footwear": "Brown sandals",
        "accessories": "Brown leather tote bag"
      }
    }
  ]
}',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769581988172_nex0ly_G_tUxEFWEAEDmFx.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Social Media Post - Cinematic Fashion Portrait in Underground Parking',
                    'A highly detailed JSON prompt for generating an ultra-realistic fashion editorial portrait of a young woman sitting on the ground in an underground parking area. The prompt specifies clothing (oversized sweatshirt, mini skirt, red high-heeled sandals), confident posture, and cinematic lighting with neon accents.',
                    '{
  "subject": {
    "type": "young woman",
    "style": "ultra realistic, fashion editorial",
    "mood": "calm, confident, grounded",
    "appearance": "natural skin texture, realistic proportions, high detail",
    "identity": "generic character, replaceable with custom face or reference"
  },

  "pose": {
    "position": "sitting on the ground",
    "legs": "bent to the side, extended forward, knees slightly raised, ankles subtly crossed",
    "arms": "placed behind the body for support",
    "hands": "palms flat on the ground, fingers relaxed",
    "torso": "upright with slight natural lean back",
    "shoulders": "relaxed",
    "body_language": "relaxed yet intentional, confident posture"
  },

  "clothing": {
    "top": "oversized off-white long sleeve sweatshirt",
    "fit": "loose, casual",
    "fabric": "soft cotton texture",
    "bottom": "high-waisted olive green short skirt",
    "details": "subtle fabric tie details on the sides",
    "style": "minimal, modern, editorial"
  },

  "shoes": {
    "type": "high-heeled sandals",
    "color": "{argument name="shoe color" default="red"}",
    "design": "thin strappy, open-toe",
    "finish": "glossy",
    "style": "elegant, feminine"
  },

  "accessories": {
    "bag": "small {argument name="bag color" default="red"} shoulder bag",
    "bag_position": "hanging from right shoulder",
    "jewelry": "none or minimal",
    "overall_style": "clean, uncluttered"
  },

  "hair": {
    "style": "loose waves or soft curls",
    "volume": "medium",
    "finish": "natural, slightly tousled but polished",
    "texture": "realistic hair strands"
  },

  "gaze": {
    "direction": "looking directly at the camera",
    "expression": "neutral to slightly serious",
    "eyes": "calm, focused",
    "lips": "relaxed, no smile",
    "emotion": "confident, introspective"
  },

  "environment": {
    "location": "underground parking area",
    "atmosphere": "vibrant, lively",
    "lighting": "warm lights with neon accents",
    "background_style": "colorful reflections, slightly blurred"
  },

  "photography": {
    "camera_angle": "eye-level to slightly low angle",
    "lens": "35mm",
    "framing": "medium-wide shot",
    "focus": "sharp focus on subject, soft background blur",
    "depth_of_field": "shallow",
    "lighting_setup": {
      "key_light": "soft key light from front-left",
      "fill_light": "gentle fill to soften shadows",
      "rim_light": "subtle back light to separate subject from background"
    },
    "style": "cinematic fashion photography",
    "color_grading": "muted cinematic tones with subtle color accents",
    "contrast": "balanced, natural"
  },

  "negative_prompt": {
    "style": "cartoon, anime, illustration, painting, CGI, 3D render",
    "anatomy": "distorted body, unrealistic proportions, extra limbs, extra fingers",
    "quality": "blurry face, low detail, low resolution, noise, grain",
    "skin": "plastic sk"
  }
}',
                    'Portrait',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769581977253_66psq1_G_s3ImCWgAAIFnA.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Social Media Post - Casual Lifestyle Portrait in Cafe',
                    'A detailed JSON prompt for generating a casual lifestyle portrait of a young woman in a cafe, focusing on specific pose details, athleisure outfit (unitard/jumpsuit), and high-end accessories like a Louis Vuitton handbag, captured with a relaxed, confident aesthetic.',
                    '{
  "scene": "Casual lifestyle portrait in an indoor cafe setting",
  "subject": {
    "character": "Young female with a friendly, relaxed demeanor",
    "face": {
      "structure": "Oval shape with prominent cheekbones and visible dimples",
      "skin": "Tan, smooth, glowing complexion",
      "eyes": {
        "shape": "Almond",
        "color": "Dark brown",
        "expression": "Direct eye contact, engaging"
      },
      "mouth": {
        "lips": "Natural pink, smiling gently"
      },
      "makeup": "Natural ''no-makeup'' look, light blush, groomed brows"
    },
    "hair": {
      "color": "Dark brown to black",
      "length": "Shoulder-length (lob)",
      "texture": "Straight with slight volume",
      "style": "Loose with wispy bangs framing the forehead",
      "shine": "Healthy, slight sheen"
    },
    "accessories": {
      "necklace": "Thin gold chain with a heart pendant",
      "earrings": "Small silver or gold hoops",
      "bracelets": "Thin metallic bracelets on both wrists",
      "rings": "Simple bands on fingers"
    }
  },
  "pose": {
    "overall": "Casual seated pose, leaning back slightly against the chair",
    "position": {
      "base": "Sitting on a wooden chair",
      "orientation": "Facing forward towards the camera"
    },
    "torso": {
      "direction": "Frontal",
      "posture": "Relaxed but upright"
    },
    "arms": {
      "position": "Right arm holding a straw/drink, left arm resting near the table",
      "other": "Holding an iced drink near chest level"
    },
    "legs": {
      "position": "Asymmetrical; right leg bent with knee drawn up, left leg extended downwards",
      "visible": "Legs fully visible in tight fitting clothing"
    },
    "head": {
      "turn": "Facing straight forward",
      "expression": "Soft, confident smile"
    }
  },
  "outfit": {
    "activewear": {
      "type": "Sleeveless unitard / jumpsuit",
      "color": "Beige / Nude",
      "style": "Athleisure",
      "details": {
        "top": "V-neckline, sleeveless",
        "fit": "Form-fitting, skin-tight",
        "material": "Ribbed or smooth stretch fabric"
      }
    },
    "footwear": {
      "type": "Sneakers",
      "style": "Grey athletic running shoes (New Balance style)",
      "socks": "White ribbed crew socks"
    }
  },
  "body": {
    "type": "Fit, slender",
    "skin": "Tan"
  },
  "environment": {
    "location": "Coffee shop interior",
    "furniture": {
      "table": "Round wooden table with slatted base",
      "chair": "Wooden chairs with simple backrests"
    },
    "objects": {
      "drink": "Glass of iced {argument name="drink type" default="green matcha latte"} with a glass straw",
      "bag": "Louis Vuitton Monogram Speedy handbag on the table",
      "sunglasses": "Black frame sunglasses on the table",
      "coaster": "Small wooden plate/coaster"
    },
    "background": {
      "people": "Blurred figures sitting at other tables",
      "floor": "Concrete or stone tile"
    }
  }
}',
                    'Portrait',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769581960034_99wqan_G_szpDFWkAAsYq0.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Social Media Post - Hyper-Realistic High-End Fashion Editorial Portrait with Identity Lock',
                    'A complex, detailed JSON prompt designed for hyper-realistic image generation, focusing on achieving absolute 1:1 facial identity lock and preserving natural imperfections for a high-end fashion editorial look. It specifies detailed anatomy, lighting, and technical parameters for a subject leaning on a swimming pool edge.',
                    '{
  "version_control": {
    "target_style": "High-End Fashion Editorial",
    "fidelity_level": "Absolute 1:1 Identity Lock",
    "rendering_engine_constraints": "No CGI, No Illustration, No AI Smoothing"
  },
  "subject_profile": {
    "identity": {
      "name": "{argument name="subject name" default="Sophie Rain"}",
      "age_group": "Adult Woman",
      "biometric_integrity": "Preserve 100% original bone structure, facial asymmetry, moles, and eye shape. Zero morphing or enhancement."
    },
    "anatomy_and_skin": {
      "texture": "Visible pores, micro-creases, subtle translucency",
      "physics": "Natural water droplets, soft wet sheen, realistic surface tension on skin",
      "tone": "Natural base skin tone, sun-kissed warmth, no artificial glow"
    },
    "face_details": {
      "eyes": "Natural eye color, soft neutral-pink glossy shadow, thin lash-line eyeliner (no wing), separated curled lashes",
      "brows": "Natural density, straight-to-softly-rounded architecture",
      "nose_and_lips": "Subtle pink warmth on nose bridge; full lips, rose-pink gradient, wet glossy finish, blurred edges, no overlining"
    },
    "hair_styling": {
      "state": "Visibly wet, slicked at roots, damp strands",
      "arrangement": "Loose, flowing over shoulders and back, natural messy texture",
      "match_reference": "1:1 color and style match"
    }
  },
  "composition_and_pose": {
    "action": "Leaning on swimming pool edge, body angled 45-degrees" with feet in water,
    "arm_placement": "Both arms resting on thighs ",
    "framing": "Medium close-up, three-quarter angle",
    "mood": "Intimate, calm, grounded, confident"
  },
  "attire_and_wardrobe": {
    "primary_garment": "Minimalist {argument name="swimsuit color" default="red"} swimsuit, thin straps, clean lines",
    "fabric_physics": "Realistic tension against wet skin, natural folds and bunching",
    "jewelry": "Statement earrings, natural stones/gold, realistic micro-scratches and reflections"
  },
  "environment_and_lighting": {
    "background": {
      "element": "Turquoise pool water",
      "physics": "Refraction, light-play on pool floor, subtle ripples, realistic movement"
    },
    "lighting_design": {
      "source": "Single-direction natural sunlight",
      "color_temp": "Warm sun-lit tones",
      "exposure": "Slightly underexposed (lowered exposure)",
      "shadows": "Physically accurate contact shadows on collarbones and chest"
    }
  },
  "technical_parameters": {
    "optics": "50mm–85mm focal length equivalent, realistic photographic perspective",
    "depth_of_field": "Shallow, organic bokeh, natural fall-off",
    "resolution_quality": "16k Hyper-Realistic",
    "aspect_ratio": "3:4"
  }
}',
                    'Portrait',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769581916309_ot692r_G_sx6D9W8AAn4Ex.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Social Media Post - Nano Banana Pro Handwriting Generation Prompt',
                    'A detailed prompt for Nano Banana Pro designed to generate a single line of Japanese handwritten text in a specific feminine, stylish, and airy aesthetic. It specifies the writing instrument (fine gel pen), stroke characteristics (thin, light, monoline), and introduces intentional irregularities in character size, spacing, and baseline slant to mimic natural handwriting. The prompt explicitly requires reference images for style guidance and includes a negative prompt to avoid brush/calligraphy styles.',
                    'Use the attached reference images as the handwriting style guide (especially the second image with handwriting samples). Create a single line of Japanese handwritten text on clean white paper. Written with a fine gel pen / fineliner (0.3–0.4mm look), thin and light strokes, mostly monoline (no brush or marker look). Match a stylish, airy, feminine handwriting feel: soft curves, light touch, and a slightly right-leaning slant.Add clear personality through noticeable character size variation (some characters 10–25% larger/smaller), irregular spacing, and a gentle upward baseline from left to right. Add elongated entry and exit strokes (long, tapered starts/tails) on a few characters—especially the first character, any elongated/extended marks in the text, and the final character—while keeping everything readable.Write exactly this text: "{argument name="text to write" default="The true chocolate tasted like an adult''s."}" No extra text, no borders, no logos, no underline, no decorative swoosh lines. High resolution, sharp thin ink lines, minimal paper texture.
Negative:
brush pen, calligraphy, shodo, marker, thick strokes, bold ink, heavy pressure, paintbrush, blocky lettering, uniform character size, perfect spacing, perfectly straight baseline, printed font, typeset, outline font, extra words, watermark, frame, stamps, underline, swoosh line, doodles
Extra:
Keep strokes thin; create expressiveness mainly with size/spacing/baseline and tapered stroke ends, not thickness.Increase character size contrast and spacing irregularity, but keep legibility.',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769582030644_le72bb_G_o0py4akAABSoj.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Social Media Post - Hyper-Realistic Cinematic Study of a Fit Korean Girl',
                    'An extremely detailed, structured prompt for Nano Banana Pro designed to generate a hyper-realistic, raw, and unfiltered photographic study of a fit South Korean woman. It specifies complex hardware/optical fidelity settings (Prosumer DSLR, 50mm Prime, Moody Underexposed), anatomical physics (extreme hourglass ratio, detailed vascularity, sweat beads), pose (hands behind head, aggressive arched spine), and Chiaroscuro studio lighting.',
                    '{ "hardware_and_optical_fidelity": { "camera_tier": "Prosumer DSLR", "lens_specification": { "focal_length": "50mm Prime", "lens_character": "Sharp Modern Master Prime", "aperture_blade_shape": "Circular (creamy, round bokeh highlights)" }, "manual_settings": { "exposure_mode": "Moody Underexposed -1.5", "shutter_execution": "1/200s (Static)", "iso_noise_profile": "ISO 400 (Fine film-like grain)", "white_balance": "Mixed Lighting (Cool rim lights vs Neutral skin tones)" } }, "optical_artifacts_and_filth_engine": { "chromatic_aberrations": "Subtle longitudinal CA in the out-of-focus highlights behind the subject", "digital_defects": "Clean sensor output with zero post-processing artifacts", "physical_defects": "Micro-scratches on the lens causing subtle light blooming; atmospheric dust motes visible in light shafts", "lens_flare": "Hazy veiling glare from the overhead backlight", "focus_errors": "Razor sharp focus on the iris of the lead eye" }, "identity_and_celebrity_anchors": { "celebrity_base": "NONE", "demographics": { "ethnicity": "South Korean", "age": "24" }, "skin_authenticity": "High-gloss athletic oil; visible sweat beads on the sternum and forehead; hyper-detailed pores; razor-thin vascularity on lower abdominals" }, "pose_and_erotic_tension": { "hand_placement": "Both hands behind head, fingers interlaced in long black hair, pulling slightly upward to elongate the torso", "body_geometry": { "tilt": "Aggressive arched spine with a sharp lateral pelvic tilt to emphasize hip curve", "camera_relation": "Eye-level, medium-full shot" }, "erotic_markers": "Heavy-lidded gaze; parted lips with visible moisture; high-tension muscle flexion in the obliques and quads; flushed skin tone" }, "anatomical_physics_extreme": { "waist_to_hip_ratio": "0.65 (Extreme hourglass)", "bust_and_gluteal_physics": { "mass": "Athletic, firm C-cup", "gravity": "Realistic firm lift; deep contact shadows in the iliac furrow; gluteal shelf projection with hard muscle definition", "occlusion": "Deep contact shadows where the fabric meets the skin; sharp definition of the serratus anterior" }, "clothing_interaction": "High-cut black monokini; fabric straining at the hips; thin straps creating deep indentations into the trapezius and hip flesh" }, "environment_and_lighting": { "lighting_control": "Chiaroscuro studio lighting; harsh rim lighting to outline the silhouette; volumetric fog catching the light from behind", "environment": "Dark, minimalist studio with subtle atmospheric haze and a reflective floor" } } THE FINAL MASTER PROMPT (The "Hard-Code" Execution) Directive: Generate a hyper-realistic, raw, and unfiltered photographic capture. This is a high-tension sensual study requiring precise control over hardware quality and anatomical physics. Hardware & Optical Execution (ENFORCE): Simulate a capture using a Prosumer DSLR with a 50mm Prime lens. Apply Mixed Lighting white balance. Set exposure to Moody Underexpos',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769582033932_cq4l1y_G_sbdtKbAAM8iYA.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Social Media Post - Editorial Contact Sheet Prompt: Woman with Pink Tulips',
                    'A highly structured JSON prompt for Nano Banana Pro to generate a 3x3 editorial contact sheet featuring the same young woman posing with a large bouquet of pink tulips against a plain beige wall. The prompt specifies detailed output settings, lighting (soft window daylight), camera parameters (50mm prime, f2.8), and specific poses for the panels, requiring a reference image for style and composition.',
                    '{
  "generation_request": {
    "meta_data": {
      "tool": "NanoBanana Pro",
      "task_type": "photoreal_editorial_contact_sheet_9panel",
      "version": "v1.0_9PANEL_TULIP_CONTACT_SHEET_MINIMAL_WALL_NO_TEXT_EN",
      "priority": "highest",
      "language": "en"
    },
    "references": {
      "reference_image_style": {
        "source": "UPLOAD_REFERENCE_IMAGE (RECOMMENDED)",
        "purpose": "STYLE_GRID_LAYOUT_POSE_VIBE_ANCHOR",
        "strict_lock": true,
        "preserve_composition": true,
        "preserve_vibe": true
      },
      "reference_image_face": {
        "source": "UPLOAD_REFERENCE_IMAGE (OPTIONAL)",
        "purpose": "FACE_IDENTITY_LOCK",
        "strict_lock": false
      }
    },
    "output_settings": {
      "aspect_ratio": "1:1",
      "orientation": "square",
      "resolution_target": "ultra_high_res",
      "render_style": "editorial_ultra_photoreal_contact_sheet",
      "sharpness": "crisp_but_natural",
      "film_grain": "very_subtle_35mm",
      "dynamic_range": "natural_filmic_not_hdr",
      "color_grade": "soft_neutral_beige_wall_pastel_pink_flowers",
      "skin_rendering": "natural_skin_texture_no_beautify",
      "grid_layout": {
        "type": "3x3",
        "borders": "thin_white_dividers",
        "panel_consistency": "same_room_same_light_same_outfit"
      },
      "lens_and_camera": {
        "camera": "full_frame_dslr_look",
        "lens": "50mm_prime",
        "aperture": "f2.8",
        "focus_style": "subject_in_focus_minimal_distortion"
      },
      "lighting": {
        "key": "soft_window_daylight",
        "fill": "gentle_bounce",
        "mood": "calm_minimal_editorial"
      },
      "background": {
        "environment": "plain_beige_wall_indoor",
        "clean": "no_clutter_no_props"
      }
    },
    "scene": {
      "global_description": "A 9-panel (3x3) editorial contact sheet featuring the same young woman posing with a large bouquet of pink tulips in front of a plain beige wall. Minimal, clean, natural window light. Same outfit throughout: light neutral top and high-waisted blue jeans. Each panel shows a different pose or crop (side profile, back pose, three-quarter, playful lean, and close-up bouquet). No text anywhere.",
      "subject": {
        "description": "young adult woman, long wavy dark brown hair, natural makeup, relaxed expressions",
        "wardrobe": "simple light neutral top (strapless or thin straps) + high-waisted blue jeans",
        "flowers": "large bouquet of fresh pink tulips with long green stems and leaves"
      },
      "panels": [
        {
          "panel": "1",
          "framing": "medium",
          "pose": "three-quarter view, holding bouquet low, looking to the side"
        },
        {
          "panel": "2",
          "framing": "medium",
          "pose": "arched back slightly, chin up, bouquet held at waist"
        },
        {
          "panel": "3",
          "framing": "medium",',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769582018272_xsceyx_G_sW6ABWcAA-VzH.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Social Media Post - High-End Editorial Flash Photo in Luxury Car Backseat',
                    'An extremely detailed, structured prompt for generating a photorealistic, high-end editorial flash photo of a woman in the backseat of a luxury black car at night. It enforces strict face identity lock (if reference is provided), specifies a deep crimson red bodycon dress, and demands strong direct on-camera flash for crisp highlights and deep shadows, achieving a clean, cinematic look.',
                    '{
  "generation_request": {
    "meta_data": {
      "tool": "NanoBanana Pro",
      "task_type": "photoreal_luxury_car_interior_editorial_flash",
      "version": "v1.0_BACKSEAT_RED_DRESS_EDITORIAL_FLASH_NO_TEXT_EN",
      "priority": "highest",
      "language": "en"
    },

    "references": {
      "reference_image_face": {
        "source": "UPLOAD_REFERENCE_IMAGE (OPTIONAL)",
        "purpose": "FACE_IDENTITY_LOCK",
        "strict_lock": true,
        "face_similarity_priority": "MAX",
        "no_identity_blending": true,
        "no_beautify": true,
        "no_age_shift": true,
        "preserve_skin_texture": true,
        "preserve_facial_proportions": true,
        "preserve_moles_freckles_scars": true,
        "preserve_eye_shape": true,
        "preserve_nose_shape": true,
        "preserve_lip_shape": true,
        "preserve_jawline": true
      },
      "reference_image_style": {
        "source": "UPLOAD_REFERENCE_IMAGE (OPTIONAL)",
        "purpose": "STYLE_COMPOSITION_LIGHTING_ANCHOR",
        "strict_lock": false,
        "preserve_composition": true,
        "preserve_palette": true,
        "preserve_vibe": true,
        "preserve_lighting": true
      }
    },

    "global_constraints": {
      "rating": "PG-13",
      "no_nudity": true,
      "no_explicit_sexual_content": true,
      "no_logos": true,
      "no_watermark": true,
      "no_readable_text": true
    },

    "output_settings": {
      "aspect_ratio": "4:5",
      "orientation": "portrait",
      "resolution_target": "ultra_high_res",
      "render_style": "high_end_editorial_flash_photo",
      "sharpness": "crisp_but_natural",
      "film_grain": "very_subtle",
      "color_grade": "deep_crimson_red_on_black_leather",
      "dynamic_range": "natural_not_hdr",
      "skin_rendering": "real_texture_no_retouch"
    },

    "creative_prompt": {
      "scene_summary": "A photoreal high-end editorial flash photo inside the backseat of a luxury black car at night. The same adult woman (face matches reference exactly if provided) is seated on black leather seats, posed elegantly and confidently. Strong direct on-camera flash creates crisp highlights and deep shadows. Overall palette is strictly deep crimson red + black interior, clean and cinematic. No text anywhere.",

      "subject_and_pose": {
        "pose": "woman seated sideways on the backseat, torso angled toward camera, legs folded to the side; one hand near her temple/ear as if adjusting hair, the other arm stretched along the seat back",
        "expression": "confident editorial gaze looking off-camera to the right (not smiling), lips slightly parted",
        "hair": "sleek updo bun or tight ponytail, a few soft wisps optional"
      },

      "wardrobe_makeup": {
        "outfit": "deep crimson full-length bodycon dress with long sleeves and a high neckline (turtleneck style), smooth fabric with clean folds, modest and elegant",
        "makeup": "defined b"',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769581950315_ptcupa_G_sJXBDWcAAwi98.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Social Media Post - Colosseum Golden Hour Editorial Portrait',
                    'A highly detailed JSON prompt template for generating an ultra-high-resolution photorealistic travel editorial portrait of a woman at the Roman Colosseum during golden hour, requiring strict adherence to a reference image for style and facial identity.',
                    '{
  "generation_request": {
    "meta_data": {
      "tool": "NanoBanana Pro",
      "task_type": "photoreal_travel_editorial_portrait_landmark",
      "version": "v1.0_ROME_COLOSSEUM_RED_DRESS_GOLDEN_HOUR_EDITORIAL_FACELOCK_EN",
      "priority": "highest",
      "language": "en"
    },

    "references": {
      "reference_image_style": {
        "source": "UPLOAD_REFERENCE_IMAGE (REQUIRED)",
        "purpose": "STYLE_COMPOSITION_ANCHOR",
        "strict_lock": true,
        "preserve_composition": true,
        "preserve_lighting": true,
        "preserve_palette": true,
        "preserve_vibe": true
      },
      "reference_image_face": {
        "source": "UPLOAD_REFERENCE_IMAGE (OPTIONAL)",
        "purpose": "FACE_IDENTITY_LOCK",
        "strict_lock": true,
        "face_similarity_priority": "MAX",
        "no_identity_blending": true,
        "no_beautify": true,
        "no_age_shift": true,
        "preserve_skin_texture": true,
        "preserve_facial_proportions": true,
        "preserve_eye_shape": true,
        "preserve_nose_shape": true,
        "preserve_lip_shape": true,
        "preserve_jawline": true
      }
    },

    "global_constraints": {
      "rating": "PG-13",
      "no_nudity": true,
      "no_explicit_sexual_content": true,
      "no_logos": true,
      "no_watermark": true,
      "no_readable_text": true
    },

    "output_settings": {
      "aspect_ratio": "4:5",
      "orientation": "portrait",
      "resolution_target": "ultra_high_res",
      "render_style": "cinematic_photoreal_travel_editorial",
      "sharpness": "crisp_but_natural",
      "film_grain": "subtle_35mm",
      "color_grade": "warm_golden_hour_neutral_stone_red_dress",
      "dynamic_range": "natural_not_hdr",
      "skin_rendering": "real_texture_no_retouch"
    },

    "creative_prompt": {
      "scene_summary": "Create a photoreal travel editorial portrait at the Colosseum in Rome during golden hour. Camera is eye-level with a slightly wide editorial perspective (natural proportions, not distorted). The Colosseum fills the background with strong architectural detail and warm sunlight on the stone.\n\nSubject: one adult woman with very long, dark, wavy hair. She is seated on a low stone wall in the foreground, turned slightly to her left, head angled left with eyes closed or looking away, calm and elegant expression. Natural posture: one hand resting on the wall, the other relaxed.\n\nWardrobe: deep {argument name="dress color" default="red/burgundy"} sleeveless cutout dress (tasteful side cutout), flowing maxi skirt with soft volume and realistic fabric folds. Minimal jewelry, clean editorial styling.\n\nProps: a single red rose with a pale stem/leaf placed on the stone wall to the subject’s right (viewer’s right), subtle and romantic.\n\nEnvironment: stone terrace/walkway with layered brick/stone textures in the foreground. Green shrubs/trees partially framing the right side. Clear blue sky.\n\nLighting: warm low-angle sunlight fro"
    }
  }
}',
                    'Portrait',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769581969247_fh1mcw_G_sGzDqXIAAEwvc.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Social Media Post - Hero Shot Portrait in a Bookstore with Warm Lighting',
                    'A detailed JSON prompt designed to generate a ''Hero Shot'' portrait of a character named Alara in a bookstore setting. The prompt specifies a medium shot, eye-level angle, direct eye contact, and a grounded, confident posture. It meticulously defines the environment (wooden shelves, stacked books), lighting (warm magic hour light/golden hour), outfit (cozy smart, reader aesthetic), and the desired vibe (sharp, fire in eyes, work mode), aiming for a high-quality, aesthetically pleasing image.',
                    '[
  {
    "frame": 1,
    "role": "HERO - Single powerful shot",
    "scene": "Bookstore, {argument name="time of day" default="Golden Hour"}, {argument name="season" default="Winter"}",
    "camera": {
      "shot_size": "medium shot, waist-up framing",
      "angle": "eye level angle, camera at subject height",
      "gaze": "direct eye contact with camera, engaging viewer"
    },
    "subject": {
      "movement": "standing still, grounded confident posture",
      "hand_position": "hands relaxed in natural position"
    },
    "location_rationale": "Bookstore equals intellect, reading life, quiet sophistication. I read badge.",
    "character_rationale": "Alara in work mode. Grind happening but aesthetic grind. I work hard message delivered beautifully.",
    "pose": "standing still, grounded confident posture. hands relaxed in natural position. Browsing shelves reaching up for book, or in corner reading first pages",
    "expression": "Fire visible in eyes, sharp engaged features, ready for anything, powerful",
    "outfit": "Cozy smart - sweater, good jeans, comfortable shoes. Tote bag for purchases. Glasses optional. Reader aesthetic. Color palette for season: black, cream, deep green, burgundy, charcoal, navy. Fresh natural makeup, dewy glowing skin. Signature piece: delicate gold necklace always present.",
    "props": "Books, maybe coffee if cafe attached, tote bag for purchases",
    "environment": "Bookstore with character, wooden shelves, stacked books everywhere, cozy corners",
    "lighting": "Warm magic hour light, horizontal gold, everything looks beautiful, romantic glow",
    "vibe": "Sharp, fire in eyes. Work mode. Book lover, mind as attractive as face",
    "consistency_note": "Hero shot, best angle and composition"
  }
]',
                    'Portrait',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769582036950_2z631d_G_sFBRjWAAA-1Nz.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Social Media Post - Urban Street Fashion Portrait with Vintage Accents',
                    'A detailed prompt for generating a realistic, 8k urban street fashion photograph with an Instagram aesthetic. It describes a young woman in oversized dark denim, a red baseball cap, and red sneakers (Adidas style), sitting on a wooden bench, holding a classic Coca-Cola bottle, set against a white brick wall with bright, natural daylight and harsh shadows.',
                    'A realistic, 8k ultra HD, 3:4 aspect ratio photograph with an Instagram aesthetic. Natural and radiant skin tone, dark peach blush, dark peach lipstick framed with brown eyeliner, voluminous curled lashes. A young and cool woman, wearing a dark blue oversized denim jacket and baggy dark blue jeans, sits on a wooden bench with her legs slightly spread. She wears a red baseball cap with a white ''NY'' logo, multiple silver chain necklaces, and hoop earrings. She has a white t-shirt underneath. On her feet are red suede sneakers with white three stripes (Adidas style). In one hand she holds a classic glass bottle of Coca-Cola. Next to her, on the bench, is a small red shoulder bag (Prada style).

In the background is a white painted brick wall. To the left, a large potted plant (Dracaena) with tall, green leaves is visible. The ground is gray concrete. The lighting is bright, natural daylight, casting harsh, realistic shadows on the scene. The colors are vibrant, and the style is urban/street fashion.',
                    'Portrait',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769582037019_tpjvoq_G_sDtEOWwAEBolK.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Social Media Post - Sensual Sports Photography of Two Women in a Boxing Gym',
                    'A detailed image generation prompt for creating editorial sports photography featuring two attractive women (Ana de Armas and Sydney Sweeney) in Muay Thai gear in a realistic gym setting. The prompt emphasizes sensual athleticism, high detail, and warm indoor lighting.',
                    'Sensual sports photography of two extremely attractive adult women in a Muay Thai / boxing gym, standing side by side in a confident, playful pose.
They wear sports bras, boxing gloves, Muay Thai shorts, and shin guards, smiling at the camera with strong, athletic body language.

Left woman:
Ana de Armas, Athletic, feminine build, confident posture, one arm raised in a flexing pose, {argument name="glove color 1" default="pink"} boxing gloves, {argument name="shorts color 1" default="red"} Muay Thai shorts, red shin guards. Calm, powerful, sensual confidence.

Right woman:
Sydney Sweeney, Blond, Athletic, toned physique, playful energy, gloves raised near her face in a cute boxing pose, {argument name="glove color 2" default="purple"} gloves, {argument name="shorts color 2" default="blue"} Muay Thai shorts, blue shin guards. Bright smile, flirtatious, sensual athletic expression.

They stand close together in a real gym environment with mats, training equipment, other athletes training in the background, industrial ceiling pipes, and wooden pillars.
Lighting is natural gym lighting with soft shadows and warm highlights.
The vibe is sensual athleticism, strength + femininity, confidence, playfulness, and sports glamour.

Photorealistic, high-detail, editorial sports photography style.

Visual Style

Cinematic sports realism
Editorial fitness photography
Natural skin texture
High detail
Balanced contrast
Warm indoor lighting
Authentic gym atmosphere

Camera & Composition

Wide-angle gym shot
Eye-level perspective
Natural depth of field
Candid but posed composition
Sharp focus on subjects
Slight background blur

Mood Keywords

Sensual athleticism
Confidence
Strength
Playful energy
Empowerment
Sports glamour
Modern femininity

Negative Prompt

exaggerated anatomy, plastic skin, CGI look, cartoon style,, watermark, text, logos',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769581974986_8s58up_G_sDSSSaEAAOJHP.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Infographic / Edu Visual - Atmospheric Product Interface Visual Prompt for SaaS UI',
                    'A prompt designed to generate a luxurious and calm visual representation of a modern SaaS product interface, emphasizing clarity, hierarchy, and a neutral color palette for a premium user experience.',
                    'Atmospheric product interface visual for a modern SaaS platform.
Clean hierarchy, balanced contrast,
soft shadows, neutral color palette,
focus on clarity and calm,
designed like a best-in-class SaaS experience.',
                    'Product',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769581933231_911rp4_G_JDloYXQAAXf5_.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Infographic / Edu Visual - First-Person AR Shopping Interface Overlay',
                    'This prompt generates a realistic first-person perspective (POV) image of holding strawberries, overlaid with a futuristic Augmented Reality (AR) interface displaying nutritional facts, freshness gauge, and a holographic shopping list, emphasizing high-tech, photorealistic lighting.',
                    'A realistic first-person perspective (POV) shot of a person''s hands holding a bunch of fresh, red strawberries in a blurred supermarket aisle. The image features a futuristic Augmented Reality (AR) interface overlay. 

Glowing holographic graphics surround the strawberries displaying nutritional information like ''Calories {argument name="calories" default="50kcal"}'', ''Vitamin C'', ''Folate'', and ''Fiber''. On the right, a digital gauge shows ''Freshness {argument name="freshness" default="95%"}'' and recipe suggestions like ''Strawberry Smoothie''. On the left, a holographic shopping list checks off items like Milk and Bread. 

High-tech, smart shopping concept, photorealistic lighting, 8k resolution.',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769581916201_rquqiz_G_rb0ZAa4AEQvdG.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Infographic / Edu Visual - Technical Infographic for E-commerce Product Description',
                    'A highly detailed, multi-part prompt designed to generate a technical infographic for an e-commerce product, combining a realistic photograph of the object with hand-sketched, architectural-style annotations, measurements, and schematic diagrams on a pure white background. The example object is a Tudor North Flag watch.',
                    'Create an infographic image of {argument name="object" default="Tudor North Flag"}, combining a realistic photograph or photorealistic render of the object with technical annotation overlays placed directly on top.

Use black ink–style line drawings and text (technical pen / architectural sketch look) on a pure white studio background.

Include:
•Key component labels
•Internal cutaway or exploded-view outlines (where relevant)
•Measurements, dimensions, and scale markers
•Material callouts and quantities
•Arrows indicating function, force, or flow (air, sound, power, pressure, movement)
•Simple schematic or sectional diagrams where applicable

Place the title {argument name="object title" default="[OBJECT]"} inside a hand-drawn technical annotation box in one corner.

Style & layout rules:
•The real object remains clearly visible beneath the annotations
•Annotations look hand-sketched, technical, and architectural
•Clean composition with balanced negative space
•Educational, museum-exhibit / engineering-manual vibe

Visual style:
Minimal technical illustration aesthetic.
Black linework layered over realistic imagery.
Precise but slightly hand-drawn feel.

Color palette:
Pure white background.
Black annotation lines and text only.
No colors.

Output:
Ultra-crisp
Social-feed optimized
No watermark',
                    'Product',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769582022891_iq0y5e_G_q2ckMaUAAo35h.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Infographic / Edu Visual - Photorealistic Diorama Isometric Map Prompt',
                    'A structured prompt for generating a highly detailed, photorealistic miniature diorama-style isometric map of a city. It specifies a 45-degree top-down angle with a tilt-shift effect, emphasizing oversized landmarks, detailed miniature architecture, and placement on a vintage textured paper map base.',
                    '"description": "Create a highly detailed, photorealistic miniature diorama style isometric map of {argument name="city location" default="CITY/LOCATION"} placed on a vintage textured paper map.",
  "perspective": {
    "type": "isometric",
    "angle": "45 degree top down",
    "look": "macro photography with tilt-shift miniature effect"
  },
  "geography": {
    "shape": "follows real geographic shape of {argument name="city location" default="CITY/LOCATION"}",
    "landmarks": {
      "oversized": true,
      "dominant": true,
      "primary_focus": "monuments",
      "secondary_elements": "smaller and simplified"
    },
    "architecture": "ultra detailed miniature",
    "roads": "selective",
    "greenery": true,
    "water_bodies": true,
    "terrain": true,
    "materials": ["stone", "wood", "concrete", "glass", "foliage"]
  },
  "lighting": {
    "type": "soft cinematic daylight",
    "effects": ["natural shadows", "warm highlights", "subtle atmospheric depth"]
  },
  "water": {
    "rivers": true,
    "coastlines": true,
    "depth_gradients": "smooth",
    "reflections": "gentle"
  },
  "map_base": {
    "type": "old world cartographic paper",
    "features": ["visible grid lines", "paper grain", "printed place names"]
  },
  "focus": {
    "sharp_on_landmarks": true,
    "edge_falloff": "gentle"
  },
  "quality": {
    "museum_quality": true,
    "handcrafted_diorama_realism": true,
    "ultra_high_resolution": true
  },
  "background": {
    "color": "clean pure white",
    "restrictions": ["no floating text", "no logos", "no watermarks", "no futuristic or cartoon elements"]
  },
  "aspect_ratio": "4:5"
}',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769581950900_ps2zx2_G_qU9b_bAAMHznl.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Infographic / Edu Visual - Motion and Image Prompt for Ultra-Realistic Food Photography of Pasta',
                    'A dual prompt for generating a motion sequence and a still image of ultra-realistic food photography. The motion prompt describes a smooth, precise spin of a pasta cup with ingredients separating while maintaining alignment. The image prompt specifies a detailed, high-quality shot of creamy white sauce penne pasta, focusing on texture, lighting, and a clean, commercial presentation.',
                    'Motion Prompt: The pasta Cup start to round spin while ingredients separate gently and precisely, maintaining alignment and scale. The motion is smooth, with no extra effects.

IMAGE 1 - Ultra-realistic food photography of a prepared creamy white sauce penne pasta served in a minimal ceramic bowl. Perfectly cooked penne coated evenly in rich, glossy cream sauce, topped with freshly grated parmesan cheese and finely chopped green herbs. Clean white studio background, soft diffused lighting, gentle shadows under the bowl, natural highlights on the sauce, realistic texture and thickness. Centered composition, shallow depth of field, premium restaurant-style presentation, high-detail food styling, 8K quality, sharp focus, no text, no labels, no hands, no props, no watermark.

IMAGE 2 - Exploded view of a creamy pasta bowl, presented as a clean commercial breakdown.
Exactly five ingredients, evenly spaced in vertical order.
Ingredient order (top → bottom):
Grated parmesan cheese — 20 g
Fresh herbs garnish — 5 g
Creamy white sauce — 80 g
Cooked penne pasta — 150 g
Serving bowl base — 200 g (bottom)
Minimal infographic annotations, instructional food design.',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769581932812_1vydnm_G_qHyuKWYAATSxB.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Infographic / Edu Visual - Prompt for Generating Logical Tree Diagrams with Nano Banana Pro',
                    'A user developed a specific prompt for Nano Banana Pro (using Gemini Pro mode) to generate logical tree diagrams or flowcharts based on a provided article text, emphasizing a technical, structured, and visually dense style.',
                    'Illustrate this article
({argument name="article text" default="Paste the article text you want to illustrate"})
This is how to illustrate it
A dense and expansive Japanese logic tree diagram drawn on a clean white page. The image is packed with structured information: neat hierarchical boxes, lists of bullet points, and precise connecting lines drawn with a fine-point pen.

There is no messiness; the "chaos" comes from the sheer overwhelming volume of organized data and Japanese text. It looks like a complex master plan or algorithm design. Important nodes are boxed in red. The handwriting is small, neat, and rapid.

Style: Technical diagram, neat handwriting, information visualization, minimalist background.
Quality: High definition, distinct Japanese text.',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769582032371_3rvbv1_G_p0puvXgAAy5CT.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Infographic / Edu Visual - Technical Infographic Overlay on a Photorealistic Object',
                    'A prompt template for generating an infographic image that combines a photorealistic render of an object with technical annotation overlays. It specifies black ink-style line drawings, key component labels, measurements, and schematic diagrams on a pure white background, creating an educational, engineering-manual aesthetic.',
                    'Create an infographic image of {argument name="object" default="[OBJECT]"}, combining a realistic photograph or photorealistic render of the object with technical annotation overlays placed directly on top.

Use black ink–style line drawings and text (technical pen / architectural sketch look) on a pure white studio background.

Include:
•Key component labels
•Internal cutaway or exploded-view outlines (where relevant)
•Measurements, dimensions, and scale markers
•Material callouts and quantities
•Arrows indicating function, force, or flow (air, sound, power, pressure, movement)
•Simple schematic or sectional diagrams where applicable

Place the title {argument name="object title" default="[OBJECT]"} inside a hand-drawn technical annotation box in one corner.

Style & layout rules:
•The real object remains clearly visible beneath the annotations
•Annotations look hand-sketched, technical, and architectural
•Clean composition with balanced negative space
•Educational, museum-exhibit / engineering-manual vibe

Visual style:
Minimal technical illustration aesthetic.
Black linework layered over realistic imagery.
Precise but slightly hand-drawn feel.

Color palette:
Pure white background.
Black annotation lines and text only.
No colors.

Output:
1080 × 1080 resolution
Ultra-crisp
Social-feed optimized
No watermark',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769581997562_huiwn9_G_o1kafacAArL5a.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Infographic / Edu Visual - Newspaper Mid-Unfold Diorama Prompt',
                    'A creative prompt for generating an epic 3D scene where a massive broadsheet newspaper is mid-unfold, and its headlines physically erupt into miniature dioramas of the events they describe. It specifies that column text rises as city blocks and the ink smell is almost visible, aiming for an 8K photorealistic result.',
                    'Epic 3D scene: a massive broadsheet newspaper mid-unfold, its headlines erupting into the events they describe. Front page stories become dioramas pushing off the page. {argument name="headline event" default="[HEADLINE EVENT]"} manifests in miniature chaos. Photographs animate and expand into three dimensions. Column text rises as city blocks of information. Editorial section becomes a battlefield of arguing figures. Classifieds transform into tiny desperate lives. Different sections occupy different worlds: sports as stadium, business as trading floor, obituaries as memorial garden. Yesterday''s news composites beneath as fading ghost layer. Ink smells almost visible as atmosphere. Newsstand visible at the edge, morning light, coffee steam, 8K, photorealistic.',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769495369914_qf8860_G_mCBDEakAAAadz.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Infographic / Edu Visual - Layered Diorama of Religious Architecture Evolution',
                    'A concise prompt for generating a layered diorama illustrating the evolution of religious architecture across different historical eras, specifying the arrangement of architectural styles from 5000 BC to 2025 AD, complete with era-coded tabs and relevant details like stained glass.',
                    'Layered Diorama: Evolution of Religious Architecture
Layers: Front ({argument name="era 1" default="5000 BC Architecture"}), middle 1 ({argument name="era 2" default="1200s Architecture"}), middle 2 ({argument name="era 3" default="1800s architecture"}) rear (2025 Architecture).
Details: Polished stone base with era-coded tabs (with appropriate materials and elements for each era). Details include stained glass windows, flying buttresses, and other era relevant elements. All years should be visible',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769495326507_cajw2n_G_Y0mtFXMAA93eu.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Infographic / Edu Visual - Isometric 3D Diorama of Product Evolution Prompt',
                    'A complex, multi-step system instruction prompt designed to generate a hyper-realistic, isometric 3D diorama illustrating the evolution of a product (like bread or whiskey) across three phases (Source, Industry, Experience). The diorama is displayed on an unrolled antique map, with the path connecting the scenes made of the raw material itself, simulating an ''Anno 1800'' strategy game aesthetic.',
                    'Input Variable:   {argument name="topic" default="[INSERT TOPIC]"} (e.g., The History of Bread, The Making of Whiskey, The Story of Silk, The Evolution of Paper)

  System Instruction:  
Generate a hyper-realistic, isometric 3D diorama displayed on an unrolled antique map. Use the following logic to procedurally generate the scene:

  1.  Deconstruction:  
      Analyze the Input:   Break the topic into   3 Phases of Production   (From Nature to Consumption).
      The Material Path:   Identify the raw unit of the topic (e.g., Coffee Beans, Wheat Grains, Silk Cocoons, Wood Chips). This material will form the physical "Road" connecting the scenes.

  2. Container (The Chart):  
      The Object:   A large, textured   Parchment Scroll   with curled edges, unrolled on a rich Mahogany wooden table.
      The Layout:   An   "S-Curve" Path   winds through the center of the scroll, connecting three distinct raised platforms.
      The Timeline:   Delicate black ink timeline markers (dates like 1600, 1850, 1920) run alongside the path.

  3.  Vignettes (The Production Line):  
  CRITICAL:   Do not generate Sci-Fi. Stick to   Historic and Modern Classic   aesthetics.

 Top Left - The Source):  
         Concept:  The Agricultural or Raw Origin.
         Visuals:  Rows of crops, a mine, or a forest growing directly out of a wooden block base.
         Figures:  Tiny farmers or laborers in period-appropriate rustic clothing harvesting the raw material.

 Top Right - The Industry):  
         Concept:  The Processing and Refinement (Industrial Revolution Era).
         Visuals:  A factory or mill with   Copper Stills, Brass Gears, Smokestacks, or Water Wheels  .
         Figures:  Workers operating machinery, steam rising from vents.

 Bottom Left - The Experience):  
         Concept:  The Final Consumption (The "Golden Age").
         Visuals:  A warm, inviting interior. A Victorian Pub, a Parisian Cafe, a Tailor Shop, or a Library.
         Figures:  Patrons enjoying the finished product in a social setting.

  4. The "Hero" Object (Bottom Right):  
    Instead of a fourth building, the path ends at a   Life-Sized "Hero" Object   sitting on the paper.
         (e.g., A perfect porcelain Cup of Coffee, A Loaf of Sourdough, A Crystal Whiskey Tumbler). 

  5. Visual Syntax:  
      The Path:   The road connecting the buildings is NOT dirt or asphalt. It is a   River of the Raw Material   (e.g., A road paved with Coffee Beans or Wheat grains).
      Typography:   An elegant Serif Header at the bottom: "The Evolution of [Input]".
      Lighting:   Warm, indoor "Library" lighting. Soft shadows, rich wood tones, no harsh neons.

  Output:   ONE image, 1:1 Aspect Ratio, Isometric Diorama, "Anno 1800" Strategy Game Aesthetic, High Texture,',
                    'Product',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769495366589_tjkws0_G_TpjlhWEAAlXba.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Infographic / Edu Visual - Nano Banana Slide Generation Discussion',
                    'This tweet discusses using Nano Banana for generating slides, highlighting Manus''s strength in combining powerful research with slide creation. It notes that the text in the slides is editable, making it potentially more convenient than using Gemini or NotebookLM.',
                    'Slide generation using Nano Banana',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769408678278_5qnjnw_G_gCcWoXoAADhgc.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Infographic / Edu Visual - Infographic for Minato-ku Women''s Fashion Magazine',
                    'A prompt to generate an infographic or feature page design for a fashion magazine targeting ''Minato-ku women'' (implying a sophisticated, high-end audience). The content should be systematic and easy to understand, utilizing icons, photos, graphs, diagrams, and handwritten pop-ups.',
                    'Design a feature page for a fashion magazine read by beautiful Minato-ku women. The content should be systematic, constructive, and easy to understand. Include icons, photos, graphs, diagrams, and handwritten pop-ups if necessary.',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769408676703_580d9h_G_d-Lh1bMAAyEZf.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Infographic / Edu Visual - Ultra-realistic Commercial Veg Burger Photography and Exploded View',
                    'A dual-prompt entry for food photography. The first prompt generates an ultra-realistic, perfectly stacked commercial image of a vegetarian burger. The second prompt generates an exploded, infographic-style view of the burger''s five ingredients, complete with specific weights, designed for commercial recipe breakdown. It also includes a motion prompt for a video of the burger spinning and separating.',
                    'Motion Prompt: The burger start to round spin while ingredients separate gently and precisely, maintaining alignment and scale. The motion is smooth, with no extra effects.

IMAGE 1 - Ultra-realistic studio food photography of a freshly prepared {argument name="burger type" default="vegetarian"} burger, centered in frame. A soft sesame seed bun on top, layered with ripe red tomato slices, melted cheddar cheese, a thick grilled veg patty with visible vegetables (corn, peas, carrots), crisp green lettuce, and a soft bottom bun. Perfectly stacked and symmetrical. Neutral light grey studio background with subtle texture, soft diffused lighting, gentle shadows beneath the burger, high sharpness and natural colors. Premium fast-food commercial style, realistic textures, glossy highlights on cheese and bun, shallow depth of field, ultra-high resolution, clean composition, no text, no labels, no hands, no props, no watermark.

IMAGE 2 - Exploded view of the same veg burger, presented as a clean, commercial recipe-style breakdown.
Exactly five ingredients, separated and arranged vertically from top to bottom, evenly spaced and perfectly aligned.
Ingredient order (top → bottom):
Fresh tomato slices — 30 g
Cheddar cheese slice — 25 g
Grilled veg patty — 90 g
Crisp lettuce — 20 g
Soft sesame burger bun — 80 g (bottom base)
Add clear infographic-style annotations for each ingredient with exact weights.
Minimal, instructional, commercial style on a light neutral background.',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769322282568_hmcc80_G_aUPoBaAAAce9l.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Infographic / Edu Visual - Encyclopedia of Flavor Diorama Generator',
                    'A highly complex, multi-step instructional prompt for generating a wide-angle 3D diorama of an ''Encyclopedia of Flavor'' based on a cuisine input. The prompt requires the AI to procedurally transform the pages of an open atlas into a landscape made of food ingredients (rice dunes, sauce rivers), populated by miniature working figures (HO Scale), all rendered with Octane Render and Golden Hour lighting.',
                    'Input Variable:   [{argument name="cuisine or dish" default="INSERT CUISINE OR DISH"}] (e.g., Persian Kebabs, Japanese Sushi, Italian Pasta, Mexican Tacos)

  System Instruction:  
Generate a hyper-realistic, wide-angle (16:9) 3D diorama of an "Encyclopedia of Flavor." Use the following logic to procedurally generate the scene:

  1. Flavor Profiling:  
      Analyze the Input:   Determine the   Region  ,   Staple Ingredients  , and   Cooking Method  .
         (e.g., Kebab = Fire/Coal, Rice, Meat. Sushi = Water, Fish, Rice). 
      The Terrain:   The pages of the book must physically transform into the landscape of the cuisine.
         Grain:  Rice or Couscous forms dunes.
         Liquid:  Sauces or Broths form rivers.
         Solid:  Bread or Meat forms mountains/cliffs.

  2. Container (The Wide Atlas):  
      The Object:   A massive, horizontal   Landscape-Format Atlas   lying open on an aged wooden banquet table.
      The Spine:   Runs horizontally through the center, acting as the "Equator" or "Main Road" of the scene.
      The Paper:   Parchment texture. The edges of the pages are tattered and stained with spices (Saffron, Paprika, Turmeric).

  3. Panoramic Composition (Left to Right Flow):  
  CRITICAL:   Do not place distinct plates. Create a continuous flow across the open spread.
      Left Side (The Origin - Agriculture):   The raw ingredients grow out of the paper.
         (e.g., Wheat stalks rising from the text; Cattle grazing on parsley fields; Fishermen casting nets into ink-blue water). 
      Center (The Process - The Kitchen):   The spine is the cooking zone.
         (e.g., A miniature Tandoor oven or Grill built into the book binding; Steam rising volumetrically). 
      Right Side (The Result - The Feast):   The finished dish explodes in scale.
         (e.g., A mountain of Saffron Rice topped with the Kebab; A Ziggurat of Sushi). 

  4. The Micro-Population 
      The Figures:   1:87 Scale (HO Scale) figures populate the landscape.
      The Action:   They are  working  the food.
         Harvesting:  Picking herbs from the margins.
         Transporting:  Carrying giant peppercorns like boulders.
         Cooking:  Using flamethrowers to char the meat or rakes to fluff the rice.

  5. Lighting & Atmosphere:  
      Aspect Ratio:     16:9 Horizontal.  
      Lighting:     "Golden Hour"   side-lighting. It should skim across the texture of the food and the paper grain, emphasizing the "Landscape" feel.
      Steam:   Volumetric steam connects the three zones (Left, Center, Right).

  Output:   ONE image, 16:9 Aspect Ratio, Macro Diorama Photography, Octane Render, High Texture Fidelity.',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769322274984_wa3ciw_G_O9zLEXkAArj0J.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'YouTube Thumbnail - Antarctica Penguin Adventure (2 Variations)',
                    'A prompt offering two variations for generating photorealistic, cinematic images set in Antarctica. The first is a wide-angle selfie with a man surrounded by Emperor penguins and glaciers. The second is a detailed scene of a man kneeling to shake hands/flipper with a penguin, emphasizing scale and adventure.',
                    'Prompt Image 1:- A wide-angle selfie photograph in Antarctica showing a man sitting on the snow, surrounded by a large colony of Emperor penguins. The man has short dark hair, a full beard, and is wearing red-lensed metal-frame sunglasses, a dark blue unbuttoned denim jacket over a white crew-neck t-shirt, dark blue cargo pants, and a brown canvas backpack. He is leaning slightly back, holding an orange smartphone in his right hand to take the selfie, with his left hand near the backpack strap. Around him, dozens of adult Emperor penguins are standing and walking on the snow, some close to the camera and others stretching into the distance. The background features massive towering glaciers and ice mountains with white cliffs and blue ice formations, deep snow with visible footprints, and a clear bright blue sky. Bright natural daylight creates crisp shadows, with sharp focus on the man, penguins, and the vast icy landscape, captured from a slightly low perspective that emphasizes scale and isolation.

Prompt Image 2:- A highly detailed, cinematic wide-angle photograph in Antarctica: a handsome young man with short dark neatly styled hair, a full trimmed beard, and a confident expression is kneeling on one knee in the deep snow, gently shaking hands / holding flipper with a large adult Emperor penguin standing upright in front of him. The man is wearing red-tinted metal-frame aviator sunglasses, a dark blue unbuttoned denim jacket over a white crew-neck t-shirt, dark blue cargo pants, brown canvas backpack with straps over both shoulders, white Nike sneakers, and a wristwatch. He is looking at the penguin with a slight smile, his right hand clasping the penguin''s flipper. The Emperor penguin is life-size, black head with yellow-orange neck patches, looking directly at the man. Surrounding them is a vast icy Antarctic landscape with massive towering glaciers, snow-covered mountains, blue ice formations, and distant icebergs under a clear bright blue sky. Crisp natural daylight, sharp shadows, high detail on textures of snow, denim fabric, penguin feathers, and facial features. Slightly low camera angle to emphasize scale and adventure, photorealistic style, sharp focus throughout, vibrant yet natural colors & heartwarming composition.',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769581925943_74wmf1_G_qyp4pboAAwicp.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'YouTube Thumbnail - Creating a Thumbnail Image with Text Overlay',
                    'A simple prompt used with Nano Banana Pro''s ''Image Editing'' feature to create a thumbnail image based on a selected source image, adding a specific text overlay.',
                    'Create a thumbnail image using the text "{argument name="text" default="Update Complete!"}"',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769582025923_6kdsxn_G_p9ghNXQAA6CtB.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'YouTube Thumbnail - Urban Night Portrait with 100% Facial Accuracy',
                    'A detailed JSON prompt for generating a high-impact cinematic urban night portrait. It explicitly requires 100% facial accuracy matching a reference image, focusing on street style, strong reflections on wet asphalt, and cinematic color grading.',
                    'High-impact cinematic depiction that matches the reference image with 100% facial accuracy. Featuring a young woman with long, wavy brown hair and a gentle smile. She is dressed in an oversized orange graphic t-shirt, a distressed denim mini-skirt, and clean white sneakers, complemented by a small brown crossbody bag. The subject is leaning casually against a metal pole on a wet urban street at night. The environment emphasizes a relaxed, modern city atmosphere with dramatic street lighting, neon accents, and strong reflections on the wet asphalt. Captured using a high-quality portrait lens with shallow depth of field, cinematic framing, and blurred city lights creating soft bokeh in the background. Ultra-detailed textures, realistic skin tones, professional cinematic color grading, sharp focus, HDR, ultra-high resolution 4K, masterpiece quality.',
                    'Portrait',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769581924904_rm0lir_G_p4t5LbAAAaaXm.jpg'],
                    '{"image_type":"Urban Night Portrait","style_tags":["cinematic","night photography","urban portrait","shallow depth of field","bokeh","street style","HDR","professional","wet street reflections"],"negative_prompt":["low quality","blurry","flat lighting","distorted face","bad anatomy","extra limbs","oversharpening","text","watermark","logo","daylight"]}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'YouTube Thumbnail - Ultra-Realistic Portrait of Female Bass Guitarist Performing Live',
                    'A detailed prompt for generating an ultra-realistic, vertical portrait of a young female musician playing a bass guitar live on an outdoor stage. It specifies the subject''s appearance, attire (acid-wash crop top, wide-leg jeans), instrument details, and technical parameters for high-fidelity, cinematic photography.',
                    '{
  "image_generation_prompt": {
    "subject": {
      "main": "young female musician bass guitarist performing live on an outdoor stage",
      "appearance": "long dark wavy layered hair blowing slightly in wind, fair skin, intense focused facial expression, natural makeup, silver hoop earrings",
      "pose": "standing confidently holding a bass guitar, fingers plucking strings, looking slightly off-camera to the left"
    },
    "attire": {
      "top": "sleeveless dark grey acid-wash graphic crop top with vintage band aesthetic",
      "bottoms": "loose fit wide-leg blue denim carpenter jeans with large pockets",
      "accessories": "black leather belt with double row silver grommets, wide black guitar strap"
    },
    "instrument": {
      "type": "modern electric bass guitar",
      "details": "deep blue burst finish with visible wood grain texture (quilted maple top), black hardware, long guitar neck, intricate fretboard details"
    },
    "environment": {
      "setting": "daytime outdoor concert stage, open air festival vibe",
      "background_elements": "blurred stage truss structures, black bass amplifier stack with metal grille, microphone stand on the left, overcast bright sky"
    },
    "technical_style": {
      "quality": "ultra realistic, 8k uhd, hdr, masterwork, sharp focus, high fidelity textures",
      "lighting": "natural diffuse daylight, soft shadows, cinematic lighting",
      "camera": "telephoto lens, depth of field, bokeh background, portrait photography"
    }
  },
  "parameters": {
    "aspect_ratio": "9:16",
    "orientation": "vertical long",
    "resolution": "highest possible"
  }
}',
                    'Portrait',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769581944393_q7esyz_G_pycIlXsAAMWR4.jpg'],
                    '{"image_generation_prompt":{"subject":{"main":"young female musician bass guitarist performing live on an outdoor stage","appearance":"long dark wavy layered hair blowing slightly in wind, fair skin, intense focused facial expression, natural makeup, silver hoop earrings","pose":"standing confidently holding a bass guitar, fingers plucking strings, looking slightly off-camera to the left"},"attire":{"top":"sleeveless dark grey acid-wash graphic crop top with vintage band aesthetic","bottoms":"loose fit wide-leg blue denim carpenter jeans with large pockets","accessories":"black leather belt with double row silver grommets, wide black guitar strap"},"instrument":{"type":"modern electric bass guitar","details":"deep blue burst finish with visible wood grain texture (quilted maple top), black hardware, long guitar neck, intricate fretboard details"},"environment":{"setting":"daytime outdoor concert stage, open air festival vibe","background_elements":"blurred stage truss structures, black bass amplifier stack with metal grille, microphone stand on the left, overcast bright sky"},"technical_style":{"quality":"ultra realistic, 8k uhd, hdr, masterwork, sharp focus, high fidelity textures","lighting":"natural diffuse daylight, soft shadows, cinematic lighting","camera":"telephoto lens, depth of field, bokeh background, portrait photography"}},"parameters":{"aspect_ratio":"9:16","orientation":"vertical long","resolution":"highest possible"}}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'YouTube Thumbnail - High-Quality Photo of Man Flying Above Clouds',
                    'A prompt for generating a realistic, high-quality, wide-angle photo of a young man flying horizontally above a sea of white clouds, emphasizing a sense of freedom and joy through cinematic lighting and clear blue sky.',
                    'A realistic, high-quality photo of a happy young man flying horizontally in the sky above a sea of fluffy white clouds. He has his arms outstretched like wings and legs slightly bent. He is wearing a sage green hoodie, beige cargo pants, black sneakers, a black baseball cap, and sunglasses. The sky is clear blue with bright sunlight, creating a sense of freedom and joy. Cinematic lighting, 8k resolution, wide-angle shot.',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769581934001_pf3n4t_G_onnzibAAAGfsY.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'YouTube Thumbnail - Four-Panel Comic Prompt: Gargle (English Version)',
                    'This is a prompt used to generate a four-panel comic strip using Nano Banana Pro, centered around the theme of ''Gargle'' (English version).',
                    'Today''s theme is Let''s Gargle (English Version)',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769408683821_4imddt_G9ypjgTb0AA18qM.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'YouTube Thumbnail - Grok Instruction for Generating Nano Banana Pro Image Prompts',
                    'This is an instruction given to the Grok LLM to generate a set of five keyframe image prompts suitable for Nano Banana Pro, based on an existing video generation prompt (which is referenced but not included here). This is a meta-prompt for prompt engineering.',
                    'Please learn the best practices for nano banana pro prompts. I want to create keyframe still images when executing the following video generation prompt. Please think of and display 5 cuts worth of prompts.
(Paste video generation prompt here. See reply 3)',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769408676181_lxy1wb_G_eJkUTWUAAG6Zw.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'YouTube Thumbnail - Magazine Cover Prompt using Nano Banana Extension',
                    'A user demonstrates using a Chrome extension for Nano Banana to easily access various prompts, including a ''magazine cover'' prompt, which they used to create a ''Weekly Magazine'' style image, suggesting its utility for social media design.',
                    'I tried creating a "Weekly Magazine" style using the magazine cover prompt',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769236039813_e8v3j0_G_T9M_TagAA54Xy.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'YouTube Thumbnail - Eyecatch Image Generation from Video Transcript',
                    'A user generated an eyecatch image using Nano Banana based on a video transcript, noting that image generation AI might replace manual creation in Canva.',
                    'Use the transcript of this video as a prompt to have Nano Banana create an eyecatch image',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769063246826_sqqf2n_G_J9h8uWcAALe9H.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'YouTube Thumbnail - Mahira Khan 2x2 Collage Podcast Interview Prompt',
                    'A simple JSON prompt to create a 2x2 collage of Mahira Khan based on a podcast interview reference image. The prompt specifies candid shots, a sleeveless outfit, and captures the subject speaking with her mouth open in an ''O'' expression, using iPhone 13 Pro Max camera settings.',
                    '{ task: 2x2 collage with multiple angles of her in this podcast interview, but her outfit is sleeveless, candid shots, not looking at the camera, speaking and mouth open in an “O” expression resolution: 1080p aspect_ratio: 4:5 Sharpness: medium camera: iPhone 13 pro max 12MP CMOS camera }',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1768977292509_rnmcyr_G_IAgrUXAAEVzPd.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'YouTube Thumbnail - Creative Composite for ''Follow'' Button Promo',
                    'A complex JSON prompt designed for a creative composite edit, superimposing a character (from a reference image) onto a background image (a screenshot of a profile page). The character is posed lying down and actively pointing their finger towards the upper right corner, mimicking pressing a ''Follow'' or ''Subscribe'' button for social media promotion.',
                    '{
  "edit_type": "creative_composite_layering",

  "source": {
    "_hint": "Base logic: Character (Ref 1) superimposed ON TOP OF the Background Image (Ref 2).",
    "mode": "EDIT",
    "reference_images": {
      "first": "foreground_character_person",
      "second": "background_scenery_or_pattern"
    },
    "preserve_from_first": {
      "same_person_or_group": true,
      "same_faces": true,
      "same_hairstyles": true,
      "same_outfits": true
    }
  },

  "identity": {
    "keep_identity_consistent": true,
    "expression": "bright_engaging_smile_at_camera"
  },

  "camera_effect": {
    "_hint": "High-angle selfie style, creating a sense of depth between the hand and face.",
    "perspective": "high_angle_shot_looking_down",
    "style": "social_media_call_to_action",
    "depth_of_field": "focus_on_face_and_pointing_finger",
    "framing": "character_centered_with_space_at_top_right"
  },

  "pose": {
    "_hint": "Key action: Lying down but actively pointing to the ''Follow'' button area (Top Right).",
    "pose_style": "lying_down_or_reclining_on_back",
    "face_direction": "looking_directly_up_into_lens",
    "hand_gestures": {
      "right_hand_action": "pointing_index_finger",
      "target_direction": "upper_right_corner_45_degrees",
      "purpose": "mimicking_pressing_subscribe_button",
      "arm_position": "extended_towards_camera_top_right"
    },
    "body_language": "inviting_and_energetic",
    "style_tags": [
      "kpop_idol_fan_service",
      "influencer_promo_style",
      "dynamic_perspective"
    ]
  },

  "background_integration": {
    "_hint": "The second reference image is the background/floor.",
    "method": "full_background_replacement",
    "target_area": "entire_canvas_behind_character",
    "content_source": "reference_image_second",
    "perspective_match": "flat_lay_style",
    "rules": {
      "character_must_be_top_layer": true,
      "leave_space_in_upper_right_for_ui": true
    }
  },

  "composition": {
    "_hint": "Ensure the pointing finger leads the viewer''s eye to the top right corner.",
    "visual_flow": "diagonal_line_from_face_to_top_right_corner",
    "focal_points": [
      "character_eyes",
      "pointing_finger_tip"
    ],
    "negative_space": "clear_area_at_top_right_45_degrees"
  },

  "constraints": {
    "no_holding_phone_device": true,',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1768977261492_193wj8_G_HfcB-XQAEKxgx.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'YouTube Thumbnail - Multi-Concept AI Evolution Prompt',
                    'A complex, multi-part JSON prompt designed to generate three distinct images: a mythic ''ImagineArt Goddess'' in cosmic armor, a futuristic ''ChatGPT Orb Library,'' and ''Dual Cyborg Knowledge Entities'' in space, showcasing different AI art concepts.',
                    '[
  {
    "title": "ImagineArt Goddess",
    "subject": "Divine celestial female figure",
    "appearance": {
      "gender": "female",
      "skin": "pale",
      "hair": "long black, flowing",
      "face": "calm expression, eyes closed",
      "body": "slender, elegant posture"
    },
    "clothing": {
      "style": "ornate royal robes",
      "color": ["black", "gold"],
      "details": "elaborate gold armor-like patterns on chest, shoulders, and waist"
    },
    "accessories": {
      "headpiece": "large golden ornate crown with rays",
      "bracelets": "gold arm cuffs",
      "hand_effects": "glowing cosmic energy, colorful light streaks"
    },
    "environment": {
      "type": "cosmic galaxy backdrop",
      "elements": [
        "nebula clouds",
        "stars",
        "colorful cosmic dust",
        "electric lightning-like streaks"
      ],
      "color_palette": ["purple", "blue", "pink", "green", "gold"]
    },
    "foreground": {
      "text": "{argument name="text overlay 1" default="ImagineArt"}",
      "style": "ornate golden script typography",
      "subtitle": "ImagineArt — Dreamline Generative Muse"
    },
    "mood": "mythic, divine, majestic, surreal",
    "lighting": "dramatic glowing lighting",
    "camera": {
      "framing": "full body, centered",
      "angle": "straight on"
    }
  },
  {
    "title": "ChatGPT Orb Library",
    "subject": "Glowing AI orb in futuristic library",
    "objects": {
      "main": "large floating white orb",
      "floating_docs": "papers and data sheets with code and text"
    },
    "text": {
      "main_label": "{argument name="text overlay 2" default="ChatGPT"}",
      "style": "bright neon teal glow"
    },
    "environment": {
      "location": "circular modern library",
      "surroundings": "bookshelves, open books, papers suspended in mid-air"
    },
    "color_palette": ["white", "light teal", "mint", "gray"],
    "lighting": "soft ambient, glowing highlights",
    "mood": "clean, futuristic, intelligent, serene",
    "camera": {
      "framing": "medium-wide",
      "angle": "slightly low angle"
    },
    "style": "futuristic, minimal, high-tech"
  },
  {
    "title": "Dual Cyborg Knowledge Entities",
    "subjects": [
      {
        "type": "futuristic cyborg",
        "color_scheme": "blue",
        "pose": "standing back to back"
      },
      {
        "type": "futuristic cyborg",
        "color_scheme": "gold",
        "pose": "standing back to back"
      }
    ],
    "appearance": {
      "build": "humanoid, detailed cybernetic body structure",
      "material": "metallic with glowing circuits"
    },
    "environment": {
      "background": "outer space with stars and warm clouds",
      "floating_elements": "holographic data cards with symbols and equations"
    }',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1768977324076_oollg1_G_FcDtDWUAAD7eW.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'YouTube Thumbnail - Social Media Call-to-Action Composite with Pointing Character',
                    'A Nano Banana Pro prompt designed for creating a composite image where a character, strictly based on a reference image, is superimposed onto a background (like a profile page screenshot) and is actively pointing to the ''Follow'' button area (upper right corner). This is used for promotional content and influencer-style fan service, utilizing a high-angle selfie perspective.',
                    '{
  "edit_type": "creative_composite_layering",

  "source": {
    "_hint": "Base logic: Character (Ref 1) superimposed ON TOP OF the Background Image (Ref 2).",
    "mode": "EDIT",
    "reference_images": {
      "first": "foreground_character_person",
      "second": "background_scenery_or_pattern"
    },
    "preserve_from_first": {
      "same_person_or_group": true,
      "same_faces": true,
      "same_hairstyles": true,
      "same_outfits": true
    }
  },

  "identity": {
    "keep_identity_consistent": true,
    "expression": "bright_engaging_smile_at_camera"
  },

  "camera_effect": {
    "_hint": "High-angle selfie style, creating a sense of depth between the hand and face.",
    "perspective": "high_angle_shot_looking_down",
    "style": "social_media_call_to_action",
    "depth_of_field": "focus_on_face_and_pointing_finger",
    "framing": "character_centered_with_space_at_top_right"
  },

  "pose": {
    "_hint": "Key action: Lying down but actively pointing to the ''Follow'' button area (Top Right).",
    "pose_style": "lying_down_or_reclining_on_back",
    "face_direction": "looking_directly_up_into_lens",
    "hand_gestures": {
      "right_hand_action": "pointing_index_finger",
      "target_direction": "upper_right_corner_45_degrees",
      "purpose": "mimicking_pressing_subscribe_button",
      "arm_position": "extended_towards_camera_top_right"
    },
    "body_language": "inviting_and_energetic",
    "style_tags": [
      "kpop_idol_fan_service",
      "influencer_promo_style",
      "dynamic_perspective"
    ]
  },

  "background_integration": {
    "_hint": "The second reference image is the background/floor.",
    "method": "full_background_replacement",
    "target_area": "entire_canvas_behind_character",
    "content_source": "reference_image_second",
    "perspective_match": "flat_lay_style",
    "rules": {
      "character_must_be_top_layer": true,
      "leave_space_in_upper_right_for_ui": true
    }
  },

  "composition": {
    "_hi"',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1768977358147_ec6zxg_G_Fa-sGXwAASQrG.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'YouTube Thumbnail - Master Prompt for NBA Finals Arena Promos',
                    'A user-developed ''Master Prompt'' for the Nano Banana PRO model, designed to create elite-tier, highly realistic NBA arena promotional images that capture the electric pre-game energy of any franchise, going beyond simple logo placement.',
                    'Master Prompt" using the Nano Banana PRO model that creates elite-tier arena promos. 
It doesn''t just put a logo on a court; it captures the electric pre-game energy of any franchise.',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1768890704156_eyf5yo_G_DE2BwWEAA_8rY.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'YouTube Thumbnail - Talk-Show Style Celebrity Interview Photo',
                    'A detailed prompt for generating an ultra-realistic, cinematic talk-show style photo featuring a host and a specified celebrity. It focuses on precise composition, lighting, and facial accuracy to achieve a premium ''Netflix documentary interview'' aesthetic.',
                    'Create an ultra-realistic cinematic shot of both individuals seated in a modern studio lounge setup, angled slightly toward each other.
The host (use the attached face reference) is interviewing {argument name="celebrity name" default="[Celebrity Name]"} in a warm, soft-glow studio lit with overhead spotlights.
Place them on a cozy couch setup with a low coffee table between them—no podcast mics in frame, just natural conversation energy.
Maintain 100% facial accuracy, lifelike skin texture, and crisp depth of field. Use 8K resolution, 9:16 format, and give it a premium “Netflix documentary interview” aesthetic with shallow focus and rich shadows.',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1768890653078_okgxxr_G_BMfbnaAAAIvS3.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'YouTube Thumbnail - Ana de Armas Red Carpet Portrait Prompts (Yellow and Red Dress)',
                    'Two highly detailed JSON prompts for generating ultra-realistic, 8K resolution portraits of Ana de Armas on a red carpet. The prompts specify celebrity identity, pose, intricate couture outfit details (yellow or red minidress with black geometric patterns), cinematic lighting (soft professional flash), and technical camera settings (85mm lens, f/1.8 aperture, bokeh background), along with a comprehensive negative prompt list.',
                    '{
  "image_prompt": {
    "subject": {
      "name": "{argument name="celebrity name" default="Ana de Armas"}",
      "description": "young woman with shoulder-length layered blonde ponytail hair, soft waves, blue eyes, soft natural makeup with nude pink lipstick, glowing skin complexion, pearl necklace",
      "pose": "looking directly at camera, slight smile, confident red carpet stance, head and shoulders portrait",
    },
    "outfit": {
      "item": "{argument name="outfit color" default="Yellow"} dress",
      "details": "black beaded geometric web pattern over nude sheer illusion fabric, sweetheart neckline, intricate black sequin embroidery, sleeveless, structured fit",
      "style": "glamorous, high fashion, couture"
    },
    "environment": {
      "setting": "movie premiere red carpet event",
      "background": "dark blurred media wall with unrecognizable white and red logos, professional event backdrop",
      "atmosphere": "exclusive, cinematic, celebrity sighting"
    },
    "technical_specs": {
      "lighting": "soft professional flash photography, rim lighting on hair, even facial illumination, no harsh shadows",
      "camera": "85mm lens, f/1.8 aperture, sharp focus on eyes, bokeh background",
      "quality": "8k resolution, ultra-realistic, highly detailed texture, raw photo, photorealism, masterpiece",
      "aspect_ratio": "9:16"
    }
  },
  "negative_prompt": "cartoon, illustration, painting, drawing, bad anatomy, blurry, low quality, distorted eyes, text, watermark, logo, oversaturated, messy hair, wrong face",
  "parameters": {
    "size": "highest_resolution",
    "orientation": "vertical",
    "style_preset": "photographic" Ratio 3.4
  }

{
  "image_prompt": {
    "subject": {
      "name": "Ana de Armas",
      "description": "young woman with shoulder-length layered long black, soft waves, blue eyes, soft natural makeup with nude pink lipstick, glowing skin complexion, pearl necklace",
      "pose": "looking directly at camera, slight smile, confident red carpet stance, full body",
    },
    "outfit": {
      "item": "Red minidress",
      "details": "black beaded geometric web pattern over nude sheer illusion fabric, sweetheart neckline, intricate black sequin embroidery, sleeveless, structured fit, red high heels sandals",
      "style": "glamorous, high fashion, couture"
    },
    "environment": {
      "setting": "movie premiere red carpet event",
      "background": "cremisi blurred media wall with unrecognizable white and red logos, professional event backdrop",
      "atmosphere": "exclusive, cinematic, celebrity sighting"
    },
    "technical_specs": {
      "lighting": "soft professional flash photography, rim lighting on hair, even facial illumination, no harsh shadows",
      "camera": "85mm lens, f/1.8 aperture, sharp focus on eyes, bokeh background",
      "quality": "8k resolution, ultra-realistic, highly detailed texture, raw photo, photorealism, masterpiece",
      "aspect_ratio": "9:16"',
                    'Portrait',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1768890686290_u0dby9_G_AiGT1W4AAzigm.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'YouTube Thumbnail - Dan-Style Cover Image Prompt',
                    'A prompt designed to create cover images in the style of ''Dan'' (likely a popular creator or style), shared for use with Youmind, which integrates Nano Banana Pro, allowing users to create visually striking cover art.',
                    'A highly detailed, professional, and visually striking cover image for a blog post about {argument name="topic" default="AI tools"}. The image should feature a clean, modern design with bold typography and a minimalist color palette, emphasizing {argument name="visual focus" default="technology and innovation"}. Use dramatic, high-contrast lighting and a shallow depth of field to draw attention to the central subject. The style should be photorealistic and cinematic, similar to high-end tech editorial photography. Aspect ratio 16:9.',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1768890713390_rvgiu0_G-_iXbSWAAAcLCn.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'YouTube Thumbnail - Image Conversion to Berserker Style',
                    'A prompt used with Nano Banana Pro to convert an existing image into a ''Berserker'' style. The prompt describes a fierce warrior, a red flash speeding across the battlefield, wielding an axe that cuts through everything. This is an image-to-image conversion prompt.',
                    'A red flash speeding across the battlefield! ⚡️
That axe cuts through everything...!',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1768804341042_w63wva_G-8o9ttWgAA6Cew.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'YouTube Thumbnail - Image Conversion to Berry Tart Dress Style',
                    'A prompt used with Nano Banana Pro to convert an existing image into a ''Berry Tart'' style. The prompt describes a gorgeous dress covered in lots of strawberries, suggesting a sweet and sour love flavor. This is an image-to-image conversion prompt.',
                    'The taste of sweet and sour love? 💕
The dress full of strawberries is gorgeous! ✨',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1768804341543_p6juo0_G-7yCF0WIAA8J9z.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Comic / Storyboard - Cyberpunk Tech Visual Storyboard for Mac Mini Branding',
                    'This is a prompt for generating a 3x3 visual storyboard for Mac mini branding, specifically requesting a cyberpunk technology style.',
                    'Mac mini 3×3 brand design visual storyboard - {argument name="style" default="Cyberpunk Technology Style"}',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769582033366_219y4x_G_rKxgrbAAYENhQ.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Comic / Storyboard - Nano Banana Comic Prompt: Elf and Human Love Comedy',
                    'A detailed multi-panel prompt for generating a four-panel vertical manga (yonkoma) using Nano Banana, focusing on a modern fantasy/romantic comedy scenario. The prompt specifies the genre, format, art style (bright, expressive, no grayscale), setting (modern Japanese city), and clothing. It includes specific scene descriptions for each of the four panels, detailing character placement, actions, expressions, and the exact dialogue for a humorous interaction between an elf woman and a human man concerning a discontinued mobile game.',
                    'Genre: Modern Fantasy / Romantic Comedy
Format: Vertical 4-panel manga
Style: Bright romantic comedy tone, expressive faces, no grayscale tone expression
Setting: Modern Japanese city streets
Clothing: Modern style (Elf: stylish casual clothes + ears, Man: casual clothes)

Panel 1
Modern city streets.
An elf woman with long ears is standing with her arms crossed, looking cool and exasperated. Positioned on the right side of the screen.
In front of her, a human man is kneeling and offering a bouquet of flowers. Positioned on the left side of the screen.
The man is desperate, and the woman is clearly rejecting him.

Dialogue:
Elf Woman
“Give up already, mortal. I will never accept human love.”

Panel 2
The human man, still holding the bouquet, leans forward desperately. Positioned on the left side of the screen.
The background shows speed lines indicating intensity.
The elf is slightly backing away. Positioned on the right side of the screen.

Dialogue:
Human Man
“In this day and age, interspecies marriage is common! Differences in lifespan or species don''t matter when it comes to love!”

Panel 3
The elf woman shows a dark, somber expression, making a gesture as if showing a smartphone. Positioned on the right side of the screen.
The man looks serious, sensing something. Positioned on the left side of the screen.

Dialogue:
Elf
“Hmph, look at this, and tell me if you can still say the same?”

Human Man
(Could it be that Ms. Elf has a sad past!?)

Panel 4
The elf woman shows the smartphone to the human man. Tears are welling up in her eyes. Positioned on the right side of the screen.
The man looks dissatisfied after seeing it. Profile view, positioned on the left side of the screen.

Dialogue:
Elf Woman
“Even you wouldn''t want to get involved in a social game that looks like it will end service in a short time, would you?”

Background shows the smartphone screen. The screen displays: “Mortal Love Online ~Lifespan Difference Doesn''t Matter☆~ Service has ended.” Styled like an official otome game website.

Human Man
“Ah, I understand the feeling, but I don''t want to accept this reason~”',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769582030596_lh866x_G_p1owSWoAA1qGZ.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Comic / Storyboard - 16:9 Cinematic Storyboard from References',
                    'A Chinese prompt for generating a 16:9 cinematic storyboard (four continuous panels) in a realistic documentary style. It uses two reference images: one for composition, relationship, and style, and another for the character''s appearance, detailing specific camera angles and scene elements for each panel, such as a snowy outdoor view and a narrow room perspective.',
                    'Horizontal 16:9 cinematic continuous storyboard, realistic documentary style. Reference Image 1 for character spatial relationship, position, and style; Reference Image 2 for character appearance. This prompt includes four specific frame instructions:

Panel 1 (Side Profile Close-up): Focus on the facial features (platinum blonde hair, green eyes) of the character from Image 2 reading in bed, referencing Image 1. Apply background blur and retain the cool-toned lighting from Image 1.

Panel 2 (Reading Back View): Recreate the action of “lying on the bed reading” from Image 1, but use the clothing of the character from Image 2, emphasizing the {argument name="weather" default="snowy scene"} outside the window.

Panel 3 (Medium Shot Low Angle): Reference Image 1 for the action position. This is a highly dramatic perspective, reflecting the narrowness of the room and the spatial relationship of the character, highlighting details of the bookshelf and poster wall.

Panel 4 (Full View/Fisheye): Add a wide-angle shot (referencing the perspective of Image 1) to establish the overall environment and set the mood of “staying home on a snowy day.”',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769408670971_1d6zp9_G_gwXDgXoAAdvUC.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Comic / Storyboard - DVD Screengrab of Ominous Korean Horror Movie',
                    'A short, specific prompt requesting an image in the style of a DVD screengrab from a 2001 Korean horror movie. The scene is an ominous, very dark domestic dinner involving a giant man, with the explicit instruction that the proportions should be ''all wrong'' and no text overlays should be visible.',
                    'dvd screengrab of a Korean horror movie from 2001. The proportions are all wrong.

Ominous domestic dinner scene involving a giant man. Very dark.

No text, no DVD overlay',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769322313405_9df6ej_G_cTOdnXAAEEVnQ.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Comic / Storyboard - E-Konte (Japanese Storyboard) Generation',
                    'This tweet describes the capability of Nano Banana Pro to create an e-konte (Japanese style storyboard) based on a given scene description, indicating a feature for visual narrative planning.',
                    'Create an e-konte (Japanese style storyboard) based on a given scene.',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769322358904_ioyilu_G_Z1BOcXUAA4H1s.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Comic / Storyboard - Nano Banana Pro Scene Shot Prompts',
                    'A list of four specific camera angles or shot types used as prompts for generating scene images with Nano Banana Pro, including extreme close-up, low-angle, ground level, and back-to-the-camera views.',
                    '1. Extreme close-up
2. Low-angle
3. Ground level view
4. Back-to-the-camera',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769236042895_azikpa_G_W2i5SXkAAtiug.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Comic / Storyboard - Transformer Robot to Tank Transition Prompt',
                    'A prompt for generating a 6-step transitional process image, showing a Transformer robot transforming into a tank. It specifies a 3x2 layout and requires maintaining the same style without outlines.',
                    'Show the transitional process of this Transformer robot transforming into a tank in 6 (3 x 2) step-by-step process. Use same style without outlines',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769236008713_nnsqsw_G_WLHZhXAAA_Bdr.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Comic / Storyboard - Wizardry x Genba Neko Collaboration Image',
                    'A user generated a ''Wizardry x Genba Neko'' (site cat) collaboration image using Nano Banana, specifically requesting a ''cat-human character.'' The resulting image shows the character giving an ''OK'' sign, which required five fingers and paw pads, highlighting a specific AI output characteristic.',
                    'Respecting the collaboration between Wizardry and Genba Neko (site cat), I urgently replaced the planned post content!

Because I specified a "cat-human character," the third panel shows five fingers + paw pads, which is typical of AI output, but since a cat''s paw can''t make an OK sign, this is fine!',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769236037149_gv12ts_G_WHtmfWgAAK70H.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Comic / Storyboard - Prompt for Visual Storyboard Creation',
                    'A call to action for users to receive a prompt designed to create a brand visual storyboard for product presentation using Nano Banana Pro, often shared upon request.',
                    'Create a brand visual storyboard for presenting your product with Nano Banana Pro:',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769236041775_9t1xug_G_Vo48obAAEqLl7.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Comic / Storyboard - 2000s OVA Style High School Girl Monster Hunt',
                    'A detailed, multi-part prompt designed for Nano Banana Pro to generate a four-panel sequence in the style of a 2000s Japanese Anime OVA. The scene depicts two high school girls confronting amorphous, liquid-based monsters in a deserted city at night, focusing on tension and composition.',
                    'Output image is 2x2 four-panel split
Video Style: {argument name="video style" default="2000s Japanese Anime OVA style"}
Background:
Late-night city streets. Gaps between deserted roads and skyscrapers. Black liquid splattered from a giant monster adheres to the asphalt and walls. Dust and sparks are flying.

Character 1:
High school girl with long black hair. Wearing a sailor uniform. A Japanese sword is sheathed and hanging at her waist. She looks around cautiously, adopting a low stance.
Character 2:
High school girl with blonde bob hair. Wearing a blazer uniform. Standing behind her companion, holding one hand ready to use her ability at any moment. Her expression is tense.
Enemy Presence:
Black liquid gathers and transforms into a humanoid entity with a fibrous, thread-like texture. Its face is vague, its limbs are unnaturally long, and it crawls across the ground and walls with unnatural movements.

Cut 1:
Close-up of the ground. Filled with black liquid. Flying dust and sparks
Cut 2:
Medium shot. The humanoid anomaly, rising from the black liquid, awkwardly begins to stand up. Thread-like shadows droop, dragging on the ground.
Cut 3:
Low-angle wide shot. Multiple anomalies appear one after another from the roads and walls, encircling the girls in a circle. The cityscape emphasizes the feeling of being surrounded.
Cut 4:
Shot over the girls'' backs. In front of them is a horde of black humanoids closing in. The black-haired girl rests her hand on the sheath, and the blonde-haired girl prepares to activate her ability.
The composition emphasizes the tension right before the battle.',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769149373225_3kz1o1_G_QvmxsagAAPUrS.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Comic / Storyboard - 9-Panel Product Storyboard Mockup Prompt',
                    'A highly structured prompt designed to generate a 3x3 storyboard grid for a high-end product branding portfolio. It mandates using a reference image for product consistency across all nine panels and specifies unique composition, focus, and setting for each frame, emphasizing form, composition, and visual rhythm over realism.',
                    'A clean 3×3 [ratio] storyboard grid with nine equal [ratio] sized panels on [4:5] ratio. 

Use the reference image as the base product reference. Keep the same product, packaging design, branding, materials, colors, proportions and overall identity across all nine panels exactly as the reference. The product must remain clearly recognizable in every frame. The label, logo and proportions must stay exactly the same.

This storyboard is a high-end designer mockup presentation for a branding portfolio. The focus is on form, composition, materiality and visual rhythm rather than realism or lifestyle narrative. The overall look should feel curated, editorial and design-driven.

FRAME 1:
Front-facing hero shot of the product in a clean studio setup. Neutral background, balanced composition, calm and confident presentation of the product.

FRAME 2:
Close-up shot with the focus centered on the middle of the product. Focusing on surface texture, materials and print details.

FRAME 3:
Shows the reference product placed in an environment that naturally fits the brand and product category. Studio setting inspired by the product design elements and colours. 

FRAME 4:
Product shown in use or interaction on a neutral studio background. Hands and interaction elements are minimal and restrained, the look matches the style of the package. 

FRAME 5:
Isometric composition showing multiple products arranged in a precise geometric order from the top isometric angle. All products are placed at the same isometric top angle, evenly spaced, clean, structured and graphic.

FRAME 6:
Product levitating slightly tilted on a neutral background that matches the reference image color palette. Floating position is angled and intentional, the product is floating naturally in space.

FRAME 7:
is an extreme close-up focusing on a specific detail of the label, edge, texture or material behavior.

FRAME 8:
The product in an unexpected yet aesthetically strong setting that feels bold, editorial and visually striking.
Unexpected but highly stylized setting. Studio-based, and designer-driven. Bold composition that elevates the brand.

FRAME 9:
Wide composition showing the product in use, placed within a refined designer setup. Clean props, controlled styling, cohesive with the rest of the series.

CAMERA & STYLE:
Ultra high-quality studio imagery with a real camera look. Different camera angles and framings across frames. Controlled depth of field, precise lighting, accurate materials and reflections. Lighting logic, color palette, mood and visual language must remain consistent across all nine panels as one cohesive series.

OUTPUT:
A clean 3×3 grid with no borders, no text, no captions and no watermarks.',
                    'Product',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769149364094_5vjm3w_G_Qh_LCbwAAIvTE.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Comic / Storyboard - Detailed Storyboard Prompt for Brand Visuals',
                    'A highly detailed, multi-frame prompt designed for Nano Banana Pro to generate a clean, professional 3x3 storyboard grid for a branding portfolio. It emphasizes consistency in product identity, color, and ratio across all nine frames, focusing on composition, material, and visual rhythm rather than narrative.',
                    'Place 9 panels of [ratio] size in a [4:5] ratio on a clean 3x3 [ratio] storyboard grid.

Use the reference image as the base image for the product. The product, packaging design, branding, materials, colors, ratio, and overall identity must be exactly the same as the reference image. The product must be clearly recognizable in all frames. Labels, logos, and ratios must be exactly the same.

This storyboard is a high-end designer mock-up presentation for a branding portfolio. It focuses on shape, composition, material, and visual rhythm, not realism or lifestyle narratives. The overall look should convey a curated, edited, and design-driven impression.

Frame 1:
A hero shot of the product taken from the front in a clean studio setup. Neutral background, balanced composition, calm and confident product presentation.

Frame 2:
A close-up shot focused on the center of the product. Focus on surface texture, material, and printing details.

Frame 3:
The reference product placed in an environment that naturally blends into the brand and product category. Studio setting inspired by the product''s design elements and colors.

Frame 4:
A scene showing the product being used or interacted with against a neutral studio background. Hands and interaction elements are minimized, with an appearance that matches the packaging style.

Frame 5:
An isometric composition with multiple products viewed from the top, arranged in precise geometric order. All products are viewed from the same top isometric perspective, evenly spaced, clean, and graphic.

Frame 6:
The product is slightly tilted and floating against a neutral background that matches the reference image''s color palette. The product floats naturally in space due to the intentionally angled floating.

Frame 7:
An extremely close-up shot focusing on specific details such as labels, edges, textures, or material behavior.

Frame 8:
The product is in an unexpected yet aesthetically powerful setting, giving a bold, editorial, and visually striking impression.

Unexpected yet highly stylized setting. Studio-based, designer-led production. Bold composition that enhances the brand image.

Frame 9:
A wide composition showing the product in use within a sophisticated designer setting. Minimal props, controlled styling, and consistency with the rest of the series.

Camera and Style:
Ultra-high quality studio photography with a realistic camera look. Different camera angles and framing for each frame. Depth of field, accurate lighting, precise materials and reflections. The lighting logic, color palette, mood, and visual language must be consistent across all nine panels, unifying them as a single series.

Output:
A clean 3x3 grid without borders, text, captions, or watermarks.',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769149374673_qpygep_G_QW86Za4AANkA3.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Product Marketing - Alexander McQueen Sneaker Editorial Grid Prompt for Nano Banana Pro',
                    'A highly detailed, professional-grade prompt for the Gemini Nano Banana Pro tool, designed to create a 3x3 editorial contact sheet grid centered on Alexander McQueen men''s luxury sneakers. The prompt specifies nine unique visual concepts, strict product consistency, lighting, style (Vogue/GQ aesthetic), and technical parameters (8K resolution, high dynamic range).',
                    'Create a 3x3 grid for a high-end commercial marketing campaign, centered on {argument name="subject" default="Alexander McQueen men''s luxury sneakers"}.

Each frame should present a unique visual concept while maintaining perfect product consistency across all nine images.

Grid Concepts (one per frame):

1. ''Iconic Hero Shot'': Eye-level side view on a dark, glossy pedestal, emphasizing the signature oversized sole.

2. ''Extreme Macro Detail'': Close-up of the heel or stitching, highlighting the texture of the top-grade leather and the ''Alexander McQueen'' logo embossing.

3. ''Dynamic Interaction'': The shoe stepping onto a surface generating a subtle, elegant splash of black liquid or marble dust.

4. ''Minimalist Sculpture'': The shoe artistically balanced on a geometric concrete or marble block, emphasizing architectural design.

5. ''Suspended Lightness'': The shoe floating in the air, with laces dynamically suspended, conveying premium comfort and lightness.

6. ''Sensory Texture'': A tactile, atmospheric shot focusing on the contrast between the velvet or smooth leather upper and a rough stone texture.

7. ''Monochromatic Luxury'': A color-block scene where the background perfectly matches the accent color of the shoe, creating a bold editorial feel.

8. ''Deconstructed Craftsmanship'': Abstract arrangement of raw materials (leather samples, rubber textures) surrounding the shoe, symbolizing high-quality construction.

9. ''Surreal Fusion'': The shoe integrated into a surreal, dreamy landscape, blending realism with high fashion.

Visual Rules:
* ''Subject'': Alexander McQueen men''s oversized sneakers.
* ''Consistency'': The shoe''s shape, proportion, sole thickness, logo placement, and typography must be 100% accurate.
* ''No Distortion'': No deformation of the signature sole or branding.
* ''Separation'': Clear separation between the shoe and the background.

Lighting and Style:
* Soft, controlled studio lighting with dramatic rim lighting to highlight the shoe''s silhouette.
* Subtle highlights on the leather, deep realistic shadows beneath the shoe.
* High dynamic range, 8K resolution, ultra-sharp focus.
* Editorial luxury fashion advertising aesthetic (Vogue/GQ style).
* Color Palette: Minimalist, monochromatic, metallic, and deep matte tones.

Overall Atmosphere:
* Modern, sophisticated, visually coherent.
* High-end commercial campaign for a luxury fashion brand.
* Surreal, cinematic, refined, and aspirational.',
                    'Product',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769582015231_gd3cvg_G_uOL8mbAAEHFtE.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Product Marketing - Conceptual Visual Storytelling Asset Prompt',
                    'A prompt for generating a conceptual and minimal visual asset intended for storytelling. It focuses on abstract elements, layered depth, soft directional lighting, and a muted cinematic color palette to evoke emotion, similar to a brand film still.',
                    'Conceptual storytelling visual.
Abstract elements arranged to suggest movement forward,
layered depth with foreground, midground, background,
soft directional lighting creating visual flow,
muted cinematic color palette,
emotionally evocative but minimal,
like a brand film still.',
                    'Product',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769581942818_ikocrk_G_dKkv3WIAAlzCX.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Product Marketing - Technical Outerwear Campaign Poster Generation Prompt',
                    'A smart prompt designed to generate a technical outerwear campaign poster by automatically selecting a relevant performance fashion label for collaboration with a specified brand.',
                    'Technical outerwear campaign poster

This prompt creates a collab between {argument name="your brand" default="[YOUR BRAND]"} and a relevant performance fashion label 

(it automatically picks you a good fit)',
                    'Product',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769581985792_ohysax_G_skcsaWUAALVM3.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Product Marketing - High-Fidelity Fashion Editorial Portrait of Ana de Armas at a Pool',
                    'An extremely detailed, structured prompt for generating a high-end fashion editorial portrait of Ana de Armas. It enforces strict identity lock, demanding preservation of natural biometric details, realistic skin texture (pores, micro-creases), and specific makeup/hair styling (wet look). The composition is a medium close-up at a pool edge with specific lighting and technical parameters for 16k hyper-realism.',
                    '{
  "version_control": {
    "target_style": "High-End Fashion Editorial",
    "fidelity_level": "Absolute 1:1 Identity Lock",
    "rendering_engine_constraints": "No CGI, No Illustration, No AI Smoothing"
  },
  "subject_profile": {
    "identity": {
      "name": "Ana de Armas",
      "age_group": "Adult Woman",
      "biometric_integrity": "Preserve 100% original bone structure, facial asymmetry, moles, and eye shape. Zero morphing or enhancement."
    },
    "anatomy_and_skin": {
      "texture": "Visible pores, micro-creases, subtle translucency",
      "physics": "Natural water droplets, soft wet sheen, realistic surface tension on skin",
      "tone": "Natural base skin tone, sun-kissed warmth, no artificial glow"
    },
    "face_details": {
      "eyes": "Natural eye color, soft neutral-pink glossy shadow, thin lash-line eyeliner (no wing), separated curled lashes",
      "brows": "Natural density, straight-to-softly-rounded architecture",
      "nose_and_lips": "Subtle pink warmth on nose bridge; full lips, rose-pink gradient, wet glossy finish, blurred edges, no overlining"
    },
    "hair_styling": {
      "state": "Visibly wet, slicked at roots, damp strands",
      "arrangement": "Loose, flowing over shoulders and back, natural messy texture",
      "match_reference": "1:1 color and style match"
    }
  },
  "composition_and_pose": {
    "action": "Leaning on swimming pool edge, body angled 45-degrees",
    "arm_placement": "One arm naturally resting on pool coping",
    "framing": "Medium close-up, three-quarter angle",
    "mood": "Intimate, calm, grounded, confident"
  },
  "attire_and_wardrobe": {
    "primary_garment": "Minimalist white swimsuit, thin straps, clean lines",
    "fabric_physics": "Realistic tension against wet skin, natural folds and bunching",
    "jewelry": "Statement earrings, natural stones/gold, realistic micro-scratches and reflections"
  },
  "environment_and_lighting": {
    "background": {
      "element": "Turquoise pool water",
      "physics": "Refraction, light-play on pool floor, subtle ripples, realistic movement"
    },
    "lighting_design": {
      "source": "Single-direction natural sunlight",
      "color_temp": "Warm sun-lit tones",
      "exposure": "Slightly underexposed (lowered exposure)",
      "shadows": "Physically accurate contact shadows on collarbones and chest"
    }
  },
  "technical_parameters": {
    "optics": "50mm–85mm focal length equivalent, realistic photographic perspective",
    "depth_of_field": "Shallow, organic bokeh, natural fall-off",
    "resolution_quality": "16k Hyper-Realistic",
    "aspect_ratio": "3:4"
  }
}',
                    'Portrait',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769581936144_2dbg4l_G_r8vgUXEAAgonS.jpg'],
                    '{"version_control":{"target_style":"High-End Fashion Editorial","fidelity_level":"Absolute 1:1 Identity Lock","rendering_engine_constraints":"No CGI, No Illustration, No AI Smoothing"},"subject_profile":{"identity":{"name":"Ana de Armas","age_group":"Adult Woman","biometric_integrity":"Preserve 100% original bone structure, facial asymmetry, moles, and eye shape. Zero morphing or enhancement."},"anatomy_and_skin":{"texture":"Visible pores, micro-creases, subtle translucency","physics":"Natural water droplets, soft wet sheen, realistic surface tension on skin","tone":"Natural base skin tone, sun-kissed warmth, no artificial glow"},"face_details":{"eyes":"Natural eye color, soft neutral-pink glossy shadow, thin lash-line eyeliner (no wing), separated curled lashes","brows":"Natural density, straight-to-softly-rounded architecture","nose_and_lips":"Subtle pink warmth on nose bridge; full lips, rose-pink gradient, wet glossy finish, blurred edges, no overlining"},"hair_styling":{"state":"Visibly wet, slicked at roots, damp strands","arrangement":"Loose, flowing over shoulders and back, natural messy texture","match_reference":"1:1 color and style match"}},"composition_and_pose":{"action":"Leaning on swimming pool edge, body angled 45-degrees","arm_placement":"One arm naturally resting on pool coping","framing":"Medium close-up, three-quarter angle","mood":"Intimate, calm, grounded, confident"},"attire_and_wardrobe":{"primary_garment":"Minimalist white swimsuit, thin straps, clean lines","fabric_physics":"Realistic tension against wet skin, natural folds and bunching","jewelry":"Statement earrings, natural stones/gold, realistic micro-scratches and reflections"},"environment_and_lighting":{"background":{"element":"Turquoise pool water","physics":"Refraction, light-play on pool floor, subtle ripples, realistic movement"},"lighting_design":{"source":"Single-direction natural sunlight","color_temp":"Warm sun-lit tones","exposure":"Slightly underexposed (lowered exposure)","shadows":"Physically accurate contact shadows on collarbones and chest"}},"technical_parameters":{"optics":"50mm–85mm focal length equivalent, realistic photographic perspective","depth_of_field":"Shallow, organic bokeh, natural fall-off","resolution_quality":"16k Hyper-Realistic","aspect_ratio":"3:4"}}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Product Marketing - High-Fashion, Moody Portrait in a Luxury Lounge',
                    'A highly detailed JSON prompt for generating an ultra-photorealistic, high-fashion portrait of a woman in a black strapless mini dress and lace tights, leaning against a marble counter in an upscale lounge. The prompt specifies glamorous makeup, a cherry-red handbag, low-light atmospheric glow with high contrast, and detailed technical camera settings for a cinematic result.',
                    '{
  "subject": {
    "description": "A young woman with a confident, poised expression looking off-camera.",
    "physical_traits": {
      "hair": "Long, sleek, waist-length straight hair in a honey-blonde shade with dark roots.",
      "makeup": "Glamorous ''evening'' look featuring sharp winged eyeliner, defined brows, and a deep burgundy or oxblood matte lipstick.",
      "jewelry": "Elegant diamond-style tennis necklace and subtle stud earrings."
    },
    "pose": "Leaning gracefully against a marble counter, one hand holding a {argument name="handbag color" default="red"} handbag, body angled slightly to create a dynamic silhouette."
  },
  "attire": {
    "main": "Black form-fitting strapless sweetheart neckline mini dress.",
    "accessories": [
      "Intricate floral-patterned black lace tights/hosiery.",
      "Bright cherry-red glossy crocodile-embossed leather handbag."
    ]
  },
  "environment": {
    "setting": "An upscale, modern lounge or luxury restroom interior.",
    "elements": [
      "Deep red velvet or padded bar accents.",
      "Dark marble countertops with modern matte black faucets.",
      "Large, uniquely shaped red-framed mirrors reflecting a warm, dim ambiance.",
      "Background figures slightly out of focus to provide depth."
    ]
  },
  "lighting_and_color": {
    "palette": "Rich crimson reds, deep blacks, and warm golden skin tones.",
    "lighting": "Low-light atmospheric glow with a sharp key light on the subject to create high-contrast highlights and shadows.",
    "mood": "Elegant, moody, high-fashion, and luxurious."
  },
  "technical_camera_specs": {
    "camera": "High-end DSLR, likely Canon EOS R5 or Sony A7R IV.",
    "lens": "35mm prime lens for a wide yet intimate perspective.",
    "settings": {
      "aperture": "f/2.8 for a shallow depth of field (bokeh background).",
      "iso": "800 for slight grain and texture in low light.",
      "shutter_speed": "1/125s to capture sharp detail."
    },
    "quality": "Ultra-photorealistic, 8k resolution, cinematic lighting, sharp focus on facial features, realistic skin texture."
  }
}',
                    'Portrait',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769581992539_dfmiat_G_rypgmW4A0qQpy.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Product Marketing - Ultra-Photorealistic Golden Hour Portrait Prompt',
                    'A detailed, structured JSON prompt for generating an ultra-photorealistic image of a woman in a casual luxury setting during golden hour, emphasizing high-end editorial quality and specific camera/lighting details.',
                    '{
  "meta": {
    "aspect_ratio": "4:5",
    "quality": "ultra_photorealistic, raw, influencer lifestyle, high-end editorial",
    "resolution": "8k",
    "camera": "Mirrorless camera (e.g., Sony A7R IV)",
    "lens": "35mm f/1.4 lens (capturing full body and environment)",
    "style": "Casual luxury, sun-drenched, golden hour aesthetic, relaxed confidence",
    "composition": "Full body shot of a woman reclining in a chair, low angle perspective emphasizing legs, centered framing."
  },
  "scene": {
    "location": "A modern, minimalist hotel room or bedroom.",
    "environment": [
      "Modern beige fabric lounge chair with a matching footrest",
      "Light wooden floating nightstand with blue over-ear headphones resting on it",
      "White wall radiator visible in background",
      "Plain neutral beige/off-white walls",
      "Beige lampshade in the upper corner"
    ],
    "time": "Late afternoon, Golden Hour.",
    "atmosphere": "Lazy, warm, quiet luxury, unbothered, chic."
  },
  "lighting": {
    "type": "Direct, hard natural sunlight.",
    "source": "Window off-camera to the left.",
    "effect": "Creates strong, distinct geometric shadows (likely from window frames) on the wall behind, high contrast highlights on the face and legs, warm golden tone."
  },
  "subject": {
    "identity": "A stunning young woman with long, wet-look platinum blonde hair falling over her shoulders. She has a tan complexion, full lips, and a confident, direct gaze.",
    "body": {
      "pose": "Reclining deeply into the lounge chair, legs crossed and extended towards the camera (focus on bare feet and legs), one hand resting on the chair arm, the other on her leg.",
      "physique": "Fit, curvy figure."
    },
    "outfit": {
      "clothing": "Tight-fitting, long-sleeved {argument name="dress color" default="purple"} ribbed mini dress.",
      "accessories": "Red string bracelet on wrist, black nail polish on hands and toes."
    }
  },
  "realism_focus": {
    "textures": "Ribbed knit texture of the purple dress, realistic skin texture under direct harsh sunlight, individual wet strands of blonde hair, fabric weave of the beige chair.",
    "imperfections": "Harsh realistic shadows on the wall, natural creases in the dress where the body bends, casual placement of the headphones."
  }
}',
                    'Portrait',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769581953251_qcdlne_G_rxTYjWMBAXtcH.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Product Marketing - Photorealistic Influencer Lifestyle Portrait in Bikini',
                    'A highly technical JSON prompt for generating a photorealistic image of a fit, curvaceous woman in a white bikini at an upscale tropical resort. It includes specific control net instructions and negative constraints to prevent aesthetic corrections and maintain high detail and bust volume.',
                    '{
  "subject": {
    "physique": "Fit curvaceous woman, tan skin, defined waist, soft texture, prominent bust volume",
    "face": "Oval shape, wavy dirty-blonde hair, neutral expression, direct gaze, minimal makeup",
    "apparel": "White smocked crinkle bikini, bandeau top, detached puff sleeves, side-tie bottom",
    "accessories": "Gold hoop earrings, delicate pendant necklace"
  },
  "composition": {
    "pose": "Seated on white sofa, body angled right, legs bent diagonal, hands resting, head forward",
    "framing": "Medium shot, knees up, eye-level, centered, 50mm focal length, 3:4 vertical",
    "environment": "Upscale tropical resort villa, glass sliding doors, palm trees background, wood beam ceiling"
  },
  "rendering": {
    "style": "Photorealistic influencer lifestyle, raw texture, 8k, natural high-key daylight",
    "tech_specs": {
      "res": "8k",
      "iso": "low",
      "light": "diffuse backlight, soft shadows"
    },
    "control_net": {
      "dw_pose": { "weight": 1.0, "goal": "skeletal_lock" },
      "zoe_depth": { "weight": 0.8, "goal": "volumetric_preservation" }
    },
  "negative_constraints": [
    "anatomy normalization",
    "reduced chest volume",
    "flattened depth",
    "skin smoothing",
    "plastic texture",
    "aesthetic proportion correction",
    "mirror selfies",
    "wide-angle distortion"
  ]
}',
                    'Portrait',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769581975779_vgv0l4_G_rxFF3WMAUcaE3.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Product Marketing - Ultra-Photorealistic Lifestyle Portrait in Lounge Wear',
                    'A detailed JSON prompt for generating an ultra-photorealistic portrait of a young woman in olive green bandeau bralette and cream knit lounge trousers, seated on a grey sofa. The prompt specifies lighting (natural diffuse daylight), technical specs (8k resolution, 85mm lens simulation), and detailed physical appearance for a clean, digital look.',
                    '{
  "prompt": {
    "subject": {
      "demographics": "Young female adult, roughly early 20s",
      "appearance": {
        "hair": "Long, dark brown hair, parted in the middle, straight texture falling over shoulders",
        "eyes": "Large brown eyes, winged eyeliner, direct gaze into camera",
        "skin": "Fair skin tone, smooth texture, visible collarbones",
        "body_details": "Small tattoo visible on right ribcage, silver navel piercing",
        "expression": "Soft, alluring, lips slightly parted"
      },
      "pose": {
        "posture": "Seated on a grey sofa, leaning slightly forward",
        "hands": "Right hand gently touching the upper chest/neck area, wearing a silver ring on the ring finger; left arm resting at side"
      }
    },
    "clothing": {
      "top": {
        "item": "Olive green bandeau-style bralette",
        "brand_text": "''{argument name="brand name" default="LOUNGE"}'' repeated on the underband",
        "style": "Straps are slipped down off the shoulders (off-the-shoulder look), semi-sheer mesh panel detailing on cups"
      },
      "bottom": {
        "item": "Cream/off-white knit lounge trousers",
        "texture": "Cable knit or textured fabric",
        "waist": "Drawstring waistband visible"
      }
    },
    "environment": {
      "location": "Indoor living space",
      "furniture": "Textured grey fabric sofa with back cushions",
      "background": "Plain, light beige or off-white wall",
      "props": "Textured blanket or fabric visible in bottom right corner"
    },
    "lighting": {
      "type": "Natural diffuse daylight",
      "direction": "Frontal lighting",
      "shadows": "Soft shadows behind the subject on the sofa, even illumination on the face"
    },
    "technical_specs": {
      "style": "Ultra-photorealistic lifestyle portrait",
      "camera": "High-end DSLR or Mirrorless (e.g., Sony A7R IV or Canon R5)",
      "lens": "50mm or 85mm portrait lens",
      "aperture": "f/2.8 for slight depth of field separation",
      "resolution": "8k, high detail",
      "film_grain": "Minimal to none, clean digital look"
    }
  }
}',
                    'Portrait',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769581984605_58o69y_G_rwkdIbAAAQmuj.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Product Marketing - Ultra-Photorealistic Summer Beach Club Portrait',
                    'A detailed JSON prompt for generating an ultra-photorealistic, 8k resolution image of a young woman with a curvy physique at a beach club. The prompt specifies dark brown hair with a messy beach texture, emerald green bikini visible under a black mesh cover-up, and uses hard natural sunlight to create high-contrast shadows for a tropical, alluring mood.',
                    '{
  "prompt_details": {
    "subject": {
      "demographics": "Young female adult, light tan skin, curvy physique",
      "hair": "Dark brown, shoulder-length, loose waves, slightly wet/messy beach texture, center part",
      "face": "Soft features, natural makeup, rosy cheeks, sultry and confident expression, gazing directly at camera",
      "body_details": "Visible script tattoo on the center of the neck, small tattoos on hands/arms, long manicured nails with white tips"
    },
    "fashion_and_styling": {
      "outerwear": "Black sheer mesh beach cover-up dress, sleeveless, deep V-neck, chevron/zigzag knit pattern",
      "swimwear": "{argument name="bikini color" default="Emerald green"} bikini visible underneath the mesh",
      "jewelry": "Silver clover station necklace, multiple silver rings on fingers, thin silver bracelet on right wrist"
    },
    "pose_and_action": {
      "pose": "Standing facing forward, slight hip tilt",
      "hands": "Both hands placed deliberately on the chest area, framing the neckline",
      "gaze": "Direct eye contact, relaxed but intense"
    },
    "environment": {
      "location": "Outdoor beach club or resort cabana",
      "background_elements": "Rustic wooden posts, flowing white fabric curtains/drapes, light sand ground",
      "time_of_day": "Mid-day, bright sunlight"
    },
    "lighting_and_atmosphere": {
      "lighting_type": "Natural hard sunlight",
      "shadows": "High contrast shadows from the sun, natural shading on the face and body",
      "mood": "Summer vibe, relaxed, confident, alluring, tropical"
    },
    "camera_and_tech_specs": {
      "style": "Ultra Photorealistic, 8k resolution, raw photo style",
      "camera_settings": "Medium shot (waist up/thigh up), 50mm lens, f/2.8 aperture for slight background separation",
      "quality": "High texture detail (skin pores, fabric mesh, sand grains), sharp focus on subject"
    }
  }
}',
                    'Portrait',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769581986985_eivru5_G_rwU_tWMAMHI6C.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Product Marketing - Decadent, Surreal Glamour Portrait of Ana de Armas in Luxury Bathroom',
                    'A detailed prompt for generating a high-fashion, surreal portrait of Ana de Armas in a luxury bathroom setting at 3:00 AM. It specifies a pose on a marble vanity, a reflective sequin mini-dress, and a lighting style inspired by Guy Bourdin mixed with Y2K flash photography, emphasizing high contrast and saturated colors.',
                    '{
  "version": "1.0",
  "aspect_ratio": "3:4",
  "subject": {
    "identity": "Ana de Armas",
    "fidelity": "Exact facial preservation, high-detail skin texture",
    "expression": {
      "eyes": "Heavy-lidded, tired but piercing",
      "mouth": "Slightly parted lips, subtly smudged red lipstick",
      "gaze": "Lazy, confident, post-party fatigue",
      "mood": "Decadent, surreal glamour, beautiful discomfort"
    },
    "pose": {
      "position": "Half-seated on white marble bathroom vanity",
      "body_language": "Elegantly arched back, chest pushed forward, one arm bracing behind with flat palm on marble",
      "legs": "One leg raised with knee bent and foot on vanity edge; one leg hanging with toes grazing the floor",
      "hands": "Free hand resting loosely on the raised knee"
    }
  },
  "wardrobe_accessories": {
    "clothing": "Form-fitting golden metallic mini-dress, iridescent purple accents, sweetheart neckline, reflective sequin texture, hem ridden up to reveal upper thigh",
    "jewelry": [
      "Long dangling gold earrings",
      "Stacked beaded bracelets",
      "Elegant luxury wristwatch"
    ],
    "footwear": "Barefoot"
  },
  "environment": {
    "setting": "Luxury bathroom at 3:00 AM",
    "materials": "White marble countertops, gold-finished fixtures",
    "key_elements": "Large floor-to-ceiling mirror behind subject, multiplying reflections of back and profile",
    "props": "Scattered champagne glass, decadent party debris"
  },
  "lighting_style": {
    "aesthetic": "Guy Bourdin surrealism mixed with Y2K millennium flash",
    "key_light": "Direct on-camera flash (high-intensity, Y2K style)",
    "accent_lights": {
      "camera_left": "Hot pink and magenta wash",
      "camera_right": "Electric cyan and blue rim lighting"
    },
    "effects": "High saturation light play on marble, mirror reflections creating voyeuristic tension, subtle halation on sequin highlights"
  },
  "technical_specs": {
    "camera": "35mm film aesthetic",
    "lens": "35mm wide-angle at f/2.8",
    "angle": "Slightly low angle to emphasize height and dominance",
    "focus": "Sharp focus on eyes and dress texture",
    "film_stock_simulation": {
      "contrast": "High",
      "grain": "Fine film grain",
      "color_grading": "Punchy, saturated, high-fashion editorial"
    }
  }
}',
                    'Portrait',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769581942548_c41i6k_G_ru901bMAApIaZ.jpg'],
                    '{"version":"1.0","aspect_ratio":"3:4","subject":{"identity":"Ana de Armas","fidelity":"Exact facial preservation, high-detail skin texture","expression":{"eyes":"Heavy-lidded, tired but piercing","mouth":"Slightly parted lips, subtly smudged red lipstick","gaze":"Lazy, confident, post-party fatigue","mood":"Decadent, surreal glamour, beautiful discomfort"},"pose":{"position":"Half-seated on white marble bathroom vanity","body_language":"Elegantly arched back, chest pushed forward, one arm bracing behind with flat palm on marble","legs":"One leg raised with knee bent and foot on vanity edge; one leg hanging with toes grazing the floor","hands":"Free hand resting loosely on the raised knee"}},"wardrobe_accessories":{"clothing":"Form-fitting golden metallic mini-dress, iridescent purple accents, sweetheart neckline, reflective sequin texture, hem ridden up to reveal upper thigh","jewelry":["Long dangling gold earrings","Stacked beaded bracelets","Elegant luxury wristwatch"],"footwear":"Barefoot"},"environment":{"setting":"Luxury bathroom at 3:00 AM","materials":"White marble countertops, gold-finished fixtures","key_elements":"Large floor-to-ceiling mirror behind subject, multiplying reflections of back and profile","props":"Scattered champagne glass, decadent party debris"},"lighting_style":{"aesthetic":"Guy Bourdin surrealism mixed with Y2K millennium flash","key_light":"Direct on-camera flash (high-intensity, Y2K style)","accent_lights":{"camera_left":"Hot pink and magenta wash","camera_right":"Electric cyan and blue rim lighting"},"effects":"High saturation light play on marble, mirror reflections creating voyeuristic tension, subtle halation on sequin highlights"},"technical_specs":{"camera":"35mm film aesthetic","lens":"35mm wide-angle at f/2.8","angle":"Slightly low angle to emphasize height and dominance","focus":"Sharp focus on eyes and dress texture","film_stock_simulation":{"contrast":"High","grain":"Fine film grain","color_grading":"Punchy, saturated, high-fashion editorial"}}}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Product Marketing - Hyper-Focal Raw Photo of Sydney Sweeney in Luxury Interior',
                    'An extremely detailed prompt for generating a raw, unedited photo of Sydney Sweeney (with specific physical changes applied, like a 3.4 body ratio) in a luxury modern interior at night. It demands deep depth of field (f/22) for edge-to-edge sharpness, visible skin imperfections, and hard lighting from a direct flash source for a high-contrast, opulent aesthetic.',
                    '{
  "request": {
    "image_properties": {
      "dimensions": {
        "aspect_ratio": {
          "width": 9,
          "height": 16
        },
        "resolution": "8k"
      },
      "quality": {
        "type": "raw-photo-file",
        "focus": {
          "sharpness": "edge-to-edge sharpness, hyper-focal distance",
          "depth_of_field": "deep depth of field (f/22), everything in focus"
        },
        "details": "unedited raw photo, high frequency texture, visible skin pores, peach fuzz, micro-hairs, natural skin imperfections, chromatic aberration free"
      }
    },
    "subject_details": {
      "reference_person": {
        "name": "Sydney Sweeney",
        "physical_changes": {
          "body_ratio": "3.4",
          "hair_color": "blonde"
        },
        "image_reference": "uploaded_image"
      },
      "appearance": {
        "hair": {
          "length": "long",
          "texture": "voluminous waves",
          "color": "blonde",
          "finish": "detailed individual strands, natural luster"
        },
        "makeup": {
          "style": "soft-glam",
          "features": [
            "winged eyeliner",
            "matte mauve lips",
            "texture visible under makeup"
          ]
        },
        "outfit": {
          "type": "dress",
          "style": "halter-neck",
          "fit": "form-fitting",
          "neckline": "v-neck",
          "length": "mini",
          "color": "red",
          "fabric_texture": "visible fabric weave and stitching details"
        }
      }
    },
    "pose_details": {
      "style": "sexier",
      "gesture": {
        "action": "gesture toward the camera",
        "details": "seductive yet classy"
      },
      "body_position": {
        "angle": "slightly angled to accentuate curves",
        "expression": "confident, alluring"
      }
    },
    "background_and_effects": {
      "background": "luxury interior",
      "focus_effects": {
        "depth_of_field": "infinite",
        "foreground_hand": "sharp focus",
        "blur_reduction": "no motion blur, no gaussian blur, no bokeh"
      }
    },
    "environment": {
      "location": "luxury modern interior",
      "time_of_day": "night",
      "lighting": {
        "overhead": {
          "type": "circular recessed ceiling light",
          "details": "crystal chandelier"
        },
        "accent": {
          "type": "vertical warm golden wall slats",
          "effect": "ambient, soft glow"
        },
        "flash": "direct flash photography style, hard lighting source"
      },
      "aesthetic": {
        "mood": "elegant",
        "atmosphere": "chic, sophisticated, with a touch of opulence",
        "visual_effects": [
          "crystal clear clarity",
          "high contrast",
          "hard shadows"
        ]
      }
    },
    "photography_style": {
      "camera_settings": {
        "sensor": "Full Frame 35mm",
        "apertu"',
                    'Product',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769581946242_qanbt5_G_ruGHKWoAAFLPu.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'E-commerce Main Image - Jade Aesthetic Conceptual Architecture Still Life',
                    'A highly detailed prompt for generating a conceptual product-style still life of a miniature, three-tiered Chinese pagoda. It focuses heavily on material quality, specifying semi-transparent jade-like glass, ice-blue tones, champagne-gold accents, and a sculptural base inspired by stylized mountains and water, emphasizing precision and serenity.',
                    'A highly detailed, exquisitely crafted conceptual product-style still life of an elegant traditional Chinese pavilion, presented as a miniature architectural artwork. The pavilion is a three-tiered pagoda structure made of semi-transparent jade-like and softly frosted glass material in refined milky white and ice-blue tones. Translucent turquoise-blue glass roofs feature delicately tapered profiles, accented with finely detailed champagne-gold ornamental edges and intricate, graceful golden flying-eave details. A warm, subtle golden light glows gently from within the pavilion through translucent windows, creating a soft inner radiance. A small vertical blue-and-gold plaque is precisely embedded on the upper tier façade, understated yet refined. The pavilion stands on a simplified, smooth sculptural base inspired by stylized mountains and calm water, carved from semi-transparent ice-blue crystal material. The mountain–water form is defined by elegant flowing contours, softly rounded transitions, and continuous sculptural surfaces, with restrained texture and no sharp ridges, evoking the feeling of finely polished jade, melted glass, or serene frozen waves. The mountain–water base fully fills the bottom of the frame and is cleanly cropped by the image edge: there is no visible ground, no platform, no horizon line, and no empty bottom space. The form appears naturally immersed and continuous, extending beyond the frame rather than resting upon it. A clean white jade staircase rises diagonally and seamlessly from within the sculptural base toward the pavilion entrance, maintaining clarity, balance, and an elegant sense of progression. Composition is tight, refined, and immersive: the pavilion and its base occupy most of the frame, with the mountain–water structure gently pressing against the lower edge, eliminating visual emptiness while preserving calmness. Camera: subtle low-angle, 3/4 perspective (approximately 25–30 degrees turned), with close framing to emphasize fine material quality, delicate craftsmanship, and sculptural precision. Soft, diffused luxury studio lighting with minimal hard shadows. High realism, shallow depth of field. Clean white to light-gray gradient background confined to the upper area, with carefully restrained negative space. Calm, ethereal, refined, premium craftsmanship, serene and sacred atmosphere, Eastern fantasy meets modern minimalism.',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769581922889_8og5ao_G_rZE8kXIAA6ssz.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'E-commerce Main Image - Dual Luxury Perfume Product Photography Prompts',
                    'A complex, structured prompt containing two distinct modules for generating photorealistic cinematic product photography of luxury perfume bottles. Module 1 focuses on a forest setting with a green bottle, emphasizing natural textures and diffused light. Module 2 focuses on an aquatic studio scene with a blue bottle, featuring dramatic water splashes and strong directional lighting.',
                    '{
  "global_settings": {
    "resolution": "8K",
    "aspect_ratio": "3:4",
    "style": "photorealistic cinematic product photography",
    "detail_level": "extreme micro-detail",
    "sharpness": "ultra-sharp",
    "noise": "none",
    "compression_artifacts": "none",
    "color_depth": "rich 16-bit color",
    "render_quality": "luxury commercial grade",
    "ai_finish": "clean AI-enhanced realism"
  },

  "module_1": {
    "scene_identity": "forest_green_perfume",
    "environment": {
      "setting": "dense forest atmosphere",
      "background": "soft blurred green foliage with depth separation",
      "foreground": "natural forest floor with soil, moss, and small debris",
      "props": [
        "flat natural stone platform",
        "irregular rock placed slightly behind the bottle",
        "pine tree branches with visible needles on the right side"
      ],
      "atmosphere": "soft drifting smoke or mist rising behind the bottle"
    },
    "product": {
      "object_type": "perfume bottle",
      "material": "ribbed translucent glass",
      "color": "deep emerald green liquid",
      "shape": "cylindrical with vertical grooves",
      "cap": {
        "material": "metal",
        "finish": "polished gold",
        "shape": "smooth cylindrical"
      },
      "label": "no visible branding text"
    },
    "lighting": {
      "key_light": "soft diffused natural light from front-left",
      "fill_light": "subtle ambient forest light",
      "highlights": "gentle reflections on glass ribs and gold cap",
      "shadows": "soft realistic shadows under bottle and rocks"
    },
    "camera": {
      "angle": "eye-level product angle",
      "focus": "sharp focus on bottle, shallow depth of field",
      "lens_effect": "natural bokeh background"
    },
    "mood": "fresh, woody, calm, premium, nature-inspired"
  },

  "module_2": {
    "scene_identity": "blue_water_splash_perfume",
    "environment": {
      "setting": "dark aquatic studio scene",
      "background": "deep navy to black gradient",
      "surface": "rippling water with reflective highlights",
      "motion_elements": [
        "large upward water splash behind bottle",
        "floating water droplets suspended mid-air"
      ],
      "props": [
        "lemon slices (yellow flesh visible)",
        "green citrus slice",
        "small red berries",
        "green herb sprigs"
      ]
    },
    "product": {
      "object_type": "perfume bottle",
      "material": "opaque glass",
      "color": "deep midnight blue",
      "shape": "rectangular with sharp edges",
      "cap": {
        "material": "matching dark glass",
        "shape": "cylindrical"
      },
      "text_visible": [
        "BLEU DE CHANEL",
        "EAU DE PARFUM"
      ]
    },
    "lighting": {
      "key_light": "strong directional light from upper front",
      "rim_light": "cool highlights on water splash",
      "reflections": "specular highlights on glass and w"',
                    'Product',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769581946269_67p8t0_G_rOiaaaUAEFKbT.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'E-commerce Main Image - Ultra-High-End Skincare Product Photography Prompt',
                    'A highly detailed prompt for generating photorealistic commercial photography of a matte white skincare pump bottle. It specifies the product details, complex arrangement of organic props (stones, moss, flowers), soft diffused lighting, and a warm, neutral color palette to achieve a premium botanical aesthetic.',
                    'Ultra-high-end photorealistic commercial skincare product photography featuring a matte white plastic pump bottle centered and upright, labeled “hella beauty” in clean black minimalist typography with smaller text reading “water bank moisture lotion” and subtle product details beneath, the bottle placed on a layered natural stone surface surrounded by carefully arranged organic props including smooth gray river stones, pale beige textured rock formations, soft green moss clusters,delicate white pom-pom flowers, cream-colored
daisy-like blossoms, light green fern leaves, and a
muted sage rose, all arranged in a balanced
symmetrical composition, background a soft warm
beige studio backdrop with gentle gradient and no
visible edges, foreground partially framed by softly
blurred out-of-focus white flowers creating depth,
lighting soft diffused daylight-style studio lighting
from upper left producing gentle shadows, natural
highlights on the bottle and petals, and a calm airymood, color palette dominated by warm neutrals, soft
whites, sage greens, and muted earth tones, textures
highly detailed including matte plastic, porous stone,
velvety petals, and moist moss, shallow depth of field
with sharp focus on the product label and midground
elements and smooth bokeh in foreground and
background, premium botanical skincare advertising aesthetic,
clean minimal luxury composition, cinematic realism,
ultra-detailed 8K, studio-grade hyperrealism, no extra
text, no borders, no stylization beyond natural
photorealism.',
                    'Product',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769581933226_ejgt3b_G_rDHP9aQAE_LUD.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'E-commerce Main Image - Minimalist Skincare Product Studio Photography Prompt',
                    'A highly detailed prompt for generating ultra-realistic, minimalist studio photography of a facial oil dropper bottle. It specifies the composition, including a raw wooden cube, a rectangular skincare box with minimal typography, and a glass vase with dried flowers, all arranged on a pastel pink surface with strong directional soft lighting.',
                    'Ultra-realistic minimalist studio product photography of a small transparent glass facial oil dropper bottle with a black rubber pipette cap, containing pale pink serum with dried pink floral elements suspended inside, placed centered on top of a natural raw wooden cube block with visible grain and split texture. To the left of the cube stands a tall matte white rectangular skincare box with minimal black typography reading “HUILE ÉCLAT VISAGE,” clean modern branding, and subtle logo near the bottom. To the right of the cube is a clear cylindrical glass vase filled with water and thin stems of dried pink gypsophila flowers extending upward and outward. The entire composition is arranged on a smooth matte pastel pink surface with a matching soft pink seamless studio background. Strong directional soft light comes from the left side, casting long, soft-edged realistic shadows of the flowers and objects onto the pink background. Lighting is natural-style, -det diffused, and warm, creating gentle highlights on the glass, subtle reflections on the serum bottle, and soft texture on the wooden block. Camera angle is straight-on at tabletop height, medium framing, all main objects in sharp focus with minimal depth of field blur. Color palette is dominated by blush pink, soft rose tones, warm light wood, clean white, and transparent glass. Mood is clean, airy, feminine, elegant, Scandinavian minimal aesthetic, premium skincare branding style, photorealistic, studio-grade realism, ultra',
                    'Product',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769581950901_0mu5jb_G_qUJFlbYAEt1Bk.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'E-commerce Main Image - Realistic Cockatiel Amulet Generation',
                    'A prompt used with Nano Banana Pro to generate a realistic image of an amulet shaped like a Cockatiel bird.',
                    'A Cockatiel amulet. Realistic texture, with details like a {argument name="material" default="wooden"} carving. The background is a {argument name="background" default="Japanese-style fabric"}.',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769582026851_pf6ar8_G_qf0iOWEAApJOE.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'E-commerce Main Image - Vertical Studio Product Photography of a Chocolate Donut (3 Variations)',
                    'A comprehensive prompt providing three distinct variations for generating vertical studio product photography of a chocolate-dusted donut. The variations cover monochromatic tone-on-tone aesthetics, intricate paper craft installations, and a custom terrazzo stone surface, all focusing on high-resolution, commercial editorial style.',
                    '1) Vertical studio product photography of the chocolate-dusted donut based on the upload reference photo of the product, centered on a matte, circular podium painted in a warm cocoa shade, maintaining the exact logo, text, and shape of the original product. The composition strictly adheres to a monochromatic "tone-on-tone" aesthetic, where the background, surface, and props utilize varying shades of brown—from deep espresso to light latte—to create a sophisticated, layered visual experience. The donut acts as the focal point, with the dusty texture of the topping providing a tactile contrast to the smooth, minimal surroundings.
The lighting is designed to be soft yet directional, utilizing a large diffuser to wrap light around the curves of the donut while maintaining subtle shadows that define its volume. The background is a seamless paper backdrop in a rich mocha tone, creating a distraction-free environment that blends harmoniously with the product''s color palette. The image is captured with a high-resolution portrait lens, ensuring crisp focus on the chocolate powder details while allowing the monochromatic colors to melt together in a creamy, cohesive commercial editorial style.

2) Vertical studio product photography of the chocolate-dusted donut based on the upload reference photo of the product, maintaining the exact shape and appearance of the original. The donut is positioned centrally, acting as the focal point amidst an intricate, multi-layered paper craft installation. Hand-cut layers of textured art paper in warm, complementary shades of mocha, latte, cream, and muted gold are stacked and arranged in organic, wave-like patterns that build up around the base of the donut, creating depth and a sophisticated, three-dimensional topographical effect.
The lighting is expertly designed using soft, directional studio lights that cast gentle, defined shadows between the paper layers, emphasizing the precise cutouts and the tactile quality of the materials. The camera angle is straight-on at eye level, capturing the rich texture of the cocoa powder against the smooth, matte finish of the paper art. The shot is framed vertically with a shallow depth of field, ensuring the donut is in razor-sharp focus while the surrounding paper layers gradually blur into an abstract, artistic backdrop, enhancing the premium, handcrafted feel of the scene.

3) Vertical studio product photography of the chocolate-dusted donut based on the upload reference photo of the product, placed centrally on a custom-made terrazzo stone surface, maintaining the exact shape and appearance of the original product. The terrazzo pattern features a stylish mix of embedded aggregate chips in muted tones of burnt orange, forest green, mustard yellow, and cream set within a warm beige base, creating a vibrant yet sophisticated textural contrast with the matte cocoa powder on the donut.
The environment is a controlled studio setting with s',
                    'Product',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769581923173_1ggb2e_G_qRiACbgAAWX9t.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'E-commerce Main Image - White Fairy Party Figurine Generation',
                    'A prompt used with Nano Banana Pro to generate an image of a figurine depicting a party of white fairies, emphasizing the successful conversion of 2D concepts into realistic 3D figures.',
                    'A figurine of a party of white fairies. Multiple fairies are {argument name="pose" default="happily dancing"}. The figurine has a texture like {argument name="material" default="matte plastic"} with fine details. The background is a clean studio photography style.',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769582028538_r6ltqr_G_qLmz8bAAUKwQD.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'E-commerce Main Image - High-End Skincare Product Flat Lay',
                    'A prompt template for generating high-end skincare advertising images using a top-down flat lay composition, focusing on glossy wet looks, frozen water splashes, and soft directional sunlight to emphasize product quality and ingredients.',
                    '{argument name="product name" default="product"}, centered top down flat lay, surrounded by {argument name="ingredients" default="ingredients"}, fresh slices and whole pieces, glossy wet look, water splash frozen mid motion around the product, dewy droplets on label and surface, warm beige seamless background, soft directional sunlight, crisp realistic shadow, high end skincare advertising, ultra realistic macro product photography, 100mm lens look, f/8 sharp focus, clean composition, no extra text, 8k, 1:1',
                    'Product',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769581961737_rqc756_G_qJLYnbAAIj9nu.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'E-commerce Main Image - Image-to-SD Papercraft Conversion Prompt',
                    'A detailed prompt for Nano Banana Pro (used via Lovart) to convert an input image into two outputs: a Super Deformed (SD) character papercraft template (unfolded view) and the final assembled papercraft product. This prompt is highly structured for specific output formats.',
                    '[AI Instruction: Image → SD Papercraft Conversion]

Analyze the [Input Image].

Extraction: Read the facial features, hairstyle, hair color, clothing, accessories, and pose of the person/character from the [Input Image].
SD Conversion: Convert into a Super Deformed (SD) character papercraft, 2-3 heads tall.
Output: Generate two images.
[Image 1: Unfolded Template/Parts]
The unfolded state of the papercraft. Colorful parts printed on thick paper. Unfolded templates for the head, face, hair, torso, arms, legs, accessories, etc. Fold lines (dotted lines), glue tabs, and numbers are visible. Scissors, cutters, glue, and a cutting mat are scattered in the background. Overhead view composition. Do not display any company names or logos.

[Image 2: Finished Product]
The assembled three-dimensional papercraft. SD character, 2-3 heads tall. Hairstyle, hair color, clothing, and accessories are reproduced based on the input image. Paper texture, folds, rounded corners, and a handmade warmth. Composition and lighting suitable for product promotion photography.

[Caution]
Do not include any real company names, brand logos, or trademarks.

[Atmosphere]
Quality similar to photos in craft magazines or handmade works. Soft studio lighting, clean background. High resolution.',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769582024516_7qr5z3_G_qGeqcbAAIdEK4.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'E-commerce Main Image - High-End Commercial Food Levitation Photography Prompt',
                    'A structured prompt for generating high-end commercial food photography featuring a levitation effect. It includes three subject variations (ice cream, hotdog, dumplings) and specifies minimalist luxury aesthetic, studio lighting, and ultra-sharp focus on textures for 8K quality.',
                    '{
  "image_prompt": {
    "main_concept": "High-end commercial food photography with a floating composition (food levitation effect).",
    "composition": {
      "arrangement": "Hero food item suspended in mid-air with complementary ingredients orbiting in perfect balance",
      "background": "Pure white background",
      "shadows": "Soft shadows beneath the suspended food"
    },
    "subject_variations": [
      {
        "item": "Creamy raspberry ice cream",
        "details": "Pistachio crumbs, chocolate chunks, mint leaves, berry drizzle"
      },
      {
        "item": "Gourmet hotdog",
        "details": "Glossy sausage, toasted bun, melted cheese, pickles, crispy onions, herbs, sauce"
      },
      {
        "item": "Handmade dumplings",
        "details": "Visible filling, fresh herbs, spices, pumpkin pieces, dipping sauce"
      }
    ],
    "lighting_and_color": {
      "type": "Studio lighting",
      "highlights": "Clean highlights",
      "color_accuracy": "Natural color accuracy, realistic depth"
    },
    "technical_specs": {
      "style": "Minimalist luxury aesthetic, modern advertising style, commercial product photography",
      "focus": "Ultra-sharp focus on textures, crisp edges",
      "quality": "Hyper-realistic details, high resolution, 8K quality"
    }
  }
}',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769581940370_qzidmy_G_p6tZMbAAUJdUh.jpg'],
                    '{"image_prompt":{"main_concept":"High-end commercial food photography with a floating composition (food levitation effect).","composition":{"arrangement":"Hero food item suspended in mid-air with complementary ingredients orbiting in perfect balance","background":"Pure white background","shadows":"Soft shadows beneath the suspended food"},"subject_variations":[{"item":"Creamy raspberry ice cream","details":"Pistachio crumbs, chocolate chunks, mint leaves, berry drizzle"},{"item":"Gourmet hotdog","details":"Glossy sausage, toasted bun, melted cheese, pickles, crispy onions, herbs, sauce"},{"item":"Handmade dumplings","details":"Visible filling, fresh herbs, spices, pumpkin pieces, dipping sauce"}],"lighting_and_color":{"type":"Studio lighting","highlights":"Clean highlights","color_accuracy":"Natural color accuracy, realistic depth"},"technical_specs":{"style":"Minimalist luxury aesthetic, modern advertising style, commercial product photography","focus":"Ultra-sharp focus on textures, crisp edges","quality":"Hyper-realistic details, high resolution, 8K quality"}}}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'E-commerce Main Image - Vertical Studio Product Photography of a Chocolate Donut (3 Variations) (Dup',
                    'A comprehensive prompt providing three distinct variations for generating vertical studio product photography of a chocolate-dusted donut. The variations cover monochromatic tone-on-tone aesthetics, intricate paper craft installations, and a custom terrazzo stone surface, all focusing on high-resolution, commercial editorial style. (Duplicate of 2016083799734681666)',
                    '1) Vertical studio product photography of the chocolate-dusted donut based on the upload reference photo of the product, centered on a matte, circular podium painted in a warm cocoa shade, maintaining the exact logo, text, and shape of the original product. The composition strictly adheres to a monochromatic "tone-on-tone" aesthetic, where the background, surface, and props utilize varying shades of brown—from deep espresso to light latte—to create a sophisticated, layered visual experience. The donut acts as the focal point, with the dusty texture of the topping providing a tactile contrast to the smooth, minimal surroundings.
The lighting is designed to be soft yet directional, utilizing a large diffuser to wrap light around the curves of the donut while maintaining subtle shadows that define its volume. The background is a seamless paper backdrop in a rich mocha tone, creating a distraction-free environment that blends harmoniously with the product''s color palette. The image is captured with a high-resolution portrait lens, ensuring crisp focus on the chocolate powder details while allowing the monochromatic colors to melt together in a creamy, cohesive commercial editorial style.

2) Vertical studio product photography of the chocolate-dusted donut based on the upload reference photo of the product, maintaining the exact shape and appearance of the original. The donut is positioned centrally, acting as the focal point amidst an intricate, multi-layered paper craft installation. Hand-cut layers of textured art paper in warm, complementary shades of mocha, latte, cream, and muted gold are stacked and arranged in organic, wave-like patterns that build up around the base of the donut, creating depth and a sophisticated, three-dimensional topographical effect.
The lighting is expertly designed using soft, directional studio lights that cast gentle, defined shadows between the paper layers, emphasizing the precise cutouts and the tactile quality of the materials. The camera angle is straight-on at eye level, capturing the rich texture of the cocoa powder against the smooth, matte finish of the paper art. The shot is framed vertically with a shallow depth of field, ensuring the donut is in razor-sharp focus while the surrounding paper layers gradually blur into an abstract, artistic backdrop, enhancing the premium, handcrafted feel of the scene.

3) Vertical studio product photography of the chocolate-dusted donut based on the upload reference photo of the product, placed centrally on a custom-made terrazzo stone surface, maintaining the exact shape and appearance of the original product. The terrazzo pattern features a stylish mix of embedded aggregate chips in muted tones of burnt orange, forest green, mustard yellow, and cream set within a warm beige base, creating a vibrant yet sophisticated textural contrast with the matte cocoa powder on the donut.
The environment is a controlled studio setting with s',
                    'Product',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769581929437_70wtfl_G_pzFk9XcAAWO04.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'E-commerce Main Image - Top-Down Flat Lay Product Photo Generation Prompt',
                    'A prompt designed for generating a top-down flat lay product photo. It instructs the AI to use an uploaded product, automatically select matching props for a minimal aesthetic, and strictly preserve the product''s original details like geometry, size, colors, and text. It specifies warm beige background, soft directional sunlight, and macro photography style.',
                    'Create top-down flat lay product photo. Use the uploaded product as the main object, centered. Analyze the product type from the photo and automatically choose matching props/ingredients for an aesthetic flat lay around it (minimal, premium, on-brand). Preserve exact geometry, size, colors, label design, and all text on the product (no changes). Warm beige seamless background, soft directional sunlight, crisp realistic shadow. 
Ultra-realistic macro product photography, 100mm lens look, f/8, sharp focus, clean composition, no extra text, 8k, format 2:3.',
                    'Product',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769581935739_c0exz8_G_o-3AxbgAAtbgZ.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'E-commerce Main Image - Hypebeast Showroom Still Shot Prompt',
                    'A short, smart prompt designed to generate a still shot image with a Hypebeast showroom aesthetic.',
                    'Hypebeast showroom still shot',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769495433286_ixvbzc_G_nIYzgXYAEvtSl.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'E-commerce Main Image - Macro product photography of rose-gold lipstick',
                    'A prompt for generating macro product photography of an elegant rose-gold lipstick. It specifies the setting (reflective marble surface, luxury vanity background), surrounding elements (flying rose petals, powder dust), and lighting (warm studio lighting, dramatic shadows) to achieve a premium cosmetic brand style.',
                    'Elegant rose-gold lipstick standing upright on a reflective marble surface, surrounded by flying rose petals and soft powder dust. Warm studio lighting with dramatic shadows, luxury vanity background with blurred mirrors and golden accents, cinematic mood, macro product photography, ultra-sharp details, glossy textures, premium cosmetic brand style.

3×3photo grid with different angles and poses. Same character, consistent look, clean lighting, real photoshoot vibe 2k.',
                    'Product',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769495319633_ngukfg_G_ma_HxbsAAv8Vh.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'E-commerce Main Image - Minimalist studio shot of transparent bubble wrap fashion item',
                    'A prompt for generating a minimalist, high-fashion editorial studio shot of a transparent bubble wrap item. It focuses on material texture, glossy details, soft diffused lighting, and a clean, ultra-clean aesthetic against a neutral background.',
                    '{
  "prompt": "A studio shot of a transparent bubble wrap fashion elegant {argument name="fashion item" default="[ITEM]"}, empty with nothing inside. The material is clear, glossy, and highly detailed, capturing the texture of inflated bubbles. Minimalist composition, high-fashion editorial style, soft diffused studio lighting, neutral background, ultra-clean aesthetic, photorealistic rendering, sharp focus.",
  "style": {
    "lighting": "soft diffused studio lighting",
    "background": "neutral seamless backdrop",
    "mood": "modern, minimalist, elegant",
    "quality": "ultra-detailed, photorealistic",
    "material": "transparent bubble wrap"
  }
}',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769495312047_eaxyhl_G_lpHBmbYAAll97.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'E-commerce Main Image - Realistic Cocoa Plantation Commercial Shot with Motion',
                    'A detailed prompt for generating a high-quality, realistic commercial image of a cocoa plantation, focusing on the texture and appearance of a partially split cocoa pod. It also includes a motion component for video generation, where the beans transform into a roasted cocoa vortex.',
                    'High-quality realistic commercial shot of a cocoa plantation in landscape orientation, cocoa tree as background, one cocoa pod partially split open on the branch in the center, fresh cocoa beans clearly visible inside with fibrous natural texture, slight irregular opening, surrounding pods and leaves softly out of focus, rich earthy brown and green tones, warm natural daylight with soft directional highlights, shallow depth of field, premium agricultural realism, no text, no people, no branding. 

Motion: The cocoa pod beans rapidly fly out and transform into {argument name="motion effect" default="roasted cocoa vortex"}',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769495321023_z5v14d_G_lQI_UXwAAJGl6.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'E-commerce Main Image - High-End Skincare Product Macro Photography Ad',
                    'A detailed prompt designed to create a high-end skincare product advertisement using ultra-realistic macro product photography. It specifies the composition (flat lay, center focus), surrounding elements (fresh ingredients, frozen water splashes), lighting (warm directional sunlight), and camera settings (100mm lens, f/8 sharp focus) for a clean, premium aesthetic.',
                    '[{argument name="product name" default="Product"}], top-down flat lay center position, surrounded by [{argument name="ingredient description" default="ingredients"}], fresh slices and whole pieces, glossy wet appearance, water splashes frozen around the product, dew drops attached to the label and surface, warm beige seamless background, soft directional sunlight, clear realistic shadows, high-end skincare advertisement, ultra-realistic macro product photography, 100mm lens effect, f/8 sharp focus, clean composition, no extra text, 8k, 1:1',
                    'Product',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769495419124_z3ly2p_G_krEgZbcAADmJh.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Game Asset - Short Prompt for POV Fisheye Pokemon Wildlife',
                    'A very short, stylistic prompt combining POV, Raw, Fisheye lens effects with the subject matter of Pokemon Wildlife.',
                    'POV Raw Fisheye Pokemon Wildlife',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769581993219_nm4qdx_G_ruPDjWMAkXJQc.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Game Asset - High-End 3D Render of Segmented Object',
                    'A detailed prompt for creating an ultra-clean, high-end 3D render of an object with clearly segmented parts, utilizing bold, high-contrast colors and a playful, premium collectible-toy aesthetic, rendered with Octane or Redshift-style quality.',
                    'Ultra-clean high-end 3D render of {argument name="object" default="OBJECT"}, designed with clearly segmented parts in bold, vibrant, high-contrast colors, each component using a different saturated pop color (electric blue, neon pink, bright yellow, mint green, cyan, purple, glossy white accents), smooth matte and semi-gloss plastic materials with subtle rubberized elements, rounded edges, playful industrial toy-like proportions, premium collectible-toy aesthetic, the object floating in mid-air with slightly separated components to emphasize individual parts, no motion blur, perfectly balanced composition, studio lighting with soft diffused key light and controlled rim light to enhance color separation, minimal clean shadows, smooth gradient background transitioning from deep blue to purple, ultra-polished Apple-level cleanliness, no textures, no scratches, no dirt, no realism noise, no muted tones, no desaturation, no monochrome dominance, perfect global illumination, ray-traced reflections, soft contact shadows, shallow depth while remaining razor sharp, cinematic framing, centered composition, minimalistic, modern, playful yet premium, rendered in ultra-high resolution with Octane or Redshift-style quality, Behance-feature-level output, no text, no logos, no branding, no extra elements, no people, no environment clutter, no watermark, no typography, aspect ratio 4:5.',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769581955007_zl5wlp_G_rkX9cbAAAZOcL.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Game Asset - Ultra-Realistic Cinematic Scene of Floating in Mid-Air',
                    'An ultra-realistic cinematic prompt for generating a dynamic scene of a character floating upside down above the clouds. The prompt emphasizes motion blur, realistic physics, epic scale, and the presence of two futuristic stealth fighter jets flying close to the subject.',
                    'Ultra realistic cinematic scene of my floating and falling in mid air above the clouds, dynamic upside down pose with legs bent and arms slightly raised, wearing black hoodie black pants black cap sunglasses and {argument name="shoe color" default="red"} sports shoes, dramatic sense of motion, two futuristic stealth fighter jets flying very close above and below the character with motion blur and heat trails, high altitude sky with soft clouds far below, daylight cinematic lighting, sharp focus on character, wide angle shot, epic scale, realistic physics, dramatic composition, 4k quality, no text, no logo, no watermark',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769581983014_rvpnjj_G_rMyEpXYAAERjC.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Game Asset - Massive Ancient Abandoned Alien Mining Machine Prompt',
                    'A simple, high-concept prompt for generating an image of a massive, ancient, abandoned alien mining machine shaped like a worm, using specific Midjourney parameters for style and reference.',
                    'Massive ancient abandoned alien mining machine in the shape of a worm --ar 16:9 --raw --sref 213005887 --sw 100 --stylize 300 --v 6.1',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769581948588_efib76_G_qxWq6XsAEZMuc.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Game Asset - Hyper-Realistic Military Squad Portrait',
                    'A prompt designed to generate a hyper-realistic, cinematic portrait of an elite three-person military squad in tactical gear. The scene is set in a gritty warzone with smoke and sparks, aiming for a game-poster aesthetic with high detail and 8K resolution.',
                    'A hyper-realistic, cinematic 9:16 portrait of a modern military squad lineup. In the middle stands, wearing tactical combat gear with a vest, headset, gloves, and a futuristic assault rifle. On the left: a rugged soldier with a beard and boonie hat, wearing heavy tactical armor. On the right: a mysterious masked operative with a skull-patterned mask and combat uniform. The three stand side by side as an elite special forces unit, set in a gritty warzone environment with sparks, smoke, and cinematic lighting. Ultra-detailed, realistic textures, game-poster style, 8K',
                    'Portrait',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769581999647_q51u2t_G_pOOQBXYAEDDfg.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Game Asset - RPG Status Screen Overlay',
                    'A Japanese prompt for generating an image where a realistic RPG status screen appears behind the subject.',
                    'A realistic RPG status screen appears in the background.',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769582020426_iz4zgl_G-IMHbJaAAAvezG.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Game Asset - Cinematic 3D World Emergence from Object',
                    'A template prompt for generating a cinematic 3D composition where a small object releases an entire world or reality far bigger than itself, with the object''s shapes transforming into the terrain and architecture of the emerging world.',
                    'Cinematic 3D composition centered on a {argument name="object" default="[OBJECT]"}, frozen at the instant it releases something far bigger than itself.

From within it, an entire {argument name="world style" default="[WORLD STYLE / THEME]"} reality unfolds, spilling outward into sweeping environments, towering forms, and dynamic motion that suggests this world was hidden there all along.

The object doesn’t just contain the world — it becomes part of it, with its shapes transforming into terrain, architecture, and symbolic landmarks.

Small figures, machines, or creatures navigate the scene, adding life, scale, and narrative.
The moment balances between dream and physics, where visual logic holds even as reality stretches.

The scene is charged with [ATMOSPHERE: glow, fog, particles, smoke, energy], amplifying the sense of rupture and emergence.

A subtle hint of the real world remains visible around the edges, anchoring the spectacle in realism.

Hyper-detailed textures, dramatic lighting, cinematic depth, ultra-realistic, 8K, concept art finish.',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769495339444_klkal0_G_mCYwLaIAA1M0i.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Game Asset - Pixar-style 3D character of a cheerful girl in yellow',
                    'A prompt for generating a high-quality, Pixar/Disney-inspired 3D cartoon character of a cheerful young girl. It details her appearance, attire (yellow and white outfit, chunky sneakers), pose (energetic/surprised), and technical specifications like clay-like textures and cinematic depth of field.',
                    'A high-quality 3D cartoon-style character of a cheerful young girl with expressive oversized eyes and soft facial features, rendered in a Pixar/Disney-inspired aesthetic. She has long, wavy blonde hair with detailed strands, wearing round oversized glasses and a cozy yellow-and-white outfit. The character is dressed in a yellow hoodie layered with a textured jacket, white cargo pants, and chunky sneakers Accessories include a beanie hat and playful glasses matching the warm color palette.The pose is energetic and expressive-either mid-jump with arms raised in excitement or standing confidently with crossed arms and a surprised, curious expression. Clean monochrome {argument name="background color" default="yellow"} background, soft studio lighting, smooth clay-like textures, ultra-detailed clothing fabric, vibrant colors, joyful mood, cinematic depth of field, 4K resolution, modern stylized 3D illustration.',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769495308080_8af91s_G_lAzVxbUAE98vE.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Game Asset - LEGO Mountain Flood Rescue Scene Prompt',
                    'A prompt for generating a dramatic, cinematic image of a LEGO mountain village disaster scene. The scene involves torrential rain, river overflow, LEGO firefighters using rescue boats and ropes, houses on slopes, and misty mountains in the background, emphasizing intense realism and dramatic lighting.',
                    'LEGO mountain flood rescue scene, torrential rain causing river overflow in a LEGO mountain village, rescue boats and ropes used by LEGO firefighters, houses perched on slopes surrounded by muddy floodwater, misty mountains in background, dramatic cinematic lighting, intense LEGO disaster realism --ar 3:4',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769408657745_qrgt94_G_hyJtRbIAELZNz.jpg'],
                    '{}'::jsonb
                );
INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    'Game Asset - Stylized 3D Animated Female Photographer Character (Pixar Style)',
                    'A detailed prompt for creating a stylized 3D animated female photographer character in the Pixar–Disney style, using an uploaded face image for reference. The character has short curly brown hair, round glasses, and is standing in a cozy vintage photography studio filled with retro props and warm lighting.',
                    'Using the uploaded face image as the exact facial reference, create a stylized 3D animated female photographer character, Pixar–Disney style, soft cinematic lighting. A young woman with short curly brown hair, big expressive eyes, round glasses, and a calm confident expression. She is standing with arms crossed, a vintage analog camera hanging around her neck. Wearing a cream button-up shirt with rolled sleeves and high-waisted olive green trousers.
The background is a cozy vintage photography studio filled with old cameras, film rolls, photo prints pinned on the wall, wooden tables, and warm desk lamps. Retro aesthetic, nostalgic mood, warm tones, shallow depth of field, ultra-detailed textures, soft shadows, highly polished 3D render, studio quality, cinematic composition, 4k, portrait orientation.',
                    'General',
                    ARRAY['Nano Banana','Imported'],
                    ARRAY['https://cms-assets.youmind.com/media/1769408691310_rh6g0o_G_fwh6TbIAAsyQM.jpg'],
                    '{}'::jsonb
                );


import { createClient } from 'https://esm.sh/@supabase/supabase-js@2';
import { load } from "https://deno.land/std@0.224.0/dotenv/mod.ts";

console.log("🚀 Starting Nano Banana Prompt Ingestion...");

// Load environment variables
const env = await load({ envPath: "./.env.local" });
const SUPABASE_URL = env["SUPABASE_URL"] || Deno.env.get("SUPABASE_URL");
const SUPABASE_SERVICE_ROLE_KEY = env["SUPABASE_SERVICE_ROLE_KEY"] || Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");

if (!SUPABASE_URL || !SUPABASE_SERVICE_ROLE_KEY) {
    console.error("❌ Missing SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY in .env.local");
    Deno.exit(1);
}

const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY);

async function main() {
    const readmePath = "../awesome-nano-banana-pro-prompts/README.md";

    try {
        const text = await Deno.readTextFile(readmePath);
        console.log(`📖 Read ${text.length} bytes from ${readmePath}`);

        // Regex to match "### No. X: Title" sections
        const entries = text.split(/^### No\. \d+: /gm).slice(1);
        console.log(`🔍 Found ${entries.length} potential prompt entries.`);

        const prompts = [];

        for (const entry of entries) {
            try {
                // 1. Extract Title
                const titleLine = entry.split('\n')[0].trim();

                // 2. Extract Description
                // Matches content between "#### 📖 Description" and "#### 📝 Prompt"
                const descRegex = /#### 📖 Description\s+([\s\S]*?)\s+#### 📝 Prompt/;
                const descMatch = entry.match(descRegex);
                const description = descMatch ? descMatch[1].trim() : "";

                // 3. Extract Prompt Text
                // Matches content inside code block after "#### 📝 Prompt"
                const promptRegex = /#### 📝 Prompt\s+```(?:json)?\s+([\s\S]*?)\s+```/;
                const promptMatch = entry.match(promptRegex);

                if (!promptMatch) {
                    console.warn(`⚠️ Skipped "${titleLine}": No prompt block found.`);
                    continue;
                }

                const rawPrompt = promptMatch[1].trim();
                let promptText = rawPrompt;
                let metadata: any = {};
                let category = "General";

                // Check if it's JSON format
                if (rawPrompt.startsWith('{') && rawPrompt.endsWith('}')) {
                    try {
                        const json = JSON.parse(rawPrompt);
                        promptText = json.prompt || rawPrompt;

                        // Extract rich metadata from JSON
                        metadata = { ...json };
                        delete metadata.prompt; // No need to duplicate

                        if (json.style) category = json.style;
                    } catch (e) {
                        // Keep as raw text if JSON parse fails
                    }
                }

                // 4. Extract Category (Heuristic based on title or description)
                if (titleLine.toLowerCase().includes("portrait")) category = "Portrait";
                else if (titleLine.toLowerCase().includes("product")) category = "Product";
                else if (titleLine.toLowerCase().includes("landscape")) category = "Landscape";
                else if (titleLine.toLowerCase().includes("anime")) category = "Anime";

                // 5. Extract Image (First one)
                const imgRegex = /<img src="(.*?)"/;
                const imgMatch = entry.match(imgRegex);
                const imageUrls = imgMatch ? [imgMatch[1]] : [];

                prompts.push({
                    title: titleLine,
                    description: description.substring(0, 500), // Truncate if too long
                    prompt_text: promptText,
                    category: category,
                    tags: ["Nano Banana", "Imported"],
                    image_urls: imageUrls,
                    metadata: metadata
                });

            } catch (parseError) {
                console.warn(`⚠️ parsing error for entry: ${parseError}`);
            }
        }

        console.log(`✅ Successfully parsed ${prompts.length} prompts.`);

        if (prompts.length === 0) {
            console.error("❌ No prompts parsed. Check regex or file format.");
            return;
        }

        // Clear existing data (Optional: based on strategy, here we wipe clean to avoid dupes)
        console.log("🧹 Clearing existing prompts...");
        await supabase.from('cinematic_prompts').delete().neq('id', '00000000-0000-0000-0000-000000000000');

        // Insert in batches
        const BATCH_SIZE = 20;
        console.log(`🚀 Inserting into Supabase in batches of ${BATCH_SIZE}...`);

        for (let i = 0; i < prompts.length; i += BATCH_SIZE) {
            const batch = prompts.slice(i, i + BATCH_SIZE);
            const { error } = await supabase.from('cinematic_prompts').insert(batch);

            if (error) {
                console.error(`❌ Batch ${i / BATCH_SIZE + 1} failed:`, error.message);
            } else {
                console.log(`✅ Batch ${i / BATCH_SIZE + 1} inserted (${batch.length} items).`);
            }
        }

        console.log("🎉 Ingestion Complete!");

    } catch (err) {
        console.error("❌ Script failed:", err);
    }
}

main();

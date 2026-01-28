
import { createClient } from '@supabase/supabase-js';
import fs from 'fs';
import path from 'path';

console.log("🚀 Starting Nano Banana Prompt Ingestion (Node.js)...");

const SUPABASE_URL = process.env.SUPABASE_URL;
const SUPABASE_SERVICE_ROLE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!SUPABASE_URL || !SUPABASE_SERVICE_ROLE_KEY) {
    console.error("❌ Missing SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY. Did you run with --env-file=.env.local?");
    process.exit(1);
}

const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY);

async function main() {
    // Navigate up to find the repo
    const readmePath = path.resolve(process.cwd(), "../awesome-nano-banana-pro-prompts/README.md");

    try {
        if (!fs.existsSync(readmePath)) {
            console.error(`❌ README not found at ${readmePath}`);
            process.exit(1);
        }

        const text = fs.readFileSync(readmePath, 'utf-8');
        console.log(`📖 Read ${text.length} bytes from ${readmePath}`);

        const entries = text.split(/^### No\. \d+: /gm).slice(1);
        console.log(`🔍 Found ${entries.length} potential prompt entries.`);

        const prompts = [];

        for (const entry of entries) {
            try {
                const titleLine = entry.split('\n')[0].trim();

                const descRegex = /#### 📖 Description\s+([\s\S]*?)\s+#### 📝 Prompt/;
                const descMatch = entry.match(descRegex);
                const description = descMatch ? descMatch[1].trim() : "";

                const promptRegex = /#### 📝 Prompt\s+```(?:json)?\s+([\s\S]*?)\s+```/;
                const promptMatch = entry.match(promptRegex);

                if (!promptMatch) {
                    continue;
                }

                const rawPrompt = promptMatch[1].trim();
                let promptText = rawPrompt;
                let metadata = {};
                let category = "General";

                if (rawPrompt.startsWith('{') && rawPrompt.endsWith('}')) {
                    try {
                        const json = JSON.parse(rawPrompt);
                        promptText = json.prompt || rawPrompt;
                        metadata = { ...json };
                        delete metadata.prompt;
                        if (json.style) category = json.style;
                    } catch (e) { }
                }

                // Inferred Categories
                if (titleLine.toLowerCase().includes("portrait")) category = "Portrait";
                else if (titleLine.toLowerCase().includes("product")) category = "Product";
                else if (titleLine.toLowerCase().includes("landscape")) category = "Landscape";
                else if (titleLine.toLowerCase().includes("anime")) category = "Anime";
                else if (titleLine.toLowerCase().includes("logo")) category = "Design";

                const imgRegex = /<img src="(.*?)"/;
                const imgMatch = entry.match(imgRegex);
                const imageUrls = imgMatch ? [imgMatch[1]] : [];

                prompts.push({
                    title: titleLine.substring(0, 100), // Limit title length
                    description: description.substring(0, 1000),
                    prompt_text: promptText,
                    category: category,
                    tags: ["Nano Banana", "Imported"],
                    image_urls: imageUrls,
                    metadata: metadata
                });

            } catch (parseError) {
                // Ignore parsing errors for single entries
            }
        }

        console.log(`✅ Successfully parsed ${prompts.length} valid prompts.`);

        if (prompts.length === 0) {
            console.error("❌ No prompts parsed. Check regex.");
            return;
        }

        console.log("🧹 Clearing existing prompts...");
        // Use a filter that matches all rows to allow delete (requires row level security policy or service role)
        // With service role key, this should work.
        const { error: deleteError } = await supabase.from('cinematic_prompts').delete().neq('id', '00000000-0000-0000-0000-000000000000');
        if (deleteError) console.error("Warning during delete:", deleteError.message);

        const BATCH_SIZE = 20;
        console.log(`🚀 Inserting into Supabase in batches of ${BATCH_SIZE}...`);

        for (let i = 0; i < prompts.length; i += BATCH_SIZE) {
            const batch = prompts.slice(i, i + BATCH_SIZE);
            const { error } = await supabase.from('cinematic_prompts').insert(batch);

            if (error) {
                console.error(`❌ Batch ${Math.floor(i / BATCH_SIZE) + 1} failed:`, error.message);
            } else {
                process.stdout.write('.');
            }
        }
        console.log("\n🎉 Ingestion Complete!");

    } catch (err) {
        console.error("❌ Script failed:", err);
    }
}

main();

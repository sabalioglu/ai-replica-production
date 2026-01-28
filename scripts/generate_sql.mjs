
import fs from 'fs';
import path from 'path';

console.log("🚀 Generating Split SQL from Nano Banana README...");

function escapeSql(str) {
    if (!str) return 'NULL';
    return "'" + str.replace(/'/g, "''") + "'";
}

function escapeJson(obj) {
    if (!obj) return `'{}'::jsonb`;
    const jsonStr = JSON.stringify(obj);
    return "'" + jsonStr.replace(/'/g, "''") + "'::jsonb";
}

function pgArray(arr) {
    if (!arr || arr.length === 0) return "'{}'";
    const items = arr.map(s => escapeSql(s));
    return `ARRAY[${items.join(',')}]`;
}

async function main() {
    const readmePath = path.resolve(process.cwd(), "../awesome-nano-banana-pro-prompts/README.md");

    try {
        if (!fs.existsSync(readmePath)) {
            console.error(`❌ README not found at ${readmePath}`);
            process.exit(1);
        }

        const text = fs.readFileSync(readmePath, 'utf-8');
        const entries = text.split(/^### No\. \d+: /gm).slice(1);
        console.log(`🔍 Found ${entries.length} potential prompt entries.`);

        let currentBatch = 0;
        let batchSize = 10; // Reduced to 10 to fit in LLM context limits
        let currentQueries = [];

        // Initial clean up query in first batch
        currentQueries.push("TRUNCATE TABLE cinematic_prompts;");

        for (let i = 0; i < entries.length; i++) {
            const entry = entries[i];
            try {
                const titleLine = entry.split('\n')[0].trim();
                const descMatch = entry.match(/#### 📖 Description\s+([\s\S]*?)\s+#### 📝 Prompt/);
                const description = descMatch ? descMatch[1].trim() : "";
                const promptMatch = entry.match(/#### 📝 Prompt\s+```(?:json)?\s+([\s\S]*?)\s+```/);

                if (!promptMatch) continue;

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

                if (titleLine.toLowerCase().includes("portrait")) category = "Portrait";
                else if (titleLine.toLowerCase().includes("product")) category = "Product";
                else if (titleLine.toLowerCase().includes("landscape")) category = "Landscape";
                else if (titleLine.toLowerCase().includes("anime")) category = "Anime";

                const imgMatch = entry.match(/<img src="(.*?)"/);
                const imageUrls = imgMatch ? [imgMatch[1]] : [];
                const tags = ["Nano Banana", "Imported"];

                const sql = `INSERT INTO cinematic_prompts (title, description, prompt_text, category, tags, image_urls, metadata) VALUES (
                    ${escapeSql(titleLine.substring(0, 100))},
                    ${escapeSql(description.substring(0, 1000))},
                    ${escapeSql(promptText)},
                    ${escapeSql(category)},
                    ${pgArray(tags)},
                    ${pgArray(imageUrls)},
                    ${escapeJson(metadata)}
                );`;

                currentQueries.push(sql);

                // Check if batch is full
                if (currentQueries.length >= batchSize) {
                    const fileName = `scripts/prompts_seed_part${currentBatch + 1}.sql`;
                    fs.writeFileSync(path.resolve(process.cwd(), fileName), currentQueries.join('\n'));
                    console.log(`✅ Generated ${fileName} (${currentQueries.length} queries)`);
                    currentQueries = [];
                    currentBatch++;
                }

            } catch (parseError) { }
        }

        // Flush remaining
        if (currentQueries.length > 0) {
            const fileName = `scripts/prompts_seed_part${currentBatch + 1}.sql`;
            fs.writeFileSync(path.resolve(process.cwd(), fileName), currentQueries.join('\n'));
            console.log(`✅ Generated ${fileName} (${currentQueries.length} queries)`);
        }

    } catch (err) {
        console.error("❌ Script failed:", err);
    }
}

main();

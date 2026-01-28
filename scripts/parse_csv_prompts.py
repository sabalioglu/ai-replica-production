
import csv
import json
import os
import sys

# Configuration
CSV_FILE_PATH = "nano-banana-pro-prompts-20260128.csv"
OUTPUT_DIR = "ai-replica-production/scripts"
BATCH_SIZE = 1000  # distinct prompts per file
TABLE_NAME = "cinematic_prompts"

def escape_sql_string(s):
    if s is None:
        return "NULL"
    # Identify if it's already a string, if so, double single quotes
    return "'" + str(s).replace("'", "''") + "'"

def parse_source_media(media_str):
    if not media_str:
        return "'{}'"  # Empty array literal for Postgres
    # Assuming media_str is a single URL or comma-separated. 
    # If it is a JSON array string, we might need to parse it. 
    # For now, treat as single text.
    # If it looks like a list "['url1', 'url2']", we clean it.
    # Simple heuristic: if it contains commas, split it.
    
    # Safe approach: text[] literal in postgres is '{ "val1", "val2" }'
    # Check if it is a list
    urls = []
    if media_str.startswith("[") and media_str.endswith("]"):
        try:
            # Try parsing as JSON list
            urls = json.loads(media_str)
        except:
             # Fallback
             urls = [media_str]
    else:
        urls = [media_str]
    
    # Format for SQL
    # '{ "url1", "url2" }'
    # Escape double quotes in URLs if any
    clean_urls = [u.replace('"', '\\"') for u in urls if u]
    if not clean_urls:
         return "'{}'"
    
    array_literal = '{' + ','.join([f'"{u}"' for u in clean_urls]) + '}'
    return "'" + array_literal + "'"

def generate_sql_seeds():
    if not os.path.exists(CSV_FILE_PATH):
        print(f"Error: File {CSV_FILE_PATH} not found.")
        return

    print(f"Reading {CSV_FILE_PATH}...")
    
    prompts = []
    
    try:
        with open(CSV_FILE_PATH, 'r', encoding='utf-8') as f:
            reader = csv.DictReader(f)
            for row in reader:
                prompts.append(row)
    except Exception as e:
        print(f"Error reading CSV: {e}")
        return

    total_prompts = len(prompts)
    print(f"Total prompts found: {total_prompts}")
    
    if total_prompts == 0:
        return

    # Split into batches
    num_batches = (total_prompts + BATCH_SIZE - 1) // BATCH_SIZE
    
    for i in range(num_batches):
        start_idx = i * BATCH_SIZE
        end_idx = min((i + 1) * BATCH_SIZE, total_prompts)
        batch = prompts[start_idx:end_idx]
        
        output_file = os.path.join(OUTPUT_DIR, f"prompts_csv_seed_part{i+1}.sql")
        
        print(f"Writing batch {i+1}/{num_batches} to {output_file} ({len(batch)} items)...")
        
        with open(output_file, 'w', encoding='utf-8') as sql_file:
            sql_file.write(f"-- Batch {i+1} of {num_batches}\n")
            
            for item in batch:
                title = item.get('title', '')
                description = item.get('description', '')
                content = item.get('content', '') # JSON prompt
                source_media = item.get('sourceMedia', '')
                category = "Nano Banana Pro" # Default category
                
                # Metadata fields
                metadata = {
                    "sourceLink": item.get('sourceLink'),
                    "sourcePublishedAt": item.get('sourcePublishedAt'),
                    "author": item.get('author'),
                    "imported_from": "csv_batch_20260128"
                }
                
                # SQL Construction
                # columns: title, description, prompt_text, category, image_urls, metadata, tags
                
                # Handle potential duplicate titles? We just insert.
                
                val_title = escape_sql_string(title)
                val_desc = escape_sql_string(description)
                val_prompt = escape_sql_string(content)
                val_cat = escape_sql_string(category)
                val_tags = "'{\"Nano Banana\", \"Imported\", \"CSV\"}'"
                val_img = parse_source_media(source_media)
                val_meta = escape_sql_string(json.dumps(metadata))
                
                sql = f"""
INSERT INTO {TABLE_NAME} (title, description, prompt_text, category, tags, image_urls, metadata)
VALUES ({val_title}, {val_desc}, {val_prompt}, {val_cat}, {val_tags}, {val_img}, {val_meta})
ON CONFLICT (title) DO NOTHING;
"""
                sql_file.write(sql.strip() + "\n")
    
    print("Done generating SQL files.")

if __name__ == "__main__":
    generate_sql_seeds()

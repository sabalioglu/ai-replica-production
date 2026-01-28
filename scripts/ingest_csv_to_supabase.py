
import csv
import json
import os
import requests
import sys

# Configuration
CSV_FILE_PATH = "nano-banana-pro-prompts-20260128.csv"
ENV_FILE_PATH = "ai-replica-production/.env.local"
BATCH_SIZE = 50 
TABLE_NAME = "cinematic_prompts"

def load_env_vars(env_path):
    vars = {}
    try:
        with open(env_path, 'r') as f:
            for line in f:
                line = line.strip()
                if not line or line.startswith('#'):
                    continue
                if '=' in line:
                    key, val = line.split('=', 1)
                    # simple parsing, remove quotes if present
                    val = val.strip().strip('"\'')
                    vars[key.strip()] = val
    except Exception as e:
        print(f"Error reading .env: {e}")
    return vars

def parse_source_media(media_str):
    if not media_str:
        return []
    # Similar logic to before, return explicit list for JSON
    urls = []
    if media_str.startswith("[") and media_str.endswith("]"):
        try:
            urls = json.loads(media_str)
        except:
             urls = [media_str]
    else:
        urls = [media_str]
    return [u for u in urls if u]

def ingest_prompts():
    if not os.path.exists(CSV_FILE_PATH):
        print(f"Error: CSV {CSV_FILE_PATH} not found.")
        return

    # Load Credentials
    env_vars = load_env_vars(ENV_FILE_PATH)
    supabase_url = env_vars.get("NEXT_PUBLIC_SUPABASE_URL")
    supabase_key = env_vars.get("SUPABASE_SERVICE_ROLE_KEY")

    if not supabase_url or not supabase_key:
        print("Error: Missing Supabase credentials in .env.local")
        return

    # API Endpoint
    endpoint = f"{supabase_url}/rest/v1/{TABLE_NAME}"
    headers = {
        "apikey": supabase_key,
        "Authorization": f"Bearer {supabase_key}",
        "Content-Type": "application/json",
        "Prefer": "resolution=ignore-duplicates"  # Ignore if title collision
    }

    print(f"Reading {CSV_FILE_PATH}...")
    prompts_to_insert = []
    
    try:
        with open(CSV_FILE_PATH, 'r', encoding='utf-8') as f:
            reader = csv.DictReader(f)
            for row in reader:
                # Map fields
                title = row.get('title', '').strip()
                if not title: continue
                
                metadata = {
                    "sourceLink": row.get('sourceLink'),
                    "sourcePublishedAt": row.get('sourcePublishedAt'),
                    "author": row.get('author'),
                    "imported_from": "csv_batch_20260128"
                }

                prompts_to_insert.append({
                    "title": title,
                    "description": row.get('description', ''),
                    "prompt_text": row.get('content', ''), # Storing JSON prompt string
                    "category": "Nano Banana Pro",
                    "tags": ["Nano Banana", "Imported", "CSV"],
                    "image_urls": parse_source_media(row.get('sourceMedia', '')),
                    "metadata": metadata
                })

    except Exception as e:
        print(f"Error reading CSV: {e}")
        return

    total = len(prompts_to_insert)
    print(f"Total prompts to ingest: {total}")
    
    # Batch Insert
    for i in range(0, total, BATCH_SIZE):
        batch = prompts_to_insert[i:i+BATCH_SIZE]
        print(f"Ingesting batch {i//BATCH_SIZE + 1} ({len(batch)} items)...")
        
        try:
            response = requests.post(endpoint, json=batch, headers=headers)
            if response.status_code in (200, 201):
                pass # Success
            else:
                print(f"Error inserting batch: {response.status_code} {response.text}")
        except Exception as e:
             print(f"Request failed: {e}")

    print("Ingestion complete.")

if __name__ == "__main__":
    ingest_prompts()

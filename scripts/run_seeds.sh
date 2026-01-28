#!/bin/bash

# Configuration
PROJECT_ID="yiwezubimkzkqxzbfodn"
HOST="db.$PROJECT_ID.supabase.co"
USER="postgres"
DB="postgres"

echo "🚀 Starting Nano Banana Prompt Ingestion..."
echo "Target Host: $HOST"
echo "Target User: $USER"
echo ""
echo "Please enter your Supabase Database Password (input will be hidden):"
read -s PGPASSWORD
export PGPASSWORD
echo ""

# Check for psql
if ! command -v psql &> /dev/null; then
    echo "❌ Error: psql command not found."
    exit 1
fi

# Iterate through all generated part files
count=0
for file in scripts/prompts_seed_part*.sql; do
    if [ -f "$file" ]; then
        echo "Running $file..."
        psql -h "$HOST" -U "$USER" -d "$DB" -f "$file"
        
        if [ $? -eq 0 ]; then
            echo "✅ $file executed successfully."
            ((count++))
        else
            echo "❌ Failed to execute $file. Stopping."
            exit 1
        fi
    fi
done

echo ""
echo "🎉 Ingestion Complete! Executed $count files."

# n8n Integration Guide for AI Cinema

This guide explains how to connect your self-hosted n8n instance with the AI Cinema frontend.

## 1. Import the Workflow

1.  Open your n8n dashboard.
2.  Click **"Add Workflow"** > **"Import from..."** > **"Local File"**.
3.  Select the workflow file located at:
    `workflows/n8n_workflow.json` (or look in `n8n-skills` folder if not found)
    *(Note: If you are on the cloud, copy the JSON content and paste it).*

## 2. Configure Credentials

The workflow interacts with Supabase. You need to verify the **Supabase** node credentials.

1.  Double-click the **Supabase** node in n8n.
2.  Select (or Create) a Credential.
3.  **URL:** `https://yiwezubimkzkqxzbfodn.supabase.co` (Your Project URL)
4.  **Service Key:** Use the `service_role` key (NOT the anon key) for full write access.
    *   *Tip:* You can find this in your Supabase Dashboard > Settings > API.

## 3. How It Works

1.  **Trigger:** The workflow uses a **Schedule Trigger** (polling every 1 minute) OR a **Webhook**.
2.  **Process:**
    *   It checks the `cinema_projects` table for records with `status = 'processing'`.
    *   It generates the script/video using the AI Agents.
    *   It updates the record in Supabase with the result URL.
3.  **Frontend:** The frontend simply reads this status. When n8n finishes, the frontend updates automatically.

## 4. Testing

1.  Go to the [AI Cinema Dashboard](/cinema).
2.  Create a "New Project".
3.  Open n8n and click **"Execute Workflow"** manually (or wait for the timer).
4.  Watch the status change from `draft` -> `processing` -> `completed`.

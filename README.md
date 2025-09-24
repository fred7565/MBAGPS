Automated SEO Blog Generation — n8n Workflow

Automated pipeline for generating SEO-oriented blog posts using LLMs (Groq LLaMA), orchestrated by n8n, persisted in PostgreSQL, and published to WordPress with Telegram notifications.
This repository contains the sanitized export of the n8n workflow — all secrets removed and replaced by environment variables/placeholders.

⸻

Repository Structure
.
├─ .gitignore
├─ README.md
├─ Marketing_GP.sanitized.json    # Sanitized n8n workflow export (for import)
├─ .env.example                   # Example environment variables (never commit real values)
└─ docs/
   └─ setup-credentials.md        # Optional: credential setup instructions

   Overview
	•	Goal: Automate end-to-end SEO blog generation, publishing, and monitoring.
	•	Core components:
	•	Groq API (LLaMA 3.1) → Topic, outline, and article generation
	•	PostgreSQL → Persistent storage for topics and metadata
	•	WordPress REST API → Automated publishing
	•	n8n → Workflow orchestration
	•	Telegram Bot → Real-time notifications
	•	Features:
	•	Deduplication of topics
	•	Enforced outline consistency
	•	Automatic schema/meta data embedding
	•	Error handling and retry logic

⸻

⚠️ Security Notice
	•	Never commit real API keys, passwords, or .env files.
	•	This repository only contains sanitized JSON exports (all secrets removed).
	•	Make sure .env is listed in .gitignore (see included template).
	•	If you have previously pushed secrets, rotate them immediately and clean your git history.

⸻

Requirements
	•	Docker & Docker Compose (recommended) or a local n8n installation
	•	PostgreSQL (local container or managed instance)
	•	WordPress instance with REST API access (user + Application Password, or JWT plugin)
	•	Telegram Bot token + target chat ID
	•	Groq API key (or other LLM provider API key)

⸻

Environment Variables

Create a .env file (never commit it). Example:
# LLM
GROQ_API_KEY=your_groq_api_key_here

# WordPress
WP_BASE_URL=https://your-site.example
WP_USERNAME=your_wp_username
WP_APPLICATION_PASSWORD=your_wp_app_password

# PostgreSQL
PG_HOST=localhost
PG_PORT=5432
PG_DB=n8n
PG_USER=n8n
PG_PASS=change_me

# Telegram
TELEGRAM_BOT_TOKEN=123456789:ABCdefGHIjklMNOpQRstuvWXyZ
TELEGRAM_CHAT_ID=987654321

# n8n encryption (recommended)
N8N_ENCRYPTION_KEY=some-random-32-byte-string

Setup Instructions
	1.	Run n8n (Docker Compose recommended):
    version: "3"
services:
  n8n:
    image: n8nio/n8n:latest
    ports:
      - "5678:5678"
    environment:
      - DB_TYPE=postgresdb
      - DB_POSTGRESDB_HOST=${PG_HOST}
      - DB_POSTGRESDB_PORT=${PG_PORT}
      - DB_POSTGRESDB_DATABASE=${PG_DB}
      - DB_POSTGRESDB_USER=${PG_USER}
      - DB_POSTGRESDB_PASSWORD=${PG_PASS}
      - N8N_ENCRYPTION_KEY=${N8N_ENCRYPTION_KEY}
    volumes:
      - ./n8n:/home/node/.n8n

  docker compose up -d

 2.	Open n8n UI → http://localhost:5678
	3.	Create credentials inside n8n (Groq, WordPress, PostgreSQL, Telegram).
These are not included in the sanitized export.
	4.	Import workflow:
	•	In n8n UI → top-right menu → Import workflow → choose Marketing_GP.sanitized.json.
	5.	Link credentials:
Map the workflow’s placeholder credentials to the ones you created in n8n.
	6.	Test run:
Trigger the workflow manually and check logs + Telegram notification.

⸻

Example Workflow Steps
	1.	Input: site theme + number of topics
	2.	Keyword selection
	3.	Title & outline generation (Groq LLaMA)
	4.	Parsing & deduplication
	5.	Storage in PostgreSQL
	6.	Article drafting (1500+ words, schema + meta)
	7.	WordPress publishing
	8.	Telegram summary notification

⸻

Troubleshooting
	•	Undefined credentials: Ensure you recreated them in n8n and re-linked nodes.
	•	Rate limits: Add delay/wait nodes to avoid Groq API errors.
	•	Schema/meta errors: Check parsing logic and adjust prompts.
	•	Image paths: If used, configure accessible storage or local static hosting.

⸻

Next Steps
	•	Add CI/CD pipeline for workflow testing
	•	Expand error handling & retries
	•	Explore self-hosted LLMs for scalability
	•	Evaluate ethical impact of mass SEO automation

⸻

License

This project is shared for academic/demonstration purposes.
Use responsibly and comply with your API providers’ terms.
     
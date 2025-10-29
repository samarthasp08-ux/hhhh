#!/bin/bash
set -e

echo "🚀 Starting Sammy bot environment setup (system Python)..."

# ---------------- System packages ----------------
echo "📦 Installing system dependencies..."
sudo apt update
sudo apt install -y \
    python3-pip python3-dev build-essential \
    libffi-dev libssl-dev libsqlite3-dev libjpeg-dev zlib1g-dev \
    curl git wget unzip xvfb libnss3 libatk1.0-0 libcups2 \
    libxcomposite1 libxdamage1 libxrandr2 libxkbcommon0 libpango-1.0-0 \
    libgbm1 fonts-liberation libappindicator3-1 xdg-utils \
    ffmpeg procps psmisc ca-certificates

# Upgrade pip, setuptools, wheel system-wide
echo "🐍 Upgrading pip, setuptools, wheel..."
sudo -H python3 -m pip install --upgrade pip setuptools wheel

# ---------------- Python packages ----------------
echo "📦 Installing Python dependencies system-wide..."
sudo -H python3 -m pip install python-dotenv cryptography httpx
sudo -H python3 -m pip install "python-telegram-bot<23,>=22.0"
sudo -H python3 -m pip install instagrapi
sudo -H python3 -m pip install playwright
sudo -H python3 -m pip install playwright-stealth==1.0.6

# ---------------- Playwright browsers ----------------
echo "🌐 Installing Playwright browsers..."
sudo -H python3 -m playwright install
sudo -H python3 -m playwright install-deps
playwright install
# ---------------- Create sessions folder ----------------
mkdir -p sessions

echo "✅ Setup complete! You can now run your bot with:"
echo "python3 bot.py"
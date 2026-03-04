#!/bin/bash
# sync-ha-config.sh
# Pushes Home Assistant config changes to GitHub, then pull on the Pi

set -e

GITHUB_REPO="https://github.com/btotharye/homeassistant-config"
PI_HOST="192.168.1.33"
PI_USER="pi"
PI_CONFIG_PATH="/config"  # Adjust if needed (e.g., /home/pi/home-assistant/config for Docker)

echo "🔄 Syncing Home Assistant config to GitHub..."

# Stage changes
git add -A

# Check if there's anything to commit
if git diff --cached --quiet; then
    echo "✅ No changes to sync."
    exit 0
fi

# Commit
read -p "📝 Commit message: " msg
git commit -m "$msg"

# Push to GitHub
echo "📤 Pushing to GitHub..."
git push origin HEAD:add-energy-dashboard
echo ""
echo "⚠️  Note: Your repo requires pull requests on main."
echo "📌 Create a PR at: https://github.com/btotharye/homeassistant-config/pulls"

echo "✅ Pushed to GitHub!"
echo ""

# Optional: Pull on the Pi
read -p "🔗 Pull changes on the Pi? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "📥 Pulling on the Pi..."
    ssh ${PI_USER}@${PI_HOST} "cd ${PI_CONFIG_PATH} && git pull && echo '✅ Pulled latest config'"
    
    # Optional: Restart HA
    read -p "🔄 Restart Home Assistant Core? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "Restarting HA..."
        ssh ${PI_USER}@${PI_HOST} "ha core restart"
        echo "✅ Home Assistant restarting..."
    fi
fi

echo "✅ Sync complete!"

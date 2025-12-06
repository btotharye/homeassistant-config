#!/bin/sh

# First argument = config dir; default to /config (for Home Assistant Pi)
CONFIG_DIR="${1:-/config}"

echo "Using config directory: $CONFIG_DIR"

echo "Running yamllint..."
yamllint "$CONFIG_DIR"

echo ""
echo "Home Assistant config check..."
docker run --rm \
  -v "$CONFIG_DIR":/config \
  ghcr.io/home-assistant/home-assistant:stable \
  python -m homeassistant --config /config --script check_config

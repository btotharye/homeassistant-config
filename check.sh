#!/bin/sh
yamllint .

echo ""
echo "Home Assistant config check..."
docker run --rm \
  -v /config:/config \
  ghcr.io/home-assistant/home-assistant:stable \
  python -m homeassistant --config /config --script check_config

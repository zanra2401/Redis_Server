#!/usr/bin/env bash
set -euo pipefail

if ! command -v redis-cli >/dev/null 2>&1; then
  echo "redis-cli not found. Install redis-tools, for example:"
  echo "  sudo apt-get update && sudo apt-get install -y redis-tools"
  exit 1
fi

echo "Testing Redis connection..."

echo "Pinging Redis..."
if redis-cli ping >/dev/null 2>&1; then
  echo "Redis is running properly!"
  echo
  echo "Pub/Sub channels:"
  redis-cli PUBSUB CHANNELS
  echo
  echo "Active clients:"
  redis-cli CLIENT LIST
else
  echo "Redis is not running. Start it first using ./start-redis.sh"
  exit 1
fi

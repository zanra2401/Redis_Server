#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
CONF_PATH="$SCRIPT_DIR/redis.conf"

if ! command -v redis-server >/dev/null 2>&1; then
  echo "redis-server not found. Install it first, for example:"
  echo "  sudo apt-get update && sudo apt-get install -y redis-server redis-tools"
  exit 1
fi

if [ ! -f "$CONF_PATH" ]; then
  echo "redis.conf not found at $CONF_PATH"
  exit 1
fi

echo "Starting Redis using $CONF_PATH"
echo "Press Ctrl+C to stop"

exec redis-server "$CONF_PATH"

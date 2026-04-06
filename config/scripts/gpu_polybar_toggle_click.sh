#!/bin/bash

STATE_FILE="$HOME/.cache/polybar_gpu_mode"

mkdir -p "$HOME/.cache"

current=$(cat "$STATE_FILE" 2>/dev/null)

if [ "$current" = "both" ]; then
    echo "single" > "$STATE_FILE"
else
    echo "both" > "$STATE_FILE"
fi
#!/bin/bash

STATE_FILE="$HOME/.cache/polybar_gpu_mode"

mkdir -p "$HOME/.cache"
[ -f "$STATE_FILE" ] || echo "single" > "$STATE_FILE"

mode=$(cat "$STATE_FILE" 2>/dev/null)

# AMD iGPU
igpu_raw=$(cat /sys/class/drm/card1/device/gpu_busy_percent 2>/dev/null)

# NVIDIA dGPU
dgpu_raw=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits 2>/dev/null | head -n1)

format_gpu() {
    local val="$1"

    if ! [[ "$val" =~ ^[0-9]+$ ]]; then
        echo "--"
        return
    fi

    if [ "$val" -ge 100 ]; then
        echo "%{F#ff0000}full%{F-}"
        return
    fi

    printf "%02d%%" "$val"
}

dgpu=$(format_gpu "$dgpu_raw")
igpu=$(format_gpu "$igpu_raw")

if [ "$mode" = "both" ]; then
    echo "$dgpu $igpu"
else
    echo "$dgpu"
fi
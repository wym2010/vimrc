#!/bin/bash
RECORDING_DIR="$HOME/Videos"
mkdir -p "$RECORDING_DIR"

if pgrep -x wf-recorder >/dev/null; then
    pkill -x wf-recorder
else
    geometry=$(slurp) || exit 1
    file="$RECORDING_DIR/recording_$(date +%Y%m%d_%H%M%S).mp4"
    wf-recorder -g "$geometry" -f "$file" &
fi

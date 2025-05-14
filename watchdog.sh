#!/bin/bash

CONTAINER_NAME="vlc_stream"
LOG_FILE="/var/log/watchdog.log"

while true; do
    if docker logs --tail=15 "$CONTAINER_NAME" 2>&1 | grep -E -q "TEARDOWN|main stream error|nothing to play"; then
        echo "$(date -u '+%Y-%m-%d %H:%M:%S UTC') Detectado 'TEARDOWN' ou 'main stream error', reiniciando o container..."
        echo "$(date -u '+%Y-%m-%d %H:%M:%S UTC') - Reiniciando container $CONTAINER_NAME devido a erro" >> "$LOG_FILE"
        docker restart "$CONTAINER_NAME"
        sleep 15
    fi
    sleep 10
done

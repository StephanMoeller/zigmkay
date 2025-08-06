#!/bin/bash
clear
set -e  # Exit on any error

echo "Building firmware..."
zig build

MOUNT_POINT="/run/media/stephan/RPI-RP2"
FIRMWARE="zig-out/firmware/blinky.uf2"
TARGET="$MOUNT_POINT/blinky.uf2"

echo "Waiting for USB drive to appear at $MOUNT_POINT..."
while [ ! -d "$MOUNT_POINT" ]; do
    sleep 0.5
done

echo "USB drive detected. Copying firmware..."
cp "$FIRMWARE" "$TARGET"
echo "Firmware copied to $TARGET"


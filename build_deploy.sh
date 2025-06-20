#!/bin/bash
zig build
cp zig-out/firmware/blinky.uf2 /media/stephan/RPI-RP2/blinky.uf2

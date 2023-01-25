#!/bin/sh
xrandr \
    --output DP-3 --mode 1920x1200 --pos 0x0 --rotate normal \
    --output DP-1 --mode 2560x1440 --pos 1920x0 --rotate normal --primary \
    --output eDP-1 --mode 1920x1080 --pos 4480x0 --rotate normal

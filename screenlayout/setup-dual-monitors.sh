#!/bin/sh

if test "$(hostname)" = "jesus-pc"; then
    xrandr --output DisplayPort-0 --off --output DVI-1 --primary --mode 2560x1440 --pos 1280x0 --rotate normal --output DVI-0 --mode 1280x1024 --pos 0x0 --rotate normal --output HDMI-0 --off
fi

if test "$(hostname)" = "glenn-work"; then
    xrandr --output HDMI1 --off --output DP1 --mode 1680x1050 --pos 1920x30 --rotate normal --output eDP1 --mode 1920x1080 --pos 0x0 --rotate normal
fi

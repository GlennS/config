#!/bin/sh
# Lock the screen, and turn the monitors off 2 seconds after the last input
# while it stays locked.
swayidle -w timeout 2 'swaymsg "output * power off"' resume 'swaymsg "output * power on"' &
idle_pid=$!
swaylock -c 2D718A
kill "$idle_pid"
swaymsg "output * power on"

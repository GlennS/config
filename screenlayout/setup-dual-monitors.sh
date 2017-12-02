#!/usr/bin/env sh
## This script should be run once on a new machine.

GENERATED_SCRIPT="/usr/share/lightdm-dual-monitors.sh"

echo "display-setup-script = ${GENERATED_SCRIPT}" | sudo tee --append /etc/lightdm/lightdm.conf

if test "$(hostname)" = "jesus-pc"; then
    echo "xrandr --output DisplayPort-0 --off --output DVI-1 --primary --mode 2560x1440 --pos 1280x0 --rotate normal --output DVI-0 --mode 1280x1024 --pos 0x0 --rotate normal --output HDMI-0 --off" | sudo tee "${GENERATED_SCRIPT}"
fi

if test "$(hostname)" = "glenn-laptop"; then
    echo "xrandr --output HDMI1 --off --output DP1 --mode 1680x1050 --pos 1920x30 --rotate normal --output eDP1 --mode 1920x1080 --pos 0x0 --rotate normal" | sudo tee "${GENERATED_SCRIPT}"
fi

sudo chmod u+x "${GENERATED_SCRIPT}"

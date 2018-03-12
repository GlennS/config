#!/usr/bin/env sh
## This script should be run once on a new machine.

GENERATED_SCRIPT="/usr/share/lightdm-dual-monitors.sh"

echo "display-setup-script = ${GENERATED_SCRIPT}" | sudo tee --append /etc/lightdm/lightdm.conf

echo "xrandr --output HDMI1 --off --output DP1 --mode 1680x1050 --pos 1920x30 --rotate normal --output eDP1 --mode 1920x1080 --pos 0x0 --rotate normal" | sudo tee "${GENERATED_SCRIPT}"

sudo chmod u+x "${GENERATED_SCRIPT}"

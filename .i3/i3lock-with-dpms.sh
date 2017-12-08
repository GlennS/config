#!/bin/sh
# DPMS is X's thing for putting monitors into power saving modes
revert() {
    xset dpms 0 0 0
}
trap revert SIGHUP SIGINT SIGTERM
xset +dpms dpms 2 2 2
i3lock -n --color=2D718A
revert

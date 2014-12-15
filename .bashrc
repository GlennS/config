# This is for Windows, because it is rubbish.

[ -z "$PS1" ] && return
eval `ssh-agent -s`
ssh-add ~/.ssh/versioncontrol.private.openssh

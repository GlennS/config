[ -z "$PS1" ] && exit

if [[ $(pgrep ssh-agent) = "" ]]; then
    eval `ssh-agent -s`
    ssh-add ~/.ssh/versioncontrol.private.openssh
fi

alias pullall="git -C ~/.ssh pull && git -C ~/work pull && git -C ~/notes pull && git -C ~/config pull"
alias config="git --git-dir=$HOME/config.git/ --work-tree=$HOME"

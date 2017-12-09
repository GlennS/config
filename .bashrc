[ -z "$PS1" ] && exit

if [[ $(uname -s) = "MINGW64_NT-10.0" ]]; then
    eval `ssh-agent -s`
    ssh-add ~/.ssh/versioncontrol.private.openssh
	alias emacs="HOME='C:/Users/Glenn' 'C:/Program Files/emacs/bin/runemacs'"
fi

alias config="git --git-dir=$HOME/config.git/ --work-tree=$HOME"
alias pullall="git -C ~/.ssh pull && git -C ~/work pull && git -C ~/notes pull && config pull"

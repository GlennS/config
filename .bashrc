[ -z "$PS1" ] && exit

if [[ $(uname -s) = "MINGW64_NT-10.0" ]]; then
    eval `ssh-agent -s`
    ssh-add ~/.ssh/versioncontrol.private.openssh
    alias emacs="HOME='$env:HOME' 'C:/Program Files/emacs/bin/runemacs'"

    cd ~
fi

alias config="git --git-dir=$HOME/config.git/ --work-tree=$HOME"
alias pullall='for repo in ".ssh" "cammy" "notes"; do git -C "${HOME}/${repo}" pull; done; config pull'
alias sqlite_cammy="sqlite3 $env:CAMMY_DB"

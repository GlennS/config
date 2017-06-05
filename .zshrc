source .profile

# My custom function path
fpath=(~/config/.zsh/functions $fpath)

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall - which is something to do with zsh?
zstyle :compinstall filename '/home/glenn/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source ~/config/.zsh/git_prompt.zsh;
source ~/config/.zsh/keys.zsh

export PS1='[%n@%m:%/] ';

## A command remake which removes a file, and then defers to make.
remake() { rm "$@"; make "$@" }
alias feh='feh --scale-down'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias pullall="git -C ~/.ssh pull && git -C ~/work pull && git -C ~/notes pull && git -C ~/config pull"

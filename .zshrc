if [[ $TERM == "dumb" ]]; then
    ## We're probably using Emacs Tramp
    unsetopt zle
    unsetopt prompt_cr
    unsetopt prompt_subst
    if whence -w precmd >/dev/null; then
	unfunction precmd
    fi
    if whence -w preexec >/dev/null; then
	unfunction preexec
    fi
    PS1='> '
    return
fi

source .profile

source $HOME/nix-zsh-completions/nix.plugin.zsh

# My custom function path
fpath=(~/.zsh/functions $HOME/nix-zsh-completions $HOME/.nix-profile/share/zsh/site-functions $fpath)

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

source ~/.zsh/git_prompt.zsh;
source ~/.zsh/keys.zsh

export PS1="%{$fg[cyan]%}[%n@%m:%/] %{$reset_color%}";

## A command remake which removes a file, and then defers to make.
remake() { rm "$@"; make "$@" }
alias feh='feh --scale-down'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias pullall='for repo in ".ssh" "cammy" "notes"; do git -C "${repo}" pull; done; config pull'
alias config='git --git-dir=$HOME/config.git/ --work-tree=$HOME'
alias spatialite='rlwrap spatialite'
alias sqlite3='rlwrap sqlite3'

# Direnv
eval "$(direnv hook zsh)"

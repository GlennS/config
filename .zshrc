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

source $HOME/.profile

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

source ~/.zsh/keys.zsh

setopt prompt_subst
autoload -U colors && colors # Enable colors in prompt

autoload -Uz vcs_info
zstyle ':vsc_info:*' enable git

zstyle ':vcs_info:*' actionformats '%b|%a'
zstyle ':vcs_info:*' formats       '%b'

zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b:%r'

precmd () {
    vcs_info

    PS1='%F{yellow}%3~ %F{cyan}> %f'

    if [[ -n ${vcs_info_msg_0_} ]]; then
        STATUS=$(command git status --porcelain 2> /dev/null | tail -n1)
        if [[ -n $STATUS ]]; then
            RPS1='%F{red}${vcs_info_msg_0_}%f'
        else
            RPS1='%F{green}${vcs_info_msg_0_}%f'
        fi
    else
        # nothing from vcs_info
        RPS1=''
    fi
}


## A command remake which removes a file, and then defers to make.
remake() { rm "$@"; make "$@" }
alias feh='feh --scale-down'
alias ls='exa'
alias grep='grep --color=auto'
alias pullall='for repo in ".ssh" "octopus" "notes" ".password-store"; do echo "Pulling ${repo}"; git -C "/home/glenn/${repo}" pull; done; config pull'
alias config='git --git-dir=$HOME/config.git/ --work-tree=$HOME'
alias spatialite='rlwrap spatialite'
alias sqlite3='rlwrap sqlite3'
alias nectr="INVOKE_CLIENT='nectr' inv --search-root=/home/glenn/octopus/repos/octodev -f  /home/glenn/octopus/repos/octodev/invoke.override.yml"
alias origin="INVOKE_CLIENT='origin' inv --search-root=/home/glenn/octopus/repos/octodev -f  /home/glenn/octopus/repos/octodev/invoke.override.yml"
alias aws-nectr-prod="AWS_PROFILE='nectr-prod-developer' aws"
alias aws-nectr-test="AWS_PROFILE='nectr-test-developer' aws"
alias aws-origin-prod="AWS_PROFILE='origin-prod-developer' aws"
alias aws-origin-test="AWS_PROFILE='origin-test-developer' aws"
alias aws-connect-nectr-prod="aws-connect -n consumerworker -p nectr-prod-session"
alias aws-connect-nectr-test="aws-connect -n consumerworker -p nectr-test-developer"
alias aws-connect-origin-prod="aws-connect -n consumerworker -p origin-prod-session"
alias aws-connect-origin-test="aws-connect -n consumerworker -p origin-test-developer"


# Direnv
eval "$(direnv hook zsh)"

. ~/.zsh/functions/invoke.zsh-completion


# FZF Key Bindings
FZF_BINDINGS="/home/glenn/.nix-profile/share/fzf/key-bindings.zsh"

if [[ -f "${FZF_BINDINGS}" ]]; then
    . "${FZF_BINDINGS}"
    # I don't like fzf overriding Ctrl-T for it's file widget.
    bindkey '^F' fzf-file-widget
    bindkey '^T' transpose-chars
fi

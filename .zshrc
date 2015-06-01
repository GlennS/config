# My custom function path
fpath=(~/config/.zsh/functions $fpath)

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/glenn/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export PATH=$PATH:~/.cabal/bin
source ~/.zsh/git_prompt.zsh

export PS1='[%n@%m:%/] '
export _JAVA_AWT_WM_NONREPARENTING=1


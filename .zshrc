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

export EDITOR='emacsclient -a emacs';

source ~/config/.zsh/git_prompt.zsh;

export PS1='[%n@%m:%/] ';
export _JAVA_AWT_WM_NONREPARENTING=1;

## Prevent ctrl + S from locking my terminal.
stty -ixon;

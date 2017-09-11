export PATH="$HOME/bin:$HOME/.nix-profile/bin:$PATH"
export EDITOR='emacsclient -a emacs'
export GTK_THEME=Albatross
export _JAVA_AWT_WM_NONREPARENTING=1
export LS_COLORS=$LS_COLORS:'di=35:or=31'

## Prevent ctrl + S from locking my terminal.
stty -ixon

. /home/glenn/.nix-profile/etc/profile.d/nix.sh

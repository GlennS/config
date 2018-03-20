export PATH="$HOME/bin:$HOME/.nix-profile/bin:$PATH"
export NIX_SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
export NIX_CHANNELS="$HOME/.nix-defexpr/channels"
export NIX_PATH="nixos1709=$NIX_CHANNELS/nixos1709"
export NIX_LINK=$HOME/.nix-profile
export EDITOR='emacsclient -a emacs'
export GTK_THEME=Albatross
export _JAVA_AWT_WM_NONREPARENTING=1
export LS_COLORS=$LS_COLORS:'di=35:or=31'

## Prevent ctrl + S from locking my terminal.
stty -ixon

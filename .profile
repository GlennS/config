export PATH="$HOME/bin:$HOME/.nix-profile/bin:$PATH:$HOME/.local/bin"
export NIX_SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
export NIX_CHANNELS="$HOME/.nix-defexpr/channels"
export SSH_AUTH_SOCK=/run/user/1000/gnupg/S.gpg-agent.ssh

NIX_PATH=""
for CHANNEL in "$NIX_CHANNELS"/*; do
    if [[ -d "${CHANNEL}" ]]; then
        export NIX_PATH="$NIX_PATH:$(basename $CHANNEL)=${CHANNEL}"
    fi
done

export NIX_LINK=$HOME/.nix-profile
export EDITOR='emacsclient -a emacs'
export GTK_THEME=Albatross
export _JAVA_AWT_WM_NONREPARENTING=1
export LS_COLORS=$LS_COLORS:'di=35:or=31'

## Prevent ctrl + S from locking my terminal.
stty -ixon

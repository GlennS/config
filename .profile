export EDITOR='emacsclient -a emacs'
export GTK_THEME=Albatross
export _JAVA_AWT_WM_NONREPARENTING=1
export LS_COLORS=$LS_COLORS:'di=35:or=31'

if [ -e /home/glenn/.nix-profile/etc/profile.d/nix.sh ]; then . /home/glenn/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# Set $SSH_AUTH_SOCK
# if [ -n "$DESKTOP_SESSION" ];then
#     for env_var in $(gnome-keyring-daemon --start); do
#         export env_var
#     done
# fi

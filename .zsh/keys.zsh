# Ctrl keys move the cursor forward and backward one word
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# Alt keys do the same, because that's the behaviour in Emacs
bindkey '^[[1;3C' forward-word
bindkey '^[[1;3D' backward-word

# Alt + delete kills a word forward
bindkey '^[[3;3~' kill-word
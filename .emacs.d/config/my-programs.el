(setq browse-url-browser-function (quote browse-url-firefox))
(setq image-dired-external-viewer "/usr/bin/feh")

;; Include Nix binaries
(setq exec-path
      (append exec-path
              '("/home/glenn/.nix-profile/bin")))

;; When we move into a buffer with a .envrc file, use it to set our environment and executable paths. Magic.
(direnv-mode)

(provide `my-programs)

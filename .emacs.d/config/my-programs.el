(setq browse-url-browser-function (quote browse-url-firefox))
(setq image-dired-external-viewer "/usr/bin/feh")

;; Include Nix binaries
(setq exec-path
      (append exec-path
              '("/home/glenn/.nix-profile/bin")))


(provide `my-programs)

(load-theme 'wombat t)

(setq display-time-mode nil)

(setq custom-safe-themes '("19352d62ea0395879be564fc36bc0b4780d9768a964d26dfae8aad218062858d" default))

(tool-bar-mode -1)

(setq split-height-threshold nil) ;; Never split top-and-bottom
(setq split-width-threshold 160) ;; Split left-and-right at the normal rate.

(set-face-attribute 'default nil
                    :family "DejaVu Sans Mono"
                    :height 130
                    :background "#242424"
                    :foreground "#f6f3e8")

(provide 'my-theme)

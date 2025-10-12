;; --- smartparens Configuration ---
(use-package smartparens
  ;; 1. Automatically enable smartparens in a list of mode hooks.
  ;; Note: 'java-mode' is a major mode function, but 'java-mode-hook' is the correct hook.
  ;; use-package is smart enough to accept the function name and find its hook.
  :hook ((clojure-mode
          ess-mode
          js2-mode
          lisp-mode
          lisp-interaction-mode
          java-mode) . smartparens-mode)

  ;; 2. Consolidate all keybindings using the :bind-keymap keyword.
  ;; This ensures they are only set once 'smartparens' is loaded.
  :bind (:map smartparens-mode-map
              ("M-<left>" . sp-backward-sexp)
              ("M-<right>" . sp-forward-sexp)
              ("M-<up>" . sp-up-sexp)
              ("M-<down>" . sp-down-sexp)
              ("S-M-<left>" . sp-backward-slurp-sexp)
              ("S-M-<right>" . sp-forward-slurp-sexp)
              ("S-M-<up>" . sp-backward-barf-sexp)
              ("S-M-<down>" . sp-forward-barf-sexp)
              ("C-M-w" . sp-copy-sexp)
              ("C-M-k" . sp-kill-sexp)
              ("C-c C-M-SPC" . sp-select-next-thing)))

;; --- Rainbow Delimiters Configuration ---

(use-package rainbow-delimiters
  ;; 1. Automatically enable rainbow-delimiters whenever smartparens is active.
  :hook (smartparens-mode . rainbow-delimiters-mode)

  ;; 2. Customizations go into the :config block, which runs after the package loads.
  :config
  ;; Rainbow delimiters unmatched pairs should look really obvious
  (set-face-attribute 'rainbow-delimiters-unmatched-face nil
                      :inherit 'error
                      :strike-through t)

  ;; Colours for rainbow delimiters
  ;; Taken from d3.js scheme set 1, with the grey and brown removed
  ;; https://github.com/d3/d3-scale-chromatic
  ;; https://github.com/d3/d3-scale-chromatic/blob/master/src/categorical/Set1.js
  (let ((colours '("#e41a1c" "#377eb8" "#4daf4a" "#984ea3" "#ff7f00" "#ffff33" "#f781bf"))
        (i 1))
    (dolist (c colours)
      (set-face-attribute (intern (format "rainbow-delimiters-depth-%d-face" i))
                          nil
                          :foreground c)
      (cl-incf i))
    ;; Set the maximum count based on the number of colors provided.
    (setq rainbow-delimiters-max-face-count (1- i))))

(provide 'my-delimiters)

;; Turn on smartparents mode for all these languages
(add-hook 'clojure-mode-hook #'smartparens-mode)
(add-hook 'ess-mode-hook #'smartparens-mode)
(add-hook 'js2-mode-hook #'smartparens-mode)
(add-hook 'lisp-mode-hook #'smartparens-mode)
(add-hook 'lisp-interaction-mode-hook #'smartparens-mode)
(add-hook 'java-mode #'smartparens-mode)

;; Some key bindings for working with delimiters
(define-key smartparens-mode-map (kbd "M-<left>") 'sp-backward-sexp)
(define-key smartparens-mode-map (kbd "M-<right>") 'sp-forward-sexp)
(define-key smartparens-mode-map (kbd "M-<up>") 'sp-up-sexp)
(define-key smartparens-mode-map (kbd "M-<down>") 'sp-down-sexp)

(define-key smartparens-mode-map (kbd "S-M-<left>") 'sp-backward-slurp-sexp)
(define-key smartparens-mode-map (kbd "S-M-<right>") 'sp-forward-slurp-sexp)
(define-key smartparens-mode-map (kbd "S-M-<up>") 'sp-backward-barf-sexp)
(define-key smartparens-mode-map (kbd "S-M-<down>") 'sp-forward-barf-sexp)

(define-key smartparens-mode-map (kbd "C-M-w") 'sp-copy-sexp)
(define-key smartparens-mode-map (kbd "C-M-k") 'sp-kill-sexp)
(define-key smartparens-mode-map (kbd "C-c C-M-SPC") 'sp-select-next-thing)

;; Smart parens mode turns on rainbow delimiters
(require 'rainbow-delimiters)
(add-hook 'smartparens-mode-hook #'rainbow-delimiters-mode)

;; Rainbow delimiters unmatched pairs should look really obvious
(set-face-attribute 'rainbow-delimiters-unmatched-face nil
                    :foreground 'unspecified
                    :inherit 'error
                    :strike-through t)

;; Colours for rainbow delimiters
;; Taken from d3.js scheme set 1, with the grey and brown removed
;; https://github.com/d3/d3-scale-chromatic
;; https://github.com/d3/d3-scale-chromatic/blob/master/src/categorical/Set1.js
(let ((colours '("#e41a1c" "#377eb8" "#4daf4a" "#984ea3" "#ff7f00" "#ffff33" "#f781bf"))
      (i 1)
      )
  (dolist (c colours)

    (set-face-attribute (intern (format "rainbow-delimiters-depth-%d-face" i))
                        nil
                        :foreground c)

    (cl-incf i)
    )
  (setq rainbow-delimiters-max-face-count (- i 1)))

(provide `my-delimiters)

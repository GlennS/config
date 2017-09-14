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

;; Saturated colours for rainbow delimiters
(require 'color)
(cl-loop
 for index from 1 to rainbow-delimiters-max-face-count
 do
 (let ((face (intern (format "rainbow-delimiters-depth-%d-face" index))))
   (cl-callf color-saturate-name (face-foreground face) 100)))

(provide `my-delimiters)

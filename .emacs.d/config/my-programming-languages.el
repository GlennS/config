;;; Everything
(dumb-jump-mode)

;;; JavaScript
(setq js-indent-level 2)
(setq js-expr-indent-offset 2)

;; Use Flycheck instead of js2/rjsx for error checking.
(setq js2-mode-show-parse-errors nil)
(setq js2-mode-show-strict-warnings nil)
(add-hook 'rjsx-mode-hook #'flycheck-mode)

;; Don't add newlines when writing JavaScript
(add-hook 'js-mode-hook
          (lambda ()
            (set (make-local-variable 'require-final-newline)
                 nil)))

(add-to-list 'auto-mode-alist '("\\.js$" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . rjsx-mode))

;; Use web-mode for editing web things and ReportLab templates
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.rml$" . web-mode))

(setq web-mode-markup-indent-offset 4)
(setq web-mode-css-indent-offset 4)
(setq web-mode-code-indent-offset 4)

(setq web-mode-engines-alist
      '(("django" . "\\.html\\'")
        ("django" . "\\.rml\\'")))

;;; Clojure
;; Auto-complete for Clojure
(add-hook 'clojure-mode-hook #'cider-mode)
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)

(setq cider-cljs-lein-repl ; Make ClojureScript + Figwheel + Cider work
      "(do (use 'figwheel-sidecar.repl-api) (start-figwheel!) (cljs-repl))")

;;; SQL
;; https://github.com/alex-hhh/emacs-sql-indent
(add-hook 'sql-mode-hook 'sqlind-minor-mode)

;;; Python
(add-hook 'python-mode-hook 'eglot-ensure)
(add-hook 'python-mode-hook #'company-mode)
(setq python-indent-guess-indent-offset nil)

(require `blacken)
(setq blacken-allow-py36 :t)
(add-hook 'python-mode-hook 'blacken-mode)

(require `isortify)
(add-hook 'python-mode-hook 'isortify-mode)

;;; Latex
(add-hook 'latex-mode-hook '(lambda () (flymake-mode)))

;;; Nix
(setq nix-indent-function (quote nix-indent-line))

;;; Terraform
(add-hook `terraform-mode-hook #'flycheck-mode)

;;; Finish
(provide `my-programming-languages)

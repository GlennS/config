;;; JavaScript
(setq js-indent-level 2)
(setq js-expr-indent-offset 4)


;; Don't add newlines when writing JavaScript
(add-hook 'js-mode-hook
          (lambda ()
            (set (make-local-variable 'require-final-newline)
                 nil)))

;;; Languages for given file extensions
(add-to-list 'auto-mode-alist '("\\.js$" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php$" . web-mode))
(add-hook 'clojure-mode-hook #'cider-mode)

;;; Clojure
;; Auto-complete for Clojure
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)

(setq cider-cljs-lein-repl ; Make ClojureScript + Figwheel + Cider work
      "(do (use 'figwheel-sidecar.repl-api) (start-figwheel!) (cljs-repl))")

;;; SQL
;; https://github.com/alex-hhh/emacs-sql-indent
(add-hook 'sql-mode-hook 'sqlind-minor-mode)

;;; Python
;; Use flymake
(add-hook 'python-mode-hook '(lambda () (flymake-mode)))

;;; Latex
(add-hook 'latex-mode-hook '(lambda () (flymake-mode)))

;;; Finish
(provide `my-programming-languages)

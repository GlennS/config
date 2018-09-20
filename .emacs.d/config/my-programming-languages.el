;;; JavaScript
(setq js-indent-level 2)
(setq js-expr-indent-offset 4)


;; Don't add newlines when writing JavaScript
(add-hook 'js-mode-hook
          (lambda ()
            (set (make-local-variable 'require-final-newline)
                 nil)))

;;; National Household Model scripting language
(define-derived-mode nhm-mode lisp-mode "nhm"
  "Major mode for the NHM"
  (set (make-local-variable 'font-lock-defaults)
       '((
	  ("\\w+:" . font-lock-keyword-face)
	  ("\\[" . font-lock-constant-face)
	  ("\\]" . font-lock-constant-face)
	  ("(\\(\\w+\\)" 1 font-lock-function-name-face)
	  )
	 nil ;only kw
	 nil ; case fold
	 (("-.+-/*"."w")) ; syntax table
	 backward-paragraph))
  )

;;; Languages for given file extensions
(add-to-list 'auto-mode-alist '("\\.nhm$" . nhm-mode))
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

;;; Finish
(provide `my-programming-languages)

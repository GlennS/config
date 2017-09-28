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

(add-to-list 'auto-mode-alist '("\\.nhm$" . nhm-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.php$" . web-mode))
(add-hook 'clojure-mode-hook #'cider-mode)

(setq cider-cljs-lein-repl ; Make ClojureScript + Figwheel + Cider work
      "(do (use 'figwheel-sidecar.repl-api) (start-figwheel!) (cljs-repl))")

(provide `my-programming-languages)

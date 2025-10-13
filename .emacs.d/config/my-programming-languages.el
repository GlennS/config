;;; --- Global/Everything ---
(use-package dumb-jump
  :config
  (dumb-jump-mode 1))

;;; --- JavaScript (js2-mode, rjsx-mode) ---
(use-package js2-mode
  :defer t
  :mode ("\\.js\\'"))

(use-package rjsx-mode
  :defer t
  :config
  ;; Indentation settings for js2/rjsx
  (setq js-indent-level 2
        js-expr-indent-offset 2)

  ;; Use Flycheck instead of js2/rjsx for error checking.
  (setq js2-mode-show-parse-errors nil
        js2-mode-show-strict-warnings nil)


  :hook (('rjsx-mode . 'flycheck-mode) ; Use Flycheck instead of js2/rjsx for error checking.
         ('js-mode . #'(lambda () ; Don't add newlines when writing JavaScript
                         (set (make-local-variable 'require-final-newline)
                              nil))))


  ;; Associate rjsx-mode with .js and .jsx files
  :mode (("\\.js\\'" . rjsx-mode)
         ("\\.jsx\\'" . rjsx-mode)))

;;; --- Web Modes (HTML, PHP, ReportLab/RML) ---
(use-package web-mode
  :defer t
  :config
  ;; Set indentation offsets
  (setq web-mode-markup-indent-offset 4
        web-mode-css-indent-offset 4
        web-mode-code-indent-offset 4)

  ;; Custom engine configuration
  (setq web-mode-engines-alist
        '(("django" . "\\.html\\'")
          ("django" . "\\.rml\\'")))

  ;; Associate web-mode with files
  :mode (("\\.html\\'" . web-mode)
         ("\\.php\\'" . web-mode)
         ("\\.rml\\'" . web-mode)))

;;; --- Clojure ---
(use-package cider
  :defer t
  :hook ((clojure-mode . cider-mode)
         (cider-repl-mode . company-mode)
         (cider-mode . company-mode))
  :config
  ;; Make ClojureScript + Figwheel + Cider work
  (setq cider-cljs-lein-repl
        "(do (use 'figwheel-sidecar.repl-api) (start-figwheel!) (cljs-repl))"))

;;; --- SQL ---
(use-package sql-indent
  :defer t
  :hook (sql-mode . sqlind-minor-mode))

;;; --- Python ---
(use-package python
  :defer t
  :config
  (setq python-indent-guess-indent-offset nil))

(use-package eglot
  :defer t
  :hook (python-mode . eglot-ensure)
  :config
  (setq-default eglot-workspace-configuration
    '(:pylsp
      (:plugins
        (:pylsp_mypy
          (:enabled t))))))

(use-package company
  :defer t
  :hook (python-mode . company-mode))

(use-package ruffify
  :defer t
  :no-require t ; Tell use-package to just load the file, don't use 'require'
  :ensure nil   ; Overrides the global always-ensure for this package
  :hook (python-mode . ruffify-mode))

;;; --- Latex ---
;; Flymake is built-in; no use-package needed for the hook.
(add-hook 'latex-mode-hook #'(lambda () (flymake-mode)))

;;; --- Nix ---
(use-package nix-mode
  :defer t
  :config
  (setq nix-indent-function 'nix-indent-line))

;;; --- Terraform ---
(use-package terraform-mode
  :defer t
  :hook (terraform-mode . flycheck-mode))

;;; Finish
(provide 'my-programming-languages)

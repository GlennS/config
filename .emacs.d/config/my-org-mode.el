(setq org-todo-keywords
      '((sequence "BLOCKED" "IN-PROGRESS" "TODO" "|" "DONE" "FAILED")))

(setq org-export-with-toc nil)

(setq org-babel-load-languages
      (quote ((awk . t)
              (dot . t)
              (R . t)
              (python . t)
              (ruby . t)
              (js . t)
              (ipython . t)
              )))

(setq org-confirm-babel-evaluate nil)

(setq org-export-backends
      (quote (ascii
              beamer
              html
              icalendar
              latex
              md
              texinfo)))

(global-set-key (kbd "C-c a") 'org-agenda)

;; Use rjsx instead of js-mode for JavaScript.
(add-hook `org-mode-hook (lambda () (add-to-list `org-src-lang-modes `("js" . rjsx))))

;; org-mode latex export using XeLaTeX
(setq TeX-engine 'xetex)
(setq org-latex-pdf-process '("xelatex --shell-escape -interaction nonstopmode -output-directory %o %f"))

;; Some sensible latex defaults for org-mode export
(setq org-latex-packages-alist '(("" "parskip" nil)
                                 ("margin=2cm" "geometry" nil)))

(setq python-shell-interpreter "python3")

(provide `my-org-mode)

(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "|" "BLOCKED" "|" "DONE")))

(setq org-babel-load-languages
      (quote ((awk . t)
              (dot . t)
              (R . t)
              (python . t))))

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

(add-hook 'org-mode-hook #'writegood-mode)

;; org-mode latex export using XeLaTeX
(setq TeX-engine 'xetex)
(setq org-latex-pdf-process '("xelatex --shell-escape -interaction nonstopmode -output-directory %o %f"))

;; Some sensible latex defaults for org-mode export
(setq org-latex-packages-alist '(("" "parskip" nil)
                                 ("margin=2cm" "geometry" nil)))

(provide `my-org-mode)

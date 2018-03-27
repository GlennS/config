(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "|" "BLOCKED" "|" "DONE")))

(setq org-babel-load-languages
      (quote ((awk . t)
              (dot . t)
              (R . t))))

(setq org-confirm-babel-evaluate nil)

(setq org-export-backends
      (quote (ascii
              beamer
              html
              icalendar
              latex
              md
              texinfo)))

(setq org-latex-pdf-process
      (quote
       ("latexmk -pdflatex='xelatex --shell-escape -interaction nonstopmode -output-directory %o' -pdf -f %f")))

(global-set-key (kbd "C-c a") 'org-agenda)

(add-hook 'org-mode-hook #'writegood-mode)

(setq TeX-engine 'xetex)

(setq org-latex-pdf-process '("xelatex --shell-escape -interaction nonstopmode -output-directory %o %f"))

(provide `my-org-mode)

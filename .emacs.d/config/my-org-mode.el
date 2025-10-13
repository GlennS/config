(use-package org
  :init
  ;; Set the global keybinding for the Agenda.
  (global-set-key (kbd "C-c a") 'org-agenda)

  :config
  ;; Define the custom TODO keyword sequence.
  (setq org-todo-keywords
        '((sequence "BLOCKED" "IN-PROGRESS" "TODO" "|" "DONE" "FAILED")))

  ;; --- Export Configuration ---
  ;; Disable the Table of Contents on export.
  (setq org-export-with-toc nil)

  ;; Explicitly declare which backends are active.
  (setq org-export-backends
        '(ascii beamer html icalendar latex md texinfo))

  ;; Configure LaTeX export settings for XeLaTeX and common packages.
  (setq
    TeX-engine 'xetex
    org-latex-pdf-process '("xelatex --shell-escape -interaction nonstopmode -output-directory %o %f")
    org-latex-packages-alist '(
      ;; Do not indent paragraphs, use vertical space between them.
      ("" "parskip" nil)
      ;; Set the page margins to 2cm.
      ("margin=2cm" "geometry" nil))))

;; IPython disabled, because it seems to be broken
;; (use-package ob-ipython
;;   :after org
;;   :config
;;   ;; Add ipython to the list of languages loaded by Org Babel.
;;   ;; This ensures it's initialized and ready to execute source blocks.
;;   (org-babel-do-load-languages
;;     'org-babel-load-languages
;;     '((python . t)
;;       (ipython . t)))

;;   (setq python-shell-interpreter "python3"))

(eval-after-load 'org-babel
  '(progn
     ;; Suppress the confirmation prompt before evaluating Babel source blocks.
     (setq org-confirm-babel-evaluate nil)

     ;; Use rjsx for JavaScript source blocks instead of the default js-mode.
     ;; This function is now guaranteed to be defined.
     (org-babel-set-lang-mode "js" 'rjsx-mode)

     ;; Configure Org Babel (Source Code Execution)
     (org-babel-do-load-languages
       'org-babel-load-languages
       '((awk . t)
         (dot . t)
         (R . t)
         (ruby . t)
         (js . t)))))

;; Needed for markdown export
(eval-after-load 'org
  '(require 'ox-md))

(provide 'my-org-mode)

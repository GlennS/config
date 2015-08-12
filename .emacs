(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(backup-directory-alist (quote (("." . "~/backups"))))
 '(custom-enabled-themes (quote (wombat)))
 '(display-time-24hr-format t)
 '(display-time-day-and-date t)
 '(display-time-mode t)
 '(global-rainbow-delimiters-mode t)
 '(haskell-mode-hook (quote (turn-on-haskell-indent)))
 '(ido-mode (quote both) nil (ido))
 '(initial-buffer-choice "~/work/todo.org")
 '(nxml-slash-auto-complete-flag t)
 '(org-agenda-files (quote ("~/work/todo.org")))
 '(org-babel-load-languages (quote ((awk . t) (dot . t))))
 '(org-confirm-babel-evaluate nil)
 '(org-export-backends (quote (ascii beamer html icalendar latex md texinfo)))
 '(org-latex-pdf-process
   (quote
    ("latexmk -pdflatex='xelatex --shell-escape -interaction nonstopmode -output-directory %o' -pdf -f %f")))
 '(org-latex-to-pdf-process
   (quote
    ("latexmk -pdflatex='xelatex --shell-escape -interaction nonstopmode -output-directory %o' -pdf -f %f")))
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.milkbox.net/packages/"))))
 '(safe-local-variable-values (quote ((org-latex-listings . t))))
 '(vc-follow-symlinks nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(global-visual-line-mode 1)

(server-start)
(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)
(setq make-backup-files "~/.saves")
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-S-<insert>") 'yank)
(add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))
(add-to-list 'auto-mode-alist (cons (rx ".php" eos) 'php-mode))

(tool-bar-mode -1)

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

(defun kill-other-buffers ()
  "Kill all other buffers [http://emacswiki.org/emacs/KillingBuffers#toc2]."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))


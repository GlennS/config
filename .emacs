(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-directory-alist (quote (("." . "~/backups"))))
 '(custom-enabled-themes (quote (wombat)))
 '(global-rainbow-delimiters-mode t)
 '(ido-mode (quote both) nil (ido))
 '(initial-buffer-choice "~/Dropbox/CSE/todo_work.org")
 '(nxml-slash-auto-complete-flag t)
 '(org-export-backends (quote (ascii html icalendar latex texinfo)))
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.milkbox.net/packages/"))))
 '(safe-local-variable-values (quote ((org-latex-listings . t)))))

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
(global-set-key (kbd "C-S-<insert>") 'yank)
(add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))
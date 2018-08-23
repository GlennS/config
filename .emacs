
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path
             (expand-file-name "config" user-emacs-directory))

(require 'my-backups)
(require 'my-org-agenda-files)
(require 'my-org-mode)
(require 'my-markdown)
(require 'my-programs)
(require 'my-theme)
(require 'my-editing)
(require 'my-dired)
(require 'my-magit)
(require 'my-programming-languages)
(require 'my-delimiters)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ido-auto-merge-delay-time 3)
 '(ido-mode (quote both) nil (ido))
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.milkbox.net/packages/"))))
 '(package-enable-at-startup nil)
 '(tramp-default-method "ssh"))

;; TODO: move this into my-theme.el?
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#242424" :foreground "#f6f3e8" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "GNU " :family "DejaVu Sans Mono")))))

(defun kill-other-buffers ()
  "Kill all other buffers [http://emacswiki.org/emacs/KillingBuffers#toc2]."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

;; Remove an annoying prompt when killing buffers opened with emacsclient
(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)

;; Launch an Emacs server
(server-start)

(provide `.emacs)
;;; .emacs ends here

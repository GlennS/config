;;; .emacs

;; When Emacs asks us to customize stuff, here's where it goes
(setq custom-file "~/.emacs.d/config/custom.el")

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(add-to-list 'load-path
             (expand-file-name "config" user-emacs-directory))

(require 'my-backups)
(require 'my-file-find)
(require 'my-org-agenda-files)
(require 'my-org-mode)
(require 'my-markdown)
(require 'my-programs)
(require 'my-theme)
(require 'my-editing)
(require 'my-dired)
(require 'my-magit)
(require 'ruffify)
(require 'my-programming-languages)
(require 'my-delimiters)
(require 'my-docker)

;; TODO: move this into my-theme.el?
;; Note: DejaVU Sans Mono is not install by default on Windows — https://dejavu-fonts.github.io/Download.html
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

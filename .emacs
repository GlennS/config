;;; .emacs

;; When Emacs asks us to customize stuff, here's where it goes
(setq custom-file "~/.emacs.d/config/custom.el")

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)

(add-to-list 'load-path
             (expand-file-name "config" user-emacs-directory))

(require 'use-package)
(setq use-package-always-ensure t)

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

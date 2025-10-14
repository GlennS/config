;;; .emacs

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

(require 'my-annoyances)
(require 'my-backups)
(require 'my-buffers)
(require 'my-file-find)
(require 'my-org-agenda-files)
(require 'my-org-mode)
(require 'my-markdown)
(require 'my-programs)
(require 'my-theme)
(require 'my-editing)
(require 'my-regexp-and-cursors)
(require 'my-zoom)
(require 'my-dired)
(require 'my-magit)
(require 'ruffify)
(require 'my-programming-languages)
(require 'my-delimiters)

;; Launch an Emacs server
(server-start)

(provide `.emacs)
;;; .emacs ends here

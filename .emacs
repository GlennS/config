(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(backup-directory-alist (quote (("." . "~/backups"))))
 '(browse-url-browser-function (quote browse-url-chromium))
 '(custom-enabled-themes (quote (wombat)))
 '(custom-safe-themes
   (quote
    ("19352d62ea0395879be564fc36bc0b4780d9768a964d26dfae8aad218062858d" default)))
 '(dired-auto-revert-buffer (quote dired-directory-changed-p))
 '(display-time-24hr-format t)
 '(display-time-day-and-date t)
 '(display-time-mode t)
 '(global-rainbow-delimiters-mode t)
 '(haskell-mode-hook (quote (turn-on-haskell-indent)))
 '(ido-auto-merge-delay-time 3)
 '(ido-mode (quote both) nil (ido))
 '(ido-work-directory-list-ignore-regexps (quote ("^/home/glenn/S")))
 '(image-dired-external-viewer "/usr/bin/feh")
 '(magit-push-always-verify nil)
 '(magit-revert-buffers t t)
 '(nxml-slash-auto-complete-flag t)
 '(org-agenda-files
   (quote
    ("~/notes/reading.org" "~/notes/todo.org" "~/notes/schedule.org" "~/work/events.org" "~/energy-calculator-update/plan.org" "~/723-ssepd-communities-map/plan.org" "~/work/todo.org")))
 '(org-babel-load-languages (quote ((awk . t) (dot . t) (R . t))))
 '(org-confirm-babel-evaluate nil)
 '(org-export-backends (quote (ascii beamer html icalendar latex md texinfo)))
 '(org-latex-pdf-process
   (quote
    ("latexmk -pdflatex='xelatex --shell-escape -interaction nonstopmode -output-directory %o' -pdf -f %f")))
 '(org-latex-to-pdf-process
   (quote
    ("latexmk -pdflatex='xelatex --shell-escape -interaction nonstopmode -output-directory %o' -pdf -f %f")))
 '(org-use-speed-commands t)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.milkbox.net/packages/"))))
 '(safe-local-variable-values (quote ((org-latex-listings . t))))
 '(tramp-default-method "ssh")
 '(vc-follow-symlinks nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Change M-x <space> to toggle between ' ', '' and '\t'.
(substitute-key-definition
 'just-one-space
 (lambda ()
   (interactive)
   (cycle-spacing -1 t))
 (current-global-map))

(global-visual-line-mode 1)

(server-start)
(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)
(setq make-backup-files nil)
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

(add-hook 'after-init-hook #'global-flycheck-mode) ; Load flycheck

;;; Yay lovely PHP
(eval-after-load 'flycheck
  '(progn
     (flycheck-define-checker web-mode-php
       "This is the same as the default php checker except just for web-mode.
It continues checking for javascript errors if there are no more PHP errors."
       
       :command ("php" "-l" "-d" "error_reporting=E_ALL" "-d" "display_errors=1" "-d" "log_errors=0" source)
       :error-patterns ((error line-start (or "Parse" "Fatal" "syntax") " error" (any ":" ",") " " (message) " in " (file-name) " on line " line line-end))
       :modes (web-mode))

     (add-to-list 'flycheck-checkers 'web-mode-php) 
     (delete 'handlebars flycheck-checkers)
     ))

(add-to-list 'auto-mode-alist '("\\.php$" . web-mode))

(add-hook 'web-mode-hook #'flycheck-mode)

;;; JSON
(add-hook 'json-mode 'flycheck-json-load)

;; Disable _ to -> substitution in ESS.
(package-initialize)
(require 'ess-site)
(ess-toggle-underscore nil)
(kill-buffer "*ESS*")

;; PDF Tools
(pdf-tools-install)

;; Visual Regexp
(require 'visual-regexp)
(define-key global-map (kbd "C-c r") 'vr/replace) ; Replace all at once
(define-key global-map (kbd "C-c q") 'vr/query-replace) ; Ask before each replacement

(provide `.emacs)
;;; .emacs ends here

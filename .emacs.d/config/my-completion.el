(use-package vertico
  :init
  (vertico-mode)
  (vertico-reverse-mode))

(use-package marginalia
  ;; M-A lets us cycle through margin notes
  :bind (:map minibuffer-local-map
         ("M-A" . marginalia-cycle))

  :init
  (marginalia-mode))

;; Emacs minibuffer configurations.
(use-package emacs
  :custom
  ;; Enable context menu. `vertico-multiform-mode' adds a menu in the minibuffer
  ;; to switch display modes.
  (context-menu-mode t)

  ;; Support opening new minibuffers from inside existing minibuffers.
  (enable-recursive-minibuffers t)

  ;; Hide commands in M-x which do not work in the current mode.  Vertico
  ;; commands are hidden in normal buffers. This setting is useful beyond
  ;; Vertico.
  (read-extended-command-predicate #'command-completion-default-include-p)

  ;; Do not allow the cursor in the minibuffer prompt
  (minibuffer-prompt-properties
   '(read-only t cursor-intangible t face minibuffer-prompt)))

(use-package vertico-directory
  :after vertico
  :ensure nil
  ;; More convenient directory navigation commands
  :bind (:map vertico-map
              ("RET" . vertico-directory-enter)
              ("DEL" . vertico-directory-delete-char)
              ("M-DEL" . vertico-directory-delete-word))
  ;; Tidy shadowed file names
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy))

(use-package hotfuzz
  :config
  (setq completion-styles '(hotfuzz)))

(provide 'my-completion)

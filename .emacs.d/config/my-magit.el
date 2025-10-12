(use-package keychain-environment
  :ensure t ; This tells use-package to automatically install the package if it's not found.
  :config
  (keychain-refresh-environment)
  ;; Optional: Periodically refresh the environment if Emacs runs for a long time
  (run-with-timer 300 300 'keychain-refresh-environment))

(setq magit-push-always-verify nil)
(setq magit-revert-buffers t) ; Automatically refresh affected buffers when magit makes changes.
(setq magit-diff-refine-hunk t) ; Word diffs

(setq vc-follow-symlinks nil)

(global-set-key (kbd "C-c g") 'magit-status)

(require 'browse-at-remote)
(global-set-key (kbd "C-c C-g") 'browse-at-remote)

(provide `my-magit)

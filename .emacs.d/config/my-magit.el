(use-package keychain-environment
  :config
  (keychain-refresh-environment)
  ;; Optional: Periodically refresh the environment if Emacs runs for a long time
  (run-with-timer 300 300 'keychain-refresh-environment))

(use-package magit
  :bind (("C-c g" . magit-status)) ; Keybinding for magit-status.

  :config
  ;; Magit Settings
  (setq magit-push-always-verify nil)
  (setq magit-revert-buffers t) ; Automatically refresh affected buffers.
  (setq magit-diff-refine-hunk t) ; Word diffs

  ;; General Version Control Settings (often relevant to Magit usage)
  (setq vc-follow-symlinks nil))

(use-package browse-at-remote
  :bind (("C-c C-g" . browse-at-remote)))

(provide `my-magit)

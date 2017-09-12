(setq magit-push-always-verify nil)
(setq magit-revert-buffers t) ; Automatically refresh affected buffers when magit makes changes.

(setq vc-follow-symlinks nil)

(global-set-key (kbd "C-c g") 'magit-status)

(provide `my-magit)

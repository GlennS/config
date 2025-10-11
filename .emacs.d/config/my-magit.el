(when (executable-find "gpgconf")
  (let* ((socket-path (string-trim (shell-command-to-string "gpgconf --list-dirs agent-ssh-socket"))))
    (unless (string= socket-path "")
      (setenv "SSH_AUTH_SOCK" socket-path)
      (message "SSH_AUTH_SOCK set to: %s" socket-path))))

(setq magit-push-always-verify nil)
(setq magit-revert-buffers t) ; Automatically refresh affected buffers when magit makes changes.
(setq magit-diff-refine-hunk t) ; Word diffs

(setq vc-follow-symlinks nil)

(global-set-key (kbd "C-c g") 'magit-status)

(require 'browse-at-remote)
(global-set-key (kbd "C-c C-g") 'browse-at-remote)

(provide `my-magit)

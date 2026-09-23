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

  ;; I don't read the Tags: header, and it costs two git describe calls on every
  ;; status refresh.
  (remove-hook 'magit-status-headers-hook #'magit-insert-tags-header)

  ;; General Version Control Settings (often relevant to Magit usage)
  (setq vc-follow-symlinks nil))

(use-package browse-at-remote
  :bind (("C-c C-g" . browse-at-remote))

  :config
  (defun my-browse-at-remote-default-branch (remote)
    "Name of REMOTE's default branch, or \"master\" if git doesn't say."
    ;; `vc-git--run-command-string' returns nil on a non-zero exit, which is
    ;; what happens when refs/remotes/<remote>/HEAD doesn't exist.
    (let ((head (vc-git--run-command-string
                 nil "symbolic-ref" "--short"
                 (format "refs/remotes/%s/HEAD" remote))))
      (if head
          (s-chop-prefix (format "%s/" remote) (s-trim head))
        "master")))

  (defun my-browse-at-remote-use-default-branch (result)
    "Replace the ref in RESULT with the remote's default branch.
Links to the branch or commit that happens to be checked out rot once
that branch is gone, so they're no use to share."
    (when result
      (cons (car result)
            ;; The remote name isn't in RESULT, so re-derive it the same way
            ;; `browse-at-remote--remote-ref' does for a detached head.
            (my-browse-at-remote-default-branch
             (browse-at-remote--get-preferred-remote)))))

  (advice-add 'browse-at-remote--remote-ref :filter-return
              #'my-browse-at-remote-use-default-branch))

(provide `my-magit)

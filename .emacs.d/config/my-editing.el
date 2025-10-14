(global-visual-line-mode 1) ; Word-wrap on

(editorconfig-mode 1)

;; Default to indenting with spaces
(setq-default indent-tabs-mode nil)

;; Delete trailing whitespace when saving files
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Make M-q formatting produce longer lines.
(setq-default fill-column 100)

;; Change M-x <space> to toggle between ' ' and ''.
(substitute-key-definition
 'just-one-space
 (lambda ()
   (interactive)
   (cycle-spacing -1))
 (current-global-map))

(global-set-key (kbd "C-S-<insert>") 'yank) ; For consistency with xterm

(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)

;; No Ctrl-z breaking things
(global-set-key (kbd "C-z") 'undo)

;; Unicode, thanks
(prefer-coding-system 'utf-8-unix)
(setq-default buffer-file-coding-system 'utf-8-unix)

(provide `my-editing)

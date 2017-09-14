(global-visual-line-mode 1) ; Word-wrap on

;; Default to indenting with spaces
(setq-default indent-tabs-mode nil)

;; Delete trailing whitespace when saving files
(add-hook 'before-save-hook 'delete-trailing-whitespace)

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

;; Visual Regexp
(global-set-key (kbd "C-c r") 'vr/replace) ; Replace all at once
(global-set-key (kbd "C-c q") 'vr/query-replace) ; Ask before each replacement

;; Multiple Cursors
(global-set-key (kbd "C-S-SPC") 'mc/edit-lines)

;; Ace Jump Mode
;; https://www.emacswiki.org/emacs/AceJump
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)
(with-eval-after-load 'org
  (define-key org-mode-map (kbd "C-c SPC") nil))

(prefer-coding-system 'utf-8-unix)
(setq-default buffer-file-coding-system 'utf-8-unix)

(provide `my-editing)

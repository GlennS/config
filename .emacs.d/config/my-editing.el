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

;; Delete file and buffer
(defun delete-file-and-buffer ()
  "Kill the current buffer and deletes the file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if filename
        (if (y-or-n-p (concat "Do you really want to delete file " filename " ?"))
            (progn
              (delete-file filename)
              (message "Deleted file %s." filename)
              (kill-buffer)))
      (message "Not a file visiting buffer!"))))

;; No Ctrl-z breaking things
(global-set-key (kbd "C-z") 'undo)

;; Visual Regexp
(require 'visual-regexp-steroids)
(define-key global-map (kbd "C-c r") 'vr/replace)
(define-key global-map (kbd "C-c q") 'vr/query-replace)
;; multi-cursors based on regex
(define-key global-map (kbd "C-c C-M") 'vr/mc-mark)
;; to use visual-regexp-steroids's isearch instead of the built-in regexp isearch, also include the following lines:
(define-key esc-map (kbd "C-r") 'vr/isearch-backward) ;; C-M-r
(define-key esc-map (kbd "C-s") 'vr/isearch-forward) ;; C-M-s

;; Multiple Cursors
(global-set-key (kbd "C-S-SPC") 'mc/edit-lines)

;; Ace Jump Mode
;; https://www.emacswiki.org/emacs/AceJump
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)
(with-eval-after-load 'org
  (define-key org-mode-map (kbd "C-c SPC") nil))

;; EM-Dash Key
(defun insert-em-dash ()
  (interactive)
  (insert "—"))
(global-set-key (kbd "C-c m") 'insert-em-dash)

;; Disable mail key
(global-unset-key (kbd "C-x m"))

;; Unicode, thanks
(prefer-coding-system 'utf-8-unix)
(setq-default buffer-file-coding-system 'utf-8-unix)

;; Who actually likes the stupid bell?
(setq ring-bell-function 'ignore)

;; Resize the whole frame, and not only a window
;; https://stackoverflow.com/questions/24705984/increase-decrease-font-size-in-an-emacs-frame-not-just-buffer/60641769#60641769
(defun acg/zoom-frame (&optional amt frame)
  "Increaze FRAME font size by amount AMT. Defaults to selected
frame if FRAME is nil, and to 1 if AMT is nil."
  (interactive "p")
  (let* ((frame (or frame (selected-frame)))
         (font (face-attribute 'default :font frame))
         (size (font-get font :size))
         (amt (or amt 1))
         (new-size (+ size amt)))
    (set-frame-font (font-spec :size new-size) t `(,frame))
    (message "Frame's font new size: %d" new-size)))

(defun acg/zoom-frame-out (&optional amt frame)
  "Call `acg/zoom-frame' with negative argument."
  (interactive "p")
  (acg/zoom-frame (- (or amt 1)) frame))

(global-set-key (kbd "C-x C-=") 'acg/zoom-frame)
(global-set-key (kbd "C-x C--") 'acg/zoom-frame-out)

(provide `my-editing)

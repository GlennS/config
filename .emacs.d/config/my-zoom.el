;; Resize the whole frame, and not only a window
;; https://stackoverflow.com/questions/24705984/increase-decrease-font-size-in-an-emacs-frame-not-just-buffer/60641769#60641769
(defun zoom-frame (&optional amt frame)
  "Increaze FRAME font size by amount AMT. Defaults to selected frame if FRAME is nil, and to 1 if AMT is nil."
  (interactive "p")
  (let* ((frame (or frame (selected-frame)))
         (font (face-attribute 'default :font frame))
         (size (font-get font :size))
         (amt (or amt 1))
         (new-size (+ size amt)))
    (set-frame-font (font-spec :size new-size) t `(,frame))
    (message "Frame's font new size: %d" new-size)))

(defun zoom-frame-out (&optional amt frame)
  "Call `zoom-frame' with negative argument."
  (interactive "p")
  (zoom-frame (- (or amt 1)) frame))

(global-set-key (kbd "C-x C-=") 'zoom-frame)
(global-set-key (kbd "C-x C--") 'zoom-frame-out)

(provide 'my-zoom)

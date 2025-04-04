;;; Based on https://github.com/pythonic-emacs/isortify/blob/master/isortify.el by Artem Malyshev
;;; Which is GNU General Public License

;;;###autoload
(defun ruffify-buffer (&optional display)
  "Try to ruffify the file underlying the current buffer.

Show ruff output, if ruff exit abnormally and DISPLAY is t."
  (interactive (list t))
  (call-process "ruff" nil "*ruffify*" nil "check" "--fix" (buffer-file-name))
  (call-process "ruff" nil "*ruffify*" nil "format" (buffer-file-name))
  (revert-buffer :ignore-auto :noconfirm))

;;;###autoload
(define-minor-mode ruffify-mode
  "Automatically run ruff before saving."
  :lighter " Ruff"
  (if ruffify-mode
      (add-hook 'after-save-hook 'ruffify-buffer nil t)
    (remove-hook 'after-save-hook 'ruffify-buffer t)))

(provide 'ruffify)

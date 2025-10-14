;; Remove an annoying prompt when killing buffers opened with emacsclient
(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)

(defun kill-other-buffers ()
  "Kill all other buffers [http://emacswiki.org/emacs/KillingBuffers#toc2]."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

;; Delete file and buffer
(defun delete-file-and-buffer ()
  "Kill the current buffer and deletes the file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if filename
        (if (yes-or-no-p (concat "Do you really want to delete file " filename " ?"))
            (progn
              (delete-file filename)
              (message "Deleted file %s." filename)
              (kill-buffer)))
      (message "Not a file visiting buffer!"))))

(provide 'my-buffers)

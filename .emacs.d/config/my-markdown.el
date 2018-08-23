(require `markdown-mode)

(define-key markdown-mode-map (kbd "M-<return>") 'markdown-insert-header-dwim)
(define-key markdown-mode-map (kbd "C-c C-l") 'markdown-insert-link)

(defun markdown-move-heading-or-row-up ()
  (interactive)
  (if (markdown-table-at-point-p) (markdown-table-move-row-up)
    (markdown-move-up)))

(define-key markdown-mode-map (kbd "M-<up>") 'markdown-move-heading-or-row-up)

(defun markdown-move-heading-or-row-down ()
  (interactive)
  (if (markdown-table-at-point-p) (markdown-table-move-row-down)
    (markdown-move-down)))

(define-key markdown-mode-map (kbd "M-<down>") 'markdown-move-heading-or-row-down)

(defun markdown-move-column-left-or-promote ()
  (interactive)
  (if (markdown-table-at-point-p) (markdown-table-move-column-left)
    (markdown-promote)))

(define-key markdown-mode-map (kbd "M-<left>") 'markdown-move-column-left-or-promote)

(defun markdown-move-column-right-or-demote ()
  (interactive)
  (if (markdown-table-at-point-p) (markdown-table-move-column-right)
    (markdown-demote)))

(define-key markdown-mode-map (kbd "M-<right>") 'markdown-move-column-right-or-demote)

(defun markdown-delete-row-or-move-up ()
  (interactive)
  (if (markdown-table-at-point-p) (markdown-table-delete-row)
    (markdown-move-up)))

(define-key markdown-mode-map (kbd "M-S-<up>") 'markdown-delete-row-or-move-up)

(defun markdown-add-row-or-move-down ()
  (interactive)
  (if (markdown-table-at-point-p) (markdown-table-insert-row)
    (markdown-move-down)))

(define-key markdown-mode-map (kbd "M-S-<down>") 'markdown-add-row-or-move-down)

(defun markdown-add-column-or-demote ()
  (interactive)
  (if (markdown-table-at-point-p) (markdown-table-insert-column)
    (markdown-promote)))

(define-key markdown-mode-map (kbd "M-S-<right>") 'markdown-add-column-or-demote)

(defun markdown-delete-column-or-promote ()
  (interactive)
  (if (markdown-table-at-point-p) (markdown-table-delete-column)
    (markdown-promote)))

(define-key markdown-mode-map (kbd "M-S-<left>") 'markdown-delete-column-or-promote)

(define-key markdown-mode-map (kbd "C-c C-|") 'markdown-table-convert-region)



(provide `my-markdown)

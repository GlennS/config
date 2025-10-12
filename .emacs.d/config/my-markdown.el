(use-package markdown-mode
  :defer t ; Defer loading until a markdown file is opened
  :config
  ;; --- Custom Functions for Table/Heading Movement and Manipulation ---

  (defun markdown-move-heading-or-row-up ()
    "Move heading up, or move a table row up if at a table."
    (interactive)
    (if (markdown-table-at-point-p) (markdown-table-move-row-up)
      (markdown-move-up)))

  (defun markdown-move-heading-or-row-down ()
    "Move heading down, or move a table row down if at a table."
    (interactive)
    (if (markdown-table-at-point-p) (markdown-table-move-row-down)
      (markdown-move-down)))

  ;; ... [All other custom functions defined here] ...

  (defun markdown-delete-column-or-promote ()
    "Delete table column, or promote a heading if not at a table."
    (interactive)
    (if (markdown-table-at-point-p) (markdown-table-delete-column)
      (markdown-promote)))

  ;; --- Keybindings ---
  :bind
  (("M-<return>" . 'markdown-insert-header-dwim)
   ("C-c C-l"    . 'markdown-insert-link)
   ;; Custom Functions
   ("M-<up>"     . 'markdown-move-heading-or-row-up)
   ("M-<down>"   . 'markdown-move-heading-or-row-down)
   ;; ... [All other bindings here] ...
   ("C-c C-|"    . 'markdown-table-convert-region)))

(use-package markdown-mode
  ;; :defer t is optional here, as :bind implicitly defers loading.
  ;; We keep it for clarity that we want deferred loading.
  :defer t

  :config
  ;; --- Custom Functions for Table/Heading Movement and Manipulation ---

  (defun markdown-move-heading-or-row-up ()
    "Move heading up, or move a table row up if at a table."
    (interactive)
    (if (markdown-table-at-point-p) (markdown-table-move-row-up)
      (markdown-move-up)))

  (defun markdown-move-heading-or-row-down ()
    "Move heading down, or move a table row down if at a table."
    (interactive)
    (if (markdown-table-at-point-p) (markdown-table-move-row-down)
      (markdown-move-down)))

  (defun markdown-move-column-left-or-promote ()
    "Move column left, or promote a heading if not at a table."
    (interactive)
    (if (markdown-table-at-point-p) (markdown-table-move-column-left)
      (markdown-promote)))

  (defun markdown-move-column-right-or-demote ()
    "Move column right, or demote a heading if not at a table."
    (interactive)
    (if (markdown-table-at-point-p) (markdown-table-move-column-right)
      (markdown-demote)))

  (defun markdown-delete-row-or-move-up ()
    "Delete table row, or move heading up if not at a table."
    (interactive)
    (if (markdown-table-at-point-p) (markdown-table-delete-row)
      (markdown-move-up)))

  (defun markdown-add-row-or-move-down ()
    "Insert table row, or move heading down if not at a table."
    (interactive)
    (if (markdown-table-at-point-p) (markdown-table-insert-row)
      (markdown-move-down)))

  (defun markdown-add-column-or-demote ()
    "Insert table column, or promote a heading if not at a table."
    (interactive)
    (if (markdown-table-at-point-p) (markdown-table-insert-column)
      (markdown-promote)))

  (defun markdown-delete-column-or-promote ()
    "Delete table column, or promote a heading if not at a table."
    (interactive)
    (if (markdown-table-at-point-p) (markdown-table-delete-column)
      (markdown-promote)))

  ;; --- Keybindings ---
  :bind
  (("M-<return>" . 'markdown-insert-header-dwim)
   ("C-c C-l"    . 'markdown-insert-link)
   ;; Custom Functions
   ("M-<up>"     . 'markdown-move-heading-or-row-up)
   ("M-<down>"   . 'markdown-move-heading-or-row-down)
   ("M-<left>"   . 'markdown-move-column-left-or-promote)
   ("M-<right>"  . 'markdown-move-column-right-or-demote)
   ("M-S-<up>"   . 'markdown-delete-row-or-move-up)
   ("M-S-<down>" . 'markdown-add-row-or-move-down)
   ("M-S-<right>" . 'markdown-add-column-or-demote)
   ("M-S-<left>"  . 'markdown-delete-column-or-promote)
   ("C-c C-|"    . 'markdown-table-convert-region)))


(provide `my-markdown)

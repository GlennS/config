(use-package multiple-cursors
  :ensure t
  :bind (("C-S-SPC" . mc/edit-lines)))


(use-package visual-regexp-steroids
  :bind (("C-c r" . vr/replace)
         ("C-c q" . vr/query-replace)
         ;; multi-cursors based on regex
         ("C-c C-M" . vr/mc-mark)
         ;; Bind isearch variants
         :map esc-map
         ("C-r" . vr/isearch-backward) ;; C-M-r
         ("C-s" . vr/isearch-forward))) ;; C-M-s

(provide 'my-regexp-and-cursors)

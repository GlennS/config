;; Disable mail key
(global-unset-key (kbd "C-x m"))

;; Who actually likes the stupid bell?
(setq ring-bell-function 'ignore)

(setq auth-source-save-behavior "n")

(provide 'my-annoyances)

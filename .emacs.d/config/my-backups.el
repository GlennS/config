(setq auto-save-default nil)

(setq backup-directory-alist '(("." . "~/backups")))
;; Don't put a bunch of files in the backup directory
(setq delete-old-versions t
      kept-old-versions 5
      kept-new-versions 5
      version-control t)

(provide `my-backups)

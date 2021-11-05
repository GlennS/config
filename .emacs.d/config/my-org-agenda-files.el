(setq org-agenda-files
      (cond ((string-equal (system-name) "glaptoph") `("~/notes/schedule.org"
                                                       "~/notes/todo.org"))

            ('true (append `("~/notes/schedule.org"
                             "~/octopus/scheduled.org")
                           (directory-files "~/octopus/tasks")))))

(provide `my-org-agenda-files)

(setq org-agenda-files
      (cond ((string-equal (system-name) "glaptopw2") `("~/notes/schedule.org"
                                                       "~/notes/todo.org"))

            ('true `("~/notes/schedule.org"
                     "~/octopus/schedule.org"
                     "~/octopus/tasks"))))


(provide `my-org-agenda-files)

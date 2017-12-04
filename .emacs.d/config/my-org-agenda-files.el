(let ((home-agenda-files '("~/notes/todo.org"
                            "~/notes/reading.org"
                            "~/notes/schedule.org"))

      (project-agenda-files '())

      (work-agenda-files '("~/work/todo.org"
                           "~/work/events.org")))

  (setq org-agenda-files
        (if (string= system-name "glenn-laptop")

            (append
             work-agenda-files
             project-agenda-files)

          home-agenda-files)))

(provide `my-org-agenda-files)

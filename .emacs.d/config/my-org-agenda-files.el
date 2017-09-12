(let ((home-agenda-files '("~/notes/todo.org"
                            "~/notes/reading.org"
                            "~/notes/schedule.org"))

      (project-agenda-files '("~/137-wpd-smart-and-snug/readme.org"
                              "~/630-openlv/readme.org"
                              "~/110-thermos-typo3-extension/readme.org"
                              "~/723-ssen-communities-map/plan.org"))

      (work-agenda-files '("~/work/todo.org"
                           "~/work/events.org")))

  (setq org-agenda-files
        (if (string= system-name "glenn-laptop")

            (append
             home-agenda-files
             project-agenda-files
             work-agenda-files)

          home-agenda-files)))

(provide `my-org-agenda-files)

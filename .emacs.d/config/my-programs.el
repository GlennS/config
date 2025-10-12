;; --- System & External Programs ---

;; Set the default browser function for browse-url and external image viewer for image-dired.
(setq browse-url-browser-function 'browse-url-firefox
      image-dired-external-viewer "/usr/bin/feh")

;; Include Nix binaries in the executable path.
(add-to-list 'exec-path "/home/glenn/.nix-profile/bin" t)

;; --- direnv ---

;; Automatically manage environment variables with direnv.
(use-package direnv
  :config
  ;; Only enable direnv-mode if not on Windows
  (unless (string-equal system-type "windows-nt")
    (direnv-mode)))

;; --- ag (The Silver Searcher) ---

;; Configuration for the ag package.
(use-package ag
  :config
  ;; Set the variables as soon as the package is loaded.
  (setq ag-highlight-search :t
        ag-reuse-buffers :t))

(provide 'my-programs)

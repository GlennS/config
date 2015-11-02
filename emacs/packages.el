(dolist (package-name
	 `(ess
	   flycheck
	   magit
	   js2-mode
	   json-mode
	   web-mode
	   )
	 )
  (package-install package-name))

(dolist (package-name
	 `(ess
	   flycheck
	   magit
	   js2-mode
	   json-mode
	   web-mode
	   nginx-mode
	   pyvenv
	   )
	 )
  (package-install package-name))

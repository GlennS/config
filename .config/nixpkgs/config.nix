{
  allowUnfree = true;

  ## To install things from here, write something like: nix-env -iA 'nixos1809.myEmacs'
  packageOverrides = super: let self = super.pkgs; in
    {
      rEnv = super.rWrapper.override {
        packages = with self.rPackages; [
          dplyr
          tidyr
        ];
      };

      myEmacs = super.pkgs.emacsWithPackages (epkgs: (with epkgs.melpaPackages; [
        magit

        direnv

        basic-mode
        web-mode
        js2-mode
        rjsx-mode # js2 + JSX for React
        json-mode
        php-mode
        go-mode
        groovy-mode
        ## ruby-mode # built in
        csharp-mode
        ess # R
        company # R
        python-mode
        blacken # Python formatting
        ob-ipython
        nginx-mode
        ## nix-mode # Out of date
        clojure-mode
        cider # Clojure
        gradle-mode # Java
        markdown-mode
        ## sql-indent # Out of date
        yaml-mode

        htmlize # Syntax highlighting for HTML export

        editorconfig

        visual-regexp
        visual-regexp-steroids # Modern regexp
        multiple-cursors
        ace-jump-mode
        pdf-tools
        ag

        smartparens
        rainbow-delimiters
      ]));
    };
}

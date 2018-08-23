{
  allowUnfree = true;

  packageOverrides = super: let self = super.pkgs; in
  {
    rEnv = super.rWrapper.override {
      packages = with self.rPackages; [
        dplyr
        tidyr
      ];
    };

    myPython3 = super.pkgs.python36.withPackages(ps: with ps; [matplotlib tabulate numpy jupyter]);
    myPython2 = super.pkgs.python27.withPackages(ps: with ps; [matplotlib tabulate numpy jupyter]);

    myEmacs = super.pkgs.emacsWithPackages (epkgs: (with epkgs.melpaPackages; [
      magit

      basic-mode
      web-mode
      js2-mode
      rjsx-mode # js2 + JSX for React
      less-css-mode
      json-mode
      php-mode
      go-mode
      groovy-mode

      ## ruby-mode # built in

      csharp-mode
      ess # R
      company # R
      python-mode
      ob-ipython
      nginx-mode
      nix-mode
      clojure-mode
      cider # Clojure
      gradle-mode # Java
      markdown-mode

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

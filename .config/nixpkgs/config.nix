{
  allowUnfree = true;

  ## To install things from here, write something like: nix-env -iA 'nixos1809.myEmacs'
  packageOverrides = super: let self = super.pkgs; in
    {
      myEmacs = super.pkgs.emacsWithPackages (epkgs: (with epkgs.melpaPackages; [
        magit

        direnv

        flycheck
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
        elpy
        ob-ipython
        nginx-mode
        nix-mode
        clojure-mode
        cider # Clojure
        gradle-mode # Java
        markdown-mode
        epkgs.elpaPackages.sql-indent
        yaml-mode
        terraform-mode
        dockerfile-mode
        docker-compose-mode
        graphql-mode

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
        dumb-jump
      ]));
    };
}

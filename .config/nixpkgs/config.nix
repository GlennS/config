{
  allowUnfree = true;

  ## To install things from here, write something like: nix-env -iA 'nixos1809.myEmacs'
  packageOverrides = super: let self = super.pkgs; in
    {
      myR = super.rWrapper.override {
        packages = with self.rPackages; [
          dplyr
          tidyr
        ];
      };

      myAWSVault = (super.pkgs.callPackage ./aws-vault.nix {});

      myPython3 = (super.pkgs.python37.withPackages (ps: [
        ps.jupyter
        ps.setuptools
        ps.black
        ps.rope
        ps.autopep8
        ps.flake8
        ps.jedi
      ]));

      chamber = super.pkgs.runCommand "chamber-2.7.3" {} "mkdir -p $out/bin ; cp ${./chamber-v2.7.3-linux-amd64} $out/bin/chamber";

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

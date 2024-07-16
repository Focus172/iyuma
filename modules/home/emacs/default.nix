{ config, lib, pkgs, ... }: {
  home.packages = with pkgs; [
    emacs
    # - obsidian.el
    # - doom-emacs.el
    ispell
    texliveTeTeX
    nixfmt-classic
  ];

  # programs.doom-emacs = {
  #   enable = true;
  #   # emacsPackage = pkgs.emacs;
  #
  #   doomPrivateDir = ./.;
  #   doomPackageDir = pkgs.linkFarm "my-doom-packages" [
  #     # straight needs a (possibly empty) `config.el` file to build
  #     {
  #       name = "config.el";
  #       path = pkgs.emptyFile;
  #     }
  #     {
  #       name = "init.el";
  #       path = ./init.el;
  #     }
  #     {
  #       name = "packages.el";
  #       path = pkgs.emptyFile;
  #       # path = pkgs.writeText "packages.el" "(package! inheritenv)";
  #     }
  #     # { name = "modules"; path = ./my-doom-module; }
  #   ];
  # };

  # home.file.".emacs.d/themes/doom-stylix-theme.el".source = config.lib.stylix.colors {
  #     template = builtins.readFile ./themes/doom-stylix-theme.el.mustache;
  #     extension = ".el";
  # };

  # home.packages = with pkgs; [
  #   nil
  #   git
  #   file
  #   wmctrl
  #   jshon
  #   aria
  #   hledger
  #   hunspell hunspellDicts.en_US-large
  #   pandoc
  #   (pkgs.mu.override { emacs = emacs29-pgtk; })
  #   emacsPackages.mu4e
  #   isync
  #   msmtp
  #   (python3.withPackages (p: with p; [
  #     pandas
  #     requests
  #     epc lxml
  #     pysocks
  #     pymupdf
  #     markdown
  #   ]))
  #   nodejs
  #   nodePackages.mermaid-cli
  # ];

  # home.file.".emacs.d/dashboard-logo.png".source = dashboardLogo;
  # home.file.".emacs.d/scripts/copy-link-or-file/copy-link-or-file-to-clipboard.sh" = {
  #   source = ./scripts/copy-link-or-file/copy-link-or-file-to-clipboard.sh;
  #   executable = true;
  # };
}

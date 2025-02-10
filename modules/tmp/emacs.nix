{ config, lib, pkgs, inputs, system, ... }:
let
  doom-emacs = inputs.nix-doom-emacs.packages.${system}.default.override {
    doomPrivateDir = ./doom;
    doomPackageDir = let
      filteredPath = builtins.path {
        path = ./doom;
        name = "doom-private-dir-filtered";
        filter = path: type:
          builtins.elem (baseNameOf path) [ "init.el" "packages.el" ];
      };
      in pkgs.linkFarm "doom-packages-dir" [
        {
          name = "init.el";
          path = "${filteredPath}/init.el";
        }
        {
          name = "packages.el";
          path = "${filteredPath}/packages.el";
        }
        {
          name = "config.el";
          path = pkgs.emptyFile;
        }
      ];
  };
  neomacs = inputs.neomacs.packages."${system}".default;
in {
  imports = [ ./tex.nix ];

  environment.systemPackages = [
    doom-emacs
    # neomacs
  ] ++ (with pkgs; [
    ispell
    nixfmt-classic

    # nil
    git
    file
    # wmctrl
    # jshon
    # aria
    # hledger
    # hunspell hunspellDicts.en_US-large
    pandoc
    # (pkgs.mu.override { emacs = doom-emacs; })
    # emacsPackages.mu4e
    # isync
    # msmtp
    # (python3.withPackages (p: with p; [
    #   pandas
    #   requests
    #   epc lxml
    #   pysocks
    #   pymupdf
    #   markdown
    # ]))
    # nodejs
    # nodePackages.mermaid-cli
  ]);

  # home.file.".emacs.d/dashboard-logo.png".source = dashboardLogo;
  # home.file.".emacs.d/scripts/copy-link-or-file/copy-link-or-file-to-clipboard.sh" = {
  #   source = ./scripts/copy-link-or-file/copy-link-or-file-to-clipboard.sh;
  #   executable = true;
  # };
}

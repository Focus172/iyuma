{ config, lib, pkgs, inputs, system, ... }: {

  imports = [
    ./tex.nix
  ];

  environment.systemPackages = [
    (inputs.nix-doom-emacs.packages.${system}.default.override {
      # emacsPackage = pkgs.emacs;
      doomPrivateDir = ./doom;
      # doomPackageDir = pkgs.linkFarm "my-doom-packages" [
      #   {
      #     name = "config.el";
      #     path = pkgs.emptyFile;
      #   }
      #   {
      #     name = "init.el";
      #     path = ./doom/init.el;
      #   }
      #   {
      #     name = "packages.el";
      #     # path = pkgs.emptyFile;
      #     path = pkgs.writeText "packages.el" ''
      #       ; (package! inheritenv)";
      #       ; - obsidian.el
      #       ; - doom-emacs.el
      #     '';
      #   }
      # ];
    })
  ] ++ (with pkgs; [
    ispell
    # texliveTeTeX
    nixfmt-classic

    # nil
    # git
    # file
    # wmctrl
    # jshon
    # aria
    # hledger
    # hunspell hunspellDicts.en_US-large
    # pandoc
    # (pkgs.mu.override { emacs = emacs29-pgtk; })
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

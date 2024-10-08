{ config, lib, pkgs, inputs, system, ... }: {
  imports = [ ./tex.nix ];

  environment.systemPackages = [
    # (inputs.nix-doom-emacs.packages.${system}.default.override {
    #   doomPrivateDir = ./doom;
    # })
  ] ++ (with pkgs; [
    ispell
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

{
  inputs,
  config,
  pkgs,
  lib,
  ...
}: let
  colors = import ../shared/cols/wave.nix {};
in {
  # some general info
  home.username = "focus";
  home.homeDirectory = "/home/focus";
  home.stateVersion = "22.11";
  programs.home-manager.enable = true;

  home.file.".icons/default".source = "${pkgs.phinger-cursors}/share/icons/phinger-cursors";

  # gtk themeing
  gtk = {
    enable = true;
    gtk3.extraConfig.gtk-decoration-layout = "menu:";
    iconTheme.name = "WhiteSur";
    theme.name = "gruv";
  };

  nixpkgs.overlays = [ ];
  
  imports = [
    # Importing Configutations
    (import ./conf/utils/rofi/default.nix {inherit config pkgs colors;})
    (import ./conf/music/cava/default.nix {inherit colors;})
    (import ./conf/shell/zsh/default.nix {inherit config pkgs;})
    (import ./conf/music/mpd/default.nix {inherit config pkgs;})
    (import ./conf/music/ncmp/default.nix {inherit config pkgs;})

    # Bin files
    (import ../shared/bin/default.nix {inherit config;})
  ];

  home = {
    activation = {
      # installConfig = ''
      #   if [ ! -d "${config.home.homeDirectory}/.config/awesome" ]; then
      #     ${pkgs.git}/bin/git clone --depth 1 --branch the-awesome-config https://github.com/chadcat7/fuyu ${config.home.homeDirectory}/.config/awesome
      #   fi
      #   if [ ! -d "${config.home.homeDirectory}/.config/nvim" ]; then
      #     ${pkgs.git}/bin/git clone --depth 1 https://github.com/chadcat7/kodo ${config.home.homeDirectory}/.config/nvim
      #   fi
      # '';
    };

    packages = with pkgs; [
      bc
      playerctl
      (pkgs.callPackage ../shared/icons/whitesur.nix {})
      (pkgs.callPackage ../shared/icons/colloid.nix {})
      (pkgs.callPackage ../shared/icons/fluent.nix {})
      (pkgs.callPackage ../shared/icons/elementary.nix {})
      neofetch
      # notion-app-enhanced
      pfetch
      ffmpeg
      # xdg-desktop-portal
      mpd
      imagemagick
      killall
      cava
      feh
      exa
    ];
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
    allowUnfreePredicate = _: true;
  };
}

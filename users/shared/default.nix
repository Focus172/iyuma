{
  inputs,
  config,
  pkgs,
  lib,
  colors,
  ...
}: {
  home.stateVersion = "22.11";
  programs.home-manager.enable = true;

  # home.file.".icons/default".source = "${pkgs.phinger-cursors}/share/icons/phinger-cursors";

  # gtk themeing
  # gtk = {
  #   enable = true;
  #   gtk3.extraConfig.gtk-decoration-layout = "menu:";
  #   iconTheme.name = "WhiteSur";
  #   theme.name = "gruvbox-dark-gtk";
  # };

  nixpkgs.overlays = [];

  imports = [
    # Importing Configutations
    (import ./music/cava.nix {inherit colors;})
    (import ./music/mpd.nix {inherit config pkgs;})
    (import ./music/ncmp.nix {inherit config pkgs;})

    (import ./shell/foot.nix {inherit colors;})
    (import ./shell/fish.nix {inherit config pkgs;})
    (import ./shell/bin/default.nix {inherit config;})

    # (import ./xdg.nix)

    (import ./utils/rofi/default.nix {inherit config pkgs colors;})
    (import ./utils/waybar {inherit pkgs;})
  ];

  home = {
    activation = {
      # installConfig = ''# shell code in here'';
    };

    packages = with pkgs; [
      pfetch
      killall
      cava
      feh
      exa
      gitui
      bat
      alejandra
      mpc-cli
      pass
      bottom

      # desktop things
      eww-wayland
      xdg-desktop-portal-hyprland
      swww

      (nerdfonts.override {fonts = ["Hack" "Mononoki"];})

      # tools
      jq
      htop # acpi
      wl-gammactl
      wlsunset
      wl-clipboard
      hyprpicker
      pavucontrol
      brightnessctl
      playerctl
      imagemagick

      # fun
      fortune
      jp2a
      glow
      gum
      slides
      charm
      # vhs

      skate

      # notion-app-enhanced

      # file manager
      # lf-sixel

      # langs
      zig
      nodejs
      go
      sassc
    ];

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      BROWSER = "brave";
      TERMINAL = "foot";
      SHELL = "fish";
      NIXPKGS_ALLOW_UNFREE = "1";
    };

    sessionPath = [];
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
    allowUnfreePredicate = _: true;
  };
}

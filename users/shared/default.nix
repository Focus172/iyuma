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

  ## gtk themeing
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

    (import ./utils/rofi/default.nix {inherit config pkgs colors;})
    (import ./utils/waybar {inherit pkgs;})
  ];

  home = {
    packages = with pkgs; [
      pfetch
      cava
      feh
      exa
      gitui
      bat
      alejandra
      mpc-cli
      pass
      bottom
      handlr-regex
      ripgrep

      ### desktop things
      eww-wayland
      xdg-desktop-portal-hyprland
      swww

      (nerdfonts.override {fonts = ["Hack" "Mononoki"];})

      ### tools
      jq
      htop
      # acpi
      # wl-gammactl
      # wlsunset
      # wl-clipboard
      # hyprpicker
      pavucontrol
      brightnessctl
      playerctl
      imagemagick

      # fun
      fortune
      neo-cowsay
      jp2a
      glow
      gum
      slides
      charm
      # vhs
      skate

      libreoffice

      # file manager
      lf
      # lf-sixel

      # langs
      rustup
      zig
      nodejs
      go
      sassc
      gcc
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

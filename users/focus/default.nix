{
  inputs,
  config,
  pkgs,
  lib,
...
}: let
  colors = import ./cols/wave.nix {};
in {
  home.username = "focus";
  home.homeDirectory = "/home/focus";
  home.stateVersion = "22.11";
  imports = [
    (import ../shared {inherit colors config inputs pkgs lib;})

    (import ./music/cava.nix {inherit colors;})
    (import ./music/mpd.nix {inherit config pkgs;})
    (import ./music/ncmp.nix {inherit config pkgs;})

    (import ./rofi/default.nix {inherit config pkgs colors;})

    (import ./shell/foot.nix {inherit colors;})
  ];

  programs = {
    imv = {
      enable = true;
    };
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.catppuccin-gtk;
      name = "Catppuccin-Dark";
    };
  };

  packages = with pkgs; [
      mpc-cli
      xdg-desktop-portal-hyprland
      eww-wayland
      swww
      htop
      # acpi
      # wl-gammactl
      # wlsunset
      # hyprpicker
      pavucontrol
      brightnessctl
      alsa-utils
      cliphist
      grim
      libreoffice-fresh
      mako
      slurp
      swayidle
      wl-clipboard
      brave
      # swaylock-effects
      # swayidle
      nginx
      killall
      lutris
      cava
      tty-clock
      jp2a
  ];
  file = {
      # ".config/eww".source = ./configs/eww;
      ".config/mako".source = ./configs/mako;
      ".config/swayidle".source = ./configs/swayidle;
      ".config/swaylock".source = ./configs/swaylock;
    };

}

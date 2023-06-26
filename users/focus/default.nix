{
  inputs,
  config,
  pkgs,
  lib,
...
}: let
  colors = import ../shared/cols/wave.nix {};
in {
  home.username = "focus";
  home.homeDirectory = "/home/focus";
  home.stateVersion = "22.11";
  imports = [
    (import ../shared {inherit colors config inputs pkgs lib;})

    (import ./music/cava.nix {inherit colors;})
    (import ./music/ncmp.nix {inherit config pkgs;})

    (import ./rofi/default.nix {inherit config pkgs colors;})


    (import ./shell/foot.nix {inherit colors;})
    (import ./shell/alacritty.nix {inherit colors;})
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

home = {
  packages = with pkgs; [
      mpc-cli
      xdg-desktop-portal-hyprland
      # eww-wayland
      swww
      htop
      # blender
      tmux
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
      cava
      emacs
      tty-clock
      # ani-cli
      mpv
      clang
      btar
      fd
      file
  ];
  file = {
      ".config/mako/config".source = ./configs/mako;
      ".config/swayidle/config".source = ./configs/swayidle;
      ".config/swaylock/config".source = ./configs/swaylock;
    };
};
}

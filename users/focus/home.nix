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

  # this is managed by pacman so we ignore it
  # however, i still want to use home-manager
  # to control it
  programs.fish.enable = false;

  imports = [
    (import ../shared {inherit inputs lib config pkgs colors;})
  ];

  home = {
    packages = with pkgs; [
      # (inputs.hyprland.packages.${pkgs.system}.hyprland.override {legacyRenderer = true;})
    ];

    sessionVariables = {};

    sessionPath = [];
  };
}

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

  # see other user profile for explaintion of this
  programs.fish.enable = false;

  imports = [
    (import ../shared {inherit inputs lib colors config pkgs;})
  ];

  home = {
    packages = with pkgs; [
      brave
      nginx
      hyprland
      rustup # installed sustem wide on asahi for kernel support

      # this can't be uninstall on arch
      killall
    ];

    sessionVariables = {
    };

    sessionPath = [
    ];
  };
}

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

  imports = [
    (import ../shared {inherit inputs lib colors config pkgs;})
  ];

  home = {
    packages = with pkgs; [
      brave
      nginx
      hyprland
      rustup # installed sustem wide on asahi for kernel support
    ];

    sessionVariables = {
    };

    sessionPath = [
    ];
  };
}

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

  imports = [
    (import ../shared {inherit inputs lib config pkgs colors;})
    # (import ./hyprland.nix {inherit pkgs lib inputs config;})
  ];

  home = {
    packages = with pkgs; [
      firefox
      (inputs.hyprland.packages.${pkgs.system}.hyprland.override {legacyRenderer = true;})
    ];

    sessionVariables = {};

    sessionPath = [
      # "$HOME/.local/bin"
    ];
  };
}

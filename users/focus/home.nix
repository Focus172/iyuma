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


  programs.fish.loginShellInit = '' 
    source ~/.nix-profile/etc/profile.d/nix.fish
  '';


  imports = [
    (import ../shared {inherit inputs lib config pkgs colors;})
  ];

  home = {
    packages = with pkgs; [
      # (inputs.hyprland.packages.${pkgs.system}.hyprland.override {legacyRenderer = true;})
      git
    ];

    sessionVariables = {};

    sessionPath = [];
  };
}

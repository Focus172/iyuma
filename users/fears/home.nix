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
  home.username = "focus"; # TODO: change this to real user name
  home.homeDirectory = "/home/focus";

  # see other user profile for explaintion of this
  programs.fish.enable = true;

  imports = [
    (import ../shared {inherit inputs lib colors config pkgs;})
  ];

  home = {
    packages = with pkgs; [
      brave
      nginx
      killall
    ];

    sessionVariables = {};

    sessionPath = [];
  };
}

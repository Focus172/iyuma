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

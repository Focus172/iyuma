{
  inputs,
  config,
  pkgs,
  lib,
...
}: let
  colors = import ./cols/wave.nix {};
in {
  home.username = "evan";
  home.homeDirectory = "/Users/evan";
  home.stateVersion = "23.05";
  imports = [
    (import ../shared {inherit colors config inputs pkgs lib;})
  ];
}

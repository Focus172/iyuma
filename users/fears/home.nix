{
  inputs,
  config,
  pkgs,
  lib,
  ...
}: let
  colors = import ./cols/wave.nix {};
in {
  # some general info
  home.username = "fears";
  home.homeDirectory = "/home/fears";

  imports = [
    (import ../shared {inherit inputs lib colors config pkgs;})
  ];

  home = {
    activation = {
      # installConfig = ''# shell code in here'';
    };

    packages = with pkgs; [
      brave
      nginx
    ];

    sessionVariables = {
    };

    sessionPath = [
    ];
  };
}

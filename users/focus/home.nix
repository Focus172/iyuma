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

  ];

  home = {
    packages = with pkgs; [ 
      firefox
    ];

    sessionVariables = { };

    sessionPath = [
      # "$HOME/.local/bin"
    ];
  };
}

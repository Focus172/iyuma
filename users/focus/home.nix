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

  # home.file.".icons/default".source = "${pkgs.phinger-cursors}/share/icons/phinger-cursors";

  imports = [
    (import ../shared {inherit inputs lib config pkgs colors;})

    (import ./utils/rofi/default.nix {inherit config pkgs colors;})
    (import ./utils/waybar.nix {inherit pkgs;})
  ];

  home = {
    packages = with pkgs; [ ];

    sessionVariables = {
    };

    sessionPath = [
      # "$HOME/.local/bin"
    ];
  };
}

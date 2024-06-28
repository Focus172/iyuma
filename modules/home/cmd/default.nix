{ config, pkgs, unstable, ... }: {
  imports = [ ./broot.nix ];

  home.packages = with pkgs; [ cava ];
}

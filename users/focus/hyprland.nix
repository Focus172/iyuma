{
  pkgs,
  lib,
  inputs,
  config,
  ...
}: let 
  # terminal =  
  # menu
in {
  home = {
    packages = with pkgs; {
      wl-clipboard
      hyprland-legacy
      xwayland
    ];
  };
}

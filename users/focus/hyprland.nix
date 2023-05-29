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
  imports = [
    inputs.hyprland.nixosModules.default
    {
      programs.hyprland = {

      }        
    }
  ]
  home = {
    packages = with pkgs; {
      wl-clipboard
      hyprland-legacy
      xwayland
    ];
  };
}

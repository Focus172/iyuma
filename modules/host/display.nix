{ config, pkgs, pold, ... }: {
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = false;
  };

  programs.river.enable = true;
}

{ config, pkgs, ... }: {
  imports = [ ./grub.nix ];

  # ------------- Input --------------- #
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = [ pkgs.fcitx5-mozc ];
  };
  # ----------------------------------- #

  programs.gnupg.agent = {
    enable = true;
    # pinentryPackage = pkgs.pinentry-gnome3;
    pinentryPackage = pkgs.pinentry-bemenu;
    enableSSHSupport = true;
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [
    # for screen sharing
    pkgs.xdg-desktop-portal-wlr
    # for file picking
    pkgs.xdg-desktop-portal-gtk
  ];

  # services.syncthing.enable = true;
  # services.syncthing.user = "focus";
  # services.syncthing.dataDir = "/home/focus/dox";

  ## Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  # services.blueman.enable = true;
}

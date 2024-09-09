{ config, pkgs, ... }: {
  imports = [ ./grub.nix ];

  # ------------- Input --------------- #
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.addons = [ pkgs.fcitx5-mozc ];
  };
  # ----------------------------------- #

  programs.gnupg.agent = {
    enable = true;
    # pinentryPackage = pkgs.pinentry-gnome3;
    pinentryPackage = pkgs.pinentry-bemenu;
    enableSSHSupport = true;
  };

  # services.syncthing.enable = true;
  # services.syncthing.user = "focus";
  # services.syncthing.dataDir = "/home/focus/dox";

  ## Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  # services.blueman.enable = true;
}

{
  config,
  pkgs,
  ...
}: {

  boot.loader.timeout = 3;
  boot.loader.efi.canTouchEfiVariables = true;

  # boot.loader.systemd-boot.enable = true;

  # Grub Bootloader.
  boot.loader.grub = {
    enable = true;
    # device = "/dev/disk/by-uuid/D442-50BC";
    devices = ["nodev"];
    efiSupport = true;
    configurationLimit = 30;
    # useOSProber = true;
    # font = path
    # fontSize = uint
    # theme = string
  };
}

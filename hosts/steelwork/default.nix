{ config, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix 
  ];

  programs.steam.enable = true;

  boot.loader.efi.efiSysMountPoint = "/boot";

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };

  # Enable thermal data
  services.thermald.enable = true;

  # services.cpupower-gui.enable = true;
  services.power-profiles-daemon.enable = false;
  services.tlp.enable = true;

  # Enables kernel to save battery on lid close
  boot.kernelParams = [ "mem_sleep_default=deep" ];

  # Enables touch id
  services.fprintd.enable = true;

  # Bring in some audio
  security.rtkit.enable = true;

  powerManagement = {
    enable = true;
    powertop.enable = true;
    cpuFreqGovernor = "powersave"; # alt "ondemand"
  };

  networking.hostName = "steelwork";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}

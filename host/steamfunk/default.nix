{ config, pkgs, lib, ... }: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../modules/host/common.nix
    ../../modules/host/grub.nix
    ../../modules/host/desktop.nix
  ];

  networking.hostName = "steamfunk";

  system.stateVersion = "23.11";
}

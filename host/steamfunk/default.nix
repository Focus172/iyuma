{ config, pkgs, lib, ... }: {
  # Include the results of the hardware scan.
  imports = [ ./hardware-configuration.nix ];

  networking.hostName = "steamfunk";


  system.stateVersion = "23.11";
}

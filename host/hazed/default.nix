{ config, pkgs, ... }: {
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.efi.efiSysMountPoint = "/boot";
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # Enable networking
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;

  networking.hostName = "hazed";

  # virtualisation.virtualbox.host.enable = true;
  # virtualisation.virtualbox.guest.enable = true;

  # programs.steam.enable = true;

  programs.river.enable = true;
  programs.neovim.enable = true;

  hardware.bluetooth = {
    enable = false;
    powerOnBoot = false;
  };

  # environment.shells = with pkgs; [ zsh ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # services.xserver = {
  #   layout = "us";
  #   xkbVariant = "";
  # };

  system.stateVersion = "23.11";
}

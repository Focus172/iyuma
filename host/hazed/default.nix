{
  config,
  pkgs,
  ...
}: {
  imports = [./hardware-configuration.nix];

  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  networking.hostName = "hazed";
  virtualisation.virtualbox.host.enable = true;
  # virtualisation.virtualbox.guest.enable = true;

  system.stateVersion = "23.05";
}

{ config, pkgs, ... }: {

  # Asahi things
  hardware.asahi.peripheralFirmwareDirectory = ./firmware;
  hardware.asahi.withRust = true;

  hardware.asahi.useExperimentalGPUDriver = true; 
  # Above implies thing
  # hardware.asahi.addEdgeKernelConfig = true;

  # hardware.asahi.experimentalGPUInstallMode = "driver";

  boot.loader.efi.canTouchEfiVariables = false;

  networking.hostName = "steamfunk";
  
  # programs.hyprland.enable = true;
  # = {
  #   legacyRenderer = true;
  #   enable = true;
  # };

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It’s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05";
}

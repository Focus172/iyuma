{ inputs, outputs, config, pkgs, lib, self, ... }:
{

  imports = [
    ./hardware-configuration.nix
    ./shared.nix
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.modifications
      outputs.overlays.additions
      inputs.nixpkgs-f2k.overlays.stdenvs
      inputs.nixpkgs-f2k.overlays.compositors
      (final: prev:
        {
          awesome = inputs.nixpkgs-f2k.packages.${pkgs.system}.awesome-git;
        })
    ];

    config = {
      allowUnfree = true;
    };
  };

  # networking.useDHCP = false;
  # networking.interfaces.wlo1.useDHCP = true;

  # Packages
  # --------
  boot.kernelPackages = pkgs.linuxPackages_5_15;
  environment.systemPackages = lib.attrValues {
    inherit (pkgs)
      brightnessctl
      wayland
      android-tools;
  };

  services = {
    gvfs.enable = true;
    power-profiles-daemon.enable = false;
    tlp.enable = true;
    upower.enable = true;
  };
}

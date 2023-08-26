{ pkgs, outputs, overlays, lib, ... }: {

  time.hardwareClockInLocalTime = true;

  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.extraConfig = "load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1";
  security.rtkit.enable = true;
  virtualisation.libvirtd.enable = true;

  environment.shells = with pkgs; [ zsh ];

}

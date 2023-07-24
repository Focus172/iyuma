{ pkgs, outputs, overlays, lib, ... }: {

  time.hardwareClockInLocalTime = true;

  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.extraConfig = "load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1";
  security.rtkit.enable = true;
  virtualisation.libvirtd.enable = true;

  environment.systemPackages = with pkgs; [
    ytmdl
    pulseaudio
    libnotify
    xdg-utils
    gtk3
    jq
    st
    spotdl
    python310Packages.pip
    discord
    unzip
    imgclr
    git
    mpv
    xdotool
    simplescreenrecorder
    brightnessctl
    pamixer
    nix-prefetch-git
    python3
    brillo
    wmctrl
    slop
    ripgrep
    maim
  ];

  environment.shells = with pkgs; [ zsh ];
  qt = {
    enable = true;
    platformTheme = "gtk2";
    style = "gtk2";
  };

}

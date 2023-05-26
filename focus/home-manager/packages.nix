{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # tools
    bat exa 
    socat jq htop acpi inotify-tools
    wl-gammactl wlsunset wl-clipboard hyprpicker
    pavucontrol bluez brightnessctl playerctl imagemagick networkmanager

    # fun
    fortune jp2a 
    glow vhs gum 
    slides charm skate
    

    distrobox
    sassc 
    glib
   
    # needed for sourcing bashing scripts
    babelfish

    starship

    # file manager
    # lfsixel
    alejandra

    # langs
    nodejs 
    cargo 
    rustc 
    go
    # nodePackages_latest.typescript
  ];
}

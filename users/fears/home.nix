{
  inputs,
  config,
  pkgs,
  lib,
  ...
}: let
  colors = import ./cols/wave.nix {};
in {
  # some general info
  home.username = "fears";
  home.homeDirectory = "/home/fears";

  # home.file.".icons/default".source = "${pkgs.phinger-cursors}/share/icons/phinger-cursors";


  imports = [
    (import ../shared {inherit inputs lib colors config pkgs;})

    # Importing Configutations
    (import ./utils/rofi/default.nix {inherit config pkgs colors;})
    (import ./utils/waybar.nix {inherit pkgs;})
  ];

  # nix.settings.experimental-features = [ "nix-command" "flakes" ];

  home = {
    activation = {
      # installConfig = ''# shell code in here'';
    };

    packages = with pkgs; [

      # this is a dependency for arch so it needs to be here
      ffmpeg
      brave


      playerctl
      # (pkgs.callPackage ../shared/icons/whitesur.nix {})
      # (pkgs.callPackage ../shared/icons/colloid.nix {})
      # (pkgs.callPackage ../shared/icons/fluent.nix {})
      # (pkgs.callPackage ../shared/icons/elementary.nix {})
      mpd
      starship
      imagemagick
      killall
      cava
      feh
      exa
      gitui
      bat
      alejandra
      brave
      mpc-cli
      pass

      # desktop things
      eww-wayland
      polkit_gnome
      xdg-desktop-portal-hyprland
      swww

    # tools
    jq htop # acpi
    wl-gammactl wlsunset wl-clipboard hyprpicker
    pavucontrol brightnessctl playerctl imagemagick

    # fun
    # fortune jp2a
    # glow vhs gum
    # slides charm skate


    # needed for sourcing bashing scripts
    babelfish

    starship

    # file manager
    # lfsixel

    # langs
    zig
    nodejs
    cargo
    rustc
    go
    # sassc
    # nodePackages_latest.typescript
    ];

    sessionVariables = {
      QT_XCB_GL_INTEGRATION = "none"; # kde-connect
      EDITOR = "nvim";
      VISUAL = "nvim";
      BROWSER = "brave";
      TERMINAL = "foot";
      NIXPKGS_ALLOW_UNFREE = "1";
      SHELL = "fish";
    };

    sessionPath = [
      # "$HOME/.local/bin"
    ];
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
    allowUnfreePredicate = _: true;
  };
}

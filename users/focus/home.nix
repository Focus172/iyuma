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
  home.username = "focus";
  home.homeDirectory = "/home/focus";
  home.stateVersion = "22.11";
  programs.home-manager.enable = true;

  # home.file.".icons/default".source = "${pkgs.phinger-cursors}/share/icons/phinger-cursors";

  # gtk themeing
  gtk = {
    enable = true;
    gtk3.extraConfig.gtk-decoration-layout = "menu:";
    iconTheme.name = "WhiteSur";
    theme.name = "gruvbox-dark-gtk";
  };

  nixpkgs.overlays = [];

  imports = [
    # Importing Configutations
    (import ./utils/rofi/default.nix {inherit config pkgs colors;})
    (import ./utils/waybar.nix {inherit pkgs;})

    (import ./music/cava.nix {inherit colors;})
    (import ./music/mpd.nix {inherit config pkgs;})
    (import ./music/ncmp.nix {inherit config pkgs;})

    (import ./shell/foot.nix {inherit colors;})
    # (import ./shell/fish.nix {inherit config pkgs;})
    (import ./shell/bin/default.nix {inherit config;})

    # (import ./xdg.nix)
    # (import ./gtk-gruv.nix)
  ];

  # nix.settings.experimental-features = [ "nix-command" "flakes" ];

  home = {
    activation = {
      # installConfig = ''# shell code in here'';
    };

    packages = with pkgs; [
      playerctl
      # (pkgs.callPackage ../shared/icons/whitesur.nix {})
      # (pkgs.callPackage ../shared/icons/colloid.nix {})
      # (pkgs.callPackage ../shared/icons/fluent.nix {})
      # (pkgs.callPackage ../shared/icons/elementary.nix {})
      neofetch
      # notion-app-enhanced
      pfetch
      ffmpeg
      # xdg-desktop-portal
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
      waybar
      (nerdfonts.override {
        fonts = ["Hack" "Mononoki"];
      })

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

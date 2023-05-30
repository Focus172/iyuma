{
  inputs,
  config,
  pkgs,
  lib,
  colors,
  ...
}: {
  home.stateVersion = "22.11";
  programs = {
    # allow home-manager to manage itself
    home-manager.enable = true;

    bat.enable = true;
    exa = {
      enable = true;
      enableAliases = true;
    };
    fish = {
      enable = true;
      shellAliases = {
        "cat" = "bat";
        "cd" = "z";
      };
    };
    git = {
      enable = true;
      userName = "Focus172";
      userEmail = "evan.stokdyk@gmail.com";
      extraConfig = {
        credential.helper = "store --file ~/.config/git/.git-credentials";
        init.defaultBranch = "main";
        url."https://github.com/".insteadOf = [ "gh:" "github:" ];
        url."https://gitlab.com/".insteadOf = [ "gl:" "gitlab:" ];
      };
    };
    starship.enable = true;
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.catppuccin-gtk;
      name = "Catppuccin-Dark";
    };
  };


  imports = [
    # Importing Configutations
    (import ./music/cava.nix {inherit colors;})
    (import ./music/mpd.nix {inherit config pkgs;})
    (import ./music/ncmp.nix {inherit config pkgs;})

    (import ./shell/foot.nix {inherit colors;})
    (import ./shell/fish.nix {inherit config pkgs;})
    (import ./shell/bin/default.nix {inherit config;})

    (import ./utils/rofi/default.nix {inherit config pkgs colors;})
    (import ./utils/waybar {inherit pkgs;})
  ];

  home = {
    activation = {
      # these projects use jemalloc which doesnt work with 32k page size
      # this means that the packaged verison can not work on some systems
      cargoInstall = ''
        # cargo install fd-find
      '';
    };
    packages = with pkgs; [
      pfetch
      cava
      feh
      exa
      gitui
      bat
      alejandra
      mpc-cli
      pass
      bottom
      handlr-regex
      ripgrep
      fzf

      ### desktop things
      eww-wayland
      xdg-desktop-portal-hyprland
      swww

      (nerdfonts.override {fonts = ["Hack" "Mononoki"];})

      ### tools
      jq
      htop
      # acpi
      # wl-gammactl
      # wlsunset
      # wl-clipboard
      # hyprpicker
      pavucontrol
      brightnessctl
      playerctl
      imagemagick

      # fun
      fortune
      neo-cowsay
      jp2a
      glow
      gum
      slides
      charm
      # vhs
      skate

      # file manager
      lf
      # lf-sixel

      # langs
      rustup
      zig
      nodejs
      go
      sassc
      gcc

      alsa-utils
      brightnessctl
      cliphist
      # direnv
      grim
      # insomnia
      libreoffice-fresh
      mako
      ripgrep
      # rustdesk
      slurp
      swayidle
      # swaylock-effects
      # virt-manager
      wl-clipboard
    ];

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      BROWSER = "brave";
      TERMINAL = "foot";
      SHELL = "fish";
      NIXPKGS_ALLOW_UNFREE = "1";
    };

    sessionPath = [];

    file = {
      # ".config/eww".source = ./configs/eww;
      # ".config/hypr".source = ./configs/hypr;
      ".config/mako".source = ./configs/mako;
      ".config/swayidle".source = ./configs/swayidle;
      ".config/swaylock".source = ./configs/swaylock;
    };

  };

  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
    allowUnfreePredicate = _: true;
  };
}

{
  inputs,
  config,
  pkgs,
  lib,
  ...
}: let
  colors = import ./cols/wave.nix {};
in {
  home.username = "focus";
  home.homeDirectory = "/home/focus";

  # programs.fish.loginShellInit = '' 
  #   source ~/.nix-profile/etc/profile.d/nix.fish
  # '';

  home.stateVersion = "22.11";
  programs = {
    # allow home-manager to manage itself
    home-manager.enable = true;

    bat.enable = true;
    ripgrep.enable = true;
    exa = {
      enable = true;
      enableAliases = true;
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
    go = {
      enable = true;
      goPath = ".local/share/go";
      goBin = ".local/share/go/bin";
    };
    imv = {
      enable = true;
      # config = ''test'';
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
    ## Importing Configutations
    (import ./music/cava.nix {inherit colors;})
    (import ./music/mpd.nix {inherit config pkgs;})
    (import ./music/ncmp.nix {inherit config pkgs;})

    (import ./shell/foot.nix {inherit colors;})
    (import ./shell/fish.nix {inherit config pkgs;})
    (import ./shell/bin/default.nix {inherit config;})

    (import ./utils/rofi/default.nix {inherit config pkgs colors;})
    # (import ./utils/waybar {inherit pkgs;})
  ];

  home = {
    activation = {
      ## these projects use jemalloc which doesnt work with 32k page size
      ## this means that the packaged verison can not work on some systems
      # cargoInstall = ''
      #   # cargo install fd-find
      # '';
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
      tmux

      ### desktop things
      eww-wayland
      xdg-desktop-portal-hyprland
      swww
      gitoxide
      neovim

      (nerdfonts.override {fonts = ["Hack" "Mononoki"];})

      ### tools
      jq
      htop
      yt-dlp
      # acpi
      # wl-gammactl
      # wlsunset
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
      skate
      # vhs

      # file manager
      lf
      # lf-sixel

      # langs
      rustup
      zig
      nodejs
      sassc

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
      # virt-manager
      wl-clipboard

      # swaylock-effects
      # swayidle

      brave
      nginx
      killall
      lutris

      tty-clock

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

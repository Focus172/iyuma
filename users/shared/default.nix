{
  inputs,
  config,
  pkgs,
  lib,
  ...
}: let
  colors = import ./cols/wave.nix {};
in {
  # programs.fish.loginShellInit = '' 
  #   source ~/.nix-profile/etc/profile.d/nix.fish
  # '';

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
  };

  imports = [
    ## Importing Configutations
    (import ./shell/fish.nix {inherit config pkgs;})
    (import ./shell/bin/default.nix {inherit config;})
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
      exa
      gitui
      bat
      alejandra
      pass
      bottom
      handlr-regex
      ripgrep
      fzf
      tmux
      gitoxide
      neovim
      (nerdfonts.override {fonts = ["Hack" "Mononoki"];})
      jq
      yt-dlp



      bacon
      imagemagick
      fortune
      neo-cowsay
      glow
      gum
      slides
      charm
      skate
      # vhs
      # lf
      rustup
      zig
      nodejs
      sassc

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


  };

  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
    allowUnfreePredicate = _: true;
  };
}

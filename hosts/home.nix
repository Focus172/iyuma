{ config, lib, pkgs, user, ... }: {

  home.stateVersion = "23.05";
  # programs.home-manager.enable = true;

  imports = (import ./shared);
    programs.firefox.enable = true;

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";

    packages = with pkgs; [
      ### applictions
      rofi-wayland
      brave # TODO: remove brave
      pavucontrol
      cpupower-gui

      ### Terminal Utils
      alacritty cool-retro-term

      exa bat pfetch
      pass bottom
      ripgrep fzf
      starship
      zellij # mprocs
      lf

      ### Utils
      zathura imv
      yt-dlp
      imagemagick

      ### Languaes
      gitui gitoxide
      bacon

      go rustup zig
      # sassc
      ghc cabal-install
      flutter python310 # node


        handlr-regex
      xdg-utils
        jql
        swaybg # swww
        wl-gammactl
        wlsunset

        brightnessctl
        alsa-utils
        grim
        libreoffice-fresh
        mako
        slurp
        wl-clipboard

        # neo-cowsay
        # glow gum
        # slides charm
        # skate vhs
        # blender
        # acpi
        # hyprpicker
        # nginx
        # ani-cli
        # obsidian
        # obs-studio
      deluge
      # protonvpn-gui


        discord
        killall
        cava
        tty-clock
        mpv
        clang
        btar
        fd
        file
        ffmpeg
        gnumake just
        unzip
        libnotify
        newsboat
      vorbis-tools
      appimage-run

      pinentry # pinentry-rofi


      ## Neovim deps
      stylua
      lua-language-server
      alejandra
      taplo
      neovim
      statix
      zls
      haskell-language-server

      ### Games
      dolphin-emu
      # retroarch

      ### study
      memento
      onscripter-en
    ];

    pointerCursor = {
      gtk.enable = true;
      name = "Catppuccin-Mocha-Dark-Cursors";
      package = pkgs.catppuccin-cursors.mochaDark;
      size = 36;
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Compact-Mauve-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = ["mauve"];
        size = "compact";
        variant = "mocha";
      };
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    font.name = "Hack Nerd Font Medium";
  };
}

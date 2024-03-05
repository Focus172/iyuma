{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./gtk.nix
    # ./lock.nix
  ];

  home.packages = with pkgs; [
    (pkgs.callPackage ./jerry.nix {})

      fish

      alacritty
      fzf
      broot
      eza
      gnumake
      just
      starship
      rustup
      bun
      clang # zig
      swww
      # gnome.nautilus
      rofi-wayland
      pass
      wl-clipboard
      fdupes
      shellcheck
      taplo
      bat
      gitui
      (waybar.override {hyprlandSupport = true;})
      imv
      neofetch
      bottom
      # pinentry-rofi
      pinentry-qt
      pdftk
      imagemagick
      grim
      slurp
      mpv
      zathura
      mako
      libnotify
      zoom-us

      clerk
      mpd
      brightnessctl
      unzip
      wget
      newsboat
      ripgrep
      yt-dlp
      cava
      nmap
      mediainfo
      zellij
      rsync
      jq
      # libreoffice-fresh
      discord

      ani-cli
      obsidian
      # obs-studio
      killall
      tty-clock
      file
      ffmpeg
      btar
      # blender
      pfetch

      drive
      komikku
      # heroic

      pavucontrol
      networkmanagerapplet
      pkg-config
      porsmo
      spotify
      vscodium

      playerctl
      bluetuith

      chocolate-doom

      rclone
      rclone-browser

      mprocs
      du-dust
      wiki-tui
      insync

      alejandra
      brave
      firefox
      handlr-regex

      # neo-cowsay
  ];
}

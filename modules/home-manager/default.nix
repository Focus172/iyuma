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
    hyprlock

    (pkgs.callPackage ./jerry.nix {})
    fish
    shfmt
    alacritty
    fzf
    broot
    eza
    gnumake just
    starship
    rustup
    bun
    clang # zig
    swww
    gnome.nautilus
    rofi-wayland

    #rofi-emoji
    #(rofimoji.override {x11Support = false;})

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
    # komikku

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
    # firefox
    handlr-regex
    # neo-cowsay
    # browserpass

    heroic
    clang-tools
  ];
}

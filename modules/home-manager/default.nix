{
  config,
  pkgs,
  unstable,
  ...
}: {
  imports = [
    ./gtk.nix
    ./dwl
    ./cmd
    ./shell.nix
  ];

  home.packages = with pkgs; [
    # TODO: better emacs
    emacs
    # - obsidian.el
    # - doom-emacs.el

    ### Shell
    alacritty
    fish
    eza
    bat
    fzf
    starship
    gitui

    # (pkgs.callPackage ./pkgs/jerry.nix {})

    ### Langs
    rustup elixir
    zig clang
    gleam erlang
    go
    # bun nodejs

    elixir-ls zls
    lua-language-server
    gopls shellcheck
    # haskell-language-server


    ### Tools
    gnumake just

    ### Lsp (try to limit use of)
    shfmt stylua alejandra

    swww
    gnome.nautilus
    rofi-wayland

    pass

    wl-clipboard
    fdupes
    taplo
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

    # clerk
    mpd
    mpc-cli
    # ncmpcpp

    brightnessctl
    unzip
    btar
    wget
    newsboat
    ripgrep
    yt-dlp
    nmap
    mediainfo
    zellij
    rsync
    jq
    discord
    # hyperfine
    # libreoffice-fresh

    ani-cli
    obsidian
    obs-studio
    killall
    tty-clock
    file
    ffmpeg
    blender
    pfetch

    # drive

    # X komikku

    pavucontrol
    networkmanagerapplet
    pkg-config
    porsmo
    spotify
    vscodium

    playerctl
    bluetuith

    chocolate-doom

    # rclone
    # rclone-browser

    mprocs
    du-dust
    wiki-tui
    # insync

    brave
    handlr-regex
    # neo-cowsay
    # browserpass

    heroic

    clang-tools

    inotify-tools

    # tinycompress

    ## Tooling
    # bacon
    #
    # cool-retro-term
    # jupyterlab
    #
    # sddm-theme-corners-git sddm
    #
    # xdg-utils
    # tldr
    #
    # // grim + slurp
    # // OR
    # // maim + slop
    #
    # fd
    #
    # unzip
    # wget
    # vorbis-tools
    # yt-dlp
    #
    # man-db
    # mediainfo
    # linux-headers
    # qastools
    #
    # nm-connection-editor
    #
    # net-tools
    # netctl
    #
    # gitoxide
    # nano
    #
    # cpupower-openrc",
    # alsa-utils-openrc",
    # amd-ucode",
    # intel-ucode",
    # artix-archlinux-support",
    # cronie-openrc",
    # dhcpcd-openrc",
    # lsb-release",
    # lvm2-openrc",
    # mdadm-openrc",
    # memtest86+",
    # mkinitcpio-openswap",
    # nfs-utils-openrc",
    # ntp-openrc",
    # openssh-openrc",
    # rsync-openrc",
    # vkd3d",
    # wpa_supplicant-openrc",
    # gtk3",
    # jq",
    # gtk-theme-iris-dark-git",
    #
    # acpid-openrc
    # b43-fwcutter
    # cups
    # ecryptfs-utils
    # gwenview
    # haveged-openrc
    # inxi
    # libva-vdpau-driver
    # libvdpau-va-gl
    # markdownpart
    # nbd
    # openrc-settingsd
    # partitionmanager
    # powertop
    # print-manager
    # raw-thumbnailer
    # scrot
    # spectacle
    # svgpart
    # sweeper
    # texinfo
    # tumbler
    # pip3
    # unzip
    # imgclr
    # xdotool
    # simplescreenrecorder
    # pamixer
    # brillo
    # ndctl
    # xfsprogs

    # archey
    # diff-pdf
    # difftastic
    # duf
    # gpatch
    # loc
    # micro
    # ncdu
    # opam
    # open-mpi
    # openblas
    # pdfgrep
    # peco
    # plplot
    # redis
    # scc
    # swiftformat
    # swiftlint
    #
    # terminal-notifier
    # ugit
    # zlib
    #
    # basictex
    # db-browser-for-sqlite
    # notunes
    # openinterminal
    # orbstack
    # raycast
    # rio
    # swimat
    # syntax-highlight

    # sassc
    # ghc
    # flutter
    # python 
    # node

    # jql
    # swww
    # wl-gammactl
    # wlsunset

    # alsa-utils
    # libreoffice-fresh
    # wl-clipboard

    # neo-cowsay
    # glow gum
    # slides charm
    # skate vhs
    # acpi
    # nginx
    # obs-studio
    # deluge

    # killall
    # tty-clock
    # clang
    # btar
    file
    # ffmpeg
    # unzip

    appimage-run
    # pinentry-rofi

    bemenu
    pinentry-bemenu
    # bemoji

    ### Games
    # dolphin-emu
    # retroarch

    ### study
    # memento
    # onscripter-en

    # "pulseaudio-alsa",
    # "amd-ucode",
    # "intel-ucode",
    # // b43-fwcutter
    # // bluez-openrc
    # // cronie-openrc
    # // cryptsetup-openrc
    # // cups-openrc
    # // dhcpcd-openrc
    # // dmraid
    # // haveged-openrc
    # // inxi
    # // libva-vdpau-driver
    # // libvdpau-va-gl
    # // lsb-release
    # // lvm2-openrc
    # // man-pages
    # // markdownpart
    # // mdadm-openrc
    # // memtest86+
    # // mkinitcpio-openswap
    # // nbd
    # // nfs-utils-openrc
    # // ntp-openrc
    # // openrc-settingsd
    # // openssh-openrc
    # // powertop
    # // raw-thumbnailer
    # "rsync",
    # // scrot
    # // svgpart
    # // sweeper
    # "sysfsutils",
    # // syslog-ng-openrc
    # // texinfo
    # // tumbler
    # "vkd3d",
    # "wpa_supplicant-openrc",

    # hugo

    # // "re2",
    # // "btrfs-progs"
    #
    # // "android-udev",
    # // "baobab",
    # // "bazel",
    # "bear",
    # "catch2",
    # "chocolate-doom",
    # "cmake",
    # // "eslint",
    # // "flake8" # python formating
    # gitoxide",
    # gptfdisk",
    # libgnomekbd",
    # libmfx",
    # loupe",
    # meson",
    # minecraft-launcher",
    # modrinth-app",
    # mpdevil",
    # nano",
    # nautilus",
    # nim",
    # obs-studio",
    # pdftk",
    # python-black",
    # scdoc",
    # snapshot",
    # stb",
    # xdg-user-dirs-gtk",
    neovide
  ] ++ [
    unstable.hyprlock
  ];


}

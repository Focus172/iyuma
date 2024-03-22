{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./gtk.nix
    ./dwl
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
    broot
    starship
    gitui

    # (pkgs.callPackage ./pkgs/jerry.nix {})

    hyprlock

    ### Langs
    rustup
    bun
    clang
    zig

    elixir
    elixir-ls
    stylua
    gleam
    erlang
    zig
    zls
    lua-language-server
    nodejs
    go
    gopls
    alejandra
    # haskell-language-server

    ### Tools
    gnumake
    just

    ### Lsp (try to limit use of)
    shfmt
    shellcheck

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
    cava
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
    insync

    brave
    handlr-regex
    # neo-cowsay
    # browserpass

    heroic

    clang-tools

    inotify-tools

    # tinycompress

    #
    # // ## Tooling
    # ctx.add(["just", "make", "bacon"]);
    # ctx.add("base-devel".b().on_os("linux"));
    #
    # ctx.add(["alacritty", "cool-retro-term"]);
    # ctx.add("jupyterlab".b().on_os("macos"));
    #
    # // WM
    # ["rofi-wayland", "hyprland", "waybar", "wayland"]
    # // And DM
    # ctx.add(["sddm-theme-corners-git", "sddm"].b().on_os("linux"));
    # "sddm-openrc"
    #
    # // ----- Libs ------
    # ctx.add(["libgit2", "openssh"]);
    #
    # // ---- Utils -------
    # "xdg-utils".b().on_os("linux"),
    # "tldr".b(),
    # "imagemagick".b(),
    # ctx.add(["libnotify", "mako"]);
    #
    #
    # // grim + slurp
    # // OR
    # // maim + slop
    #
    # // Fancy Shell tools
    # ctx.add(["lf", "bat", "bottom", "eza", "fd", "fzf", "mpv"]);
    #
    # // Other Shell tools
    # ctx.add(["brightnessctl", "unzip", "wget"].b().on_os("linux"));
    # "vorbis-tools", "yt-dlp"]);

    #
    # swaybg
    # man-db
    # mediainfo
    # linux-headers
    # qastools
    #
    #
    # nm-connection-editor
    #
    # net-tools
    # netctl
    #
    #
    # gitoxide
    # nano
    # pfetch
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
    # man-pages
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
    # "simplescreenrecorder",
    # pamixer
    # brillo
    # ripgrep
    # ndctl
    # xfsprogs
    # ### - archey
    # # - diff-pdf
    # # - difftastic
    # ### - duf
    # ### - gpatch
    # ### - loc
    # # - micro
    # # - ncdu
    # # - opam
    # ### - open-mpi
    # # - openblas
    # # - pdfgrep
    # # - peco
    # # - plplot
    # # - redis
    # ### - scc
    # # - swiftformat
    # # - swiftlint
    #
    # ### - terminal-notifier
    #// ### - ugit
    #// # - zlib
    #
    # # - basictex
    # # - db-browser-for-sqlite
    # # - notunes
    # ### - openinterminal
    # ### - orbstack
    # ### - raycast
    # ### - rio
    # ### - swimat
    # # - syntax-highlight
    #
    # sassc
    # ghc
    # flutter
    # python310 node
    #
    # jql
    # swaybg swww
    # wl-gammactl
    # wlsunset
    #
    # brightnessctl
    # alsa-utils
    # libreoffice-fresh
    # wl-clipboard
    #
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
    # // sddm-openrc
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
    # ctx.add(["dmraid", "evtest", "sysfsutils"].b().on_os("linux"));
    # ctx.add(["grub", "base"].b().on_os("linux"));
    #
    # // "android-udev",
    # // "baobab",
    # // "bazel",
    # "bear",
    # "blender",
    # "catch2",
    # "chocolate-doom",
    # "cmake",
    # // "eslint",
    # // "flake8" # python formating
    # "gitoxide",
    # // "gnome-calculator",
    # // "gnome-calendar",
    # // "gnome-characters",
    # // "gnome-connections",
    # // "gnome-font-viewer",
    # // "gnome-logs",
    # // "gnome-maps",
    # // "gnome-shell-extension-gsconnect",
    # // "gnome-shell-extension-gtile",
    # // "gnome-tweaks",
    # // "gnome-weather",
    # "gptfdisk",
    # "libgnomekbd",
    # "libmfx",
    # "loupe",
    # "meson",
    # "minecraft-launcher",
    # "modrinth-app",
    # "mpdevil",
    # "nano",
    # "nautilus",
    # "nim",
    # "obs-studio",
    # "obsidian",
    # "pdftk",
    # "pfetch",
    # // "python-black",
    # "scdoc",
    # "snapshot",
    # "stb",
    # "xdg-user-dirs-gtk",


  ];
}

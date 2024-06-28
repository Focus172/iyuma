{ config, pkgs, unstable, getchoo, ... }: {
  imports = [ ./shell.nix ./theme.nix ./cmd ./firefox ./emacs ./neovim ];

  # requires: `security.pam.services.swaylock = {};`
  # programs.swaylock.enable = true;

  home.packages = (with pkgs; [
    foot
    bemenu
    sandbar

    ### Shell
    eza
    bat
    fzf
    starship
    tmux
    # gitui

    # (pkgs.callPackage ./pkgs/jerry.nix {})

    ## Langs
    rustup
    # go
    # nim
    # gleam
    # erlang
    # elixir
    zig
    # bun nodejs
    # sassc
    # ghc
    # flutter

    ### Python
    # jupyter
    python3
    # pip3

    # python-black
    # flake8

    ### Tools
    clang # gcc
    gnumake
    # just

    # bazel meson cmake
    # qtcreator qt6.full

    ### Lsp (try to limit use of)
    # elixir-ls
    shellcheck
    zls
    # gopls
    clang-tools
    # lua-language-server
    # haskell-language-server
    # swiftlint

    #### Formating
    shfmt
    stylua
    nixfmt-classic
    # swiftformat

    ### Music
    # mpd
    # mpc-cli
    # mpdevil # clerk ncmpcpp
    spotify

    swww
    pass
    wl-clipboard
    fdupes
    taplo
    imv
    bottom
    pdftk
    imagemagick
    mpv
    zathura
    mako
    libnotify
    brightnessctl
    unzip
    btar
    wget
    newsboat
    ripgrep
    yt-dlp
    nmap
    mediainfo
    rsync
    jq
    discord
    # hyperfine
    libreoffice-fresh
    obs-studio
    killall
    tty-clock
    file
    ffmpeg
    blender
    pfetch
    # drive
    pavucontrol
    networkmanagerapplet
    pkg-config
    porsmo
    playerctl
    bluetuith
    mprocs
    du-dust
    wiki-tui
    handlr-regex
    # neo-cowsay
    # browserpass
    inotify-tools
    cool-retro-term
    tlrc
    fd
    # xdg-utils
    # vorbis-tools
    # man-db
    # mediainfo
    # linux-headers
    # qastools
    # nm-connection-editor
    # net-tools
    # netctl
    # gitoxide
    # cpupower-openrc
    # alsa-utils-openrc
    # cronie-openrc
    # dhcpcd-openrc
    # lsb-release
    # vscodium
    # lvm2-openrc
    # mdadm-openrc
    # memtest86+
    # mkinitcpio-openswap
    # nfs-utils-openrc
    # ntp-openrc
    # openssh-openrc
    # vkd3d
    # wpa_supplicant-openrc
    # gtk3
    # acpid-openrc
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
    # raw-thumbnailer
    # scrot
    # spectacle
    # svgpart
    # sweeper
    # texinfo
    # tumbler
    # imgclr
    # xdotool
    # simplescreenrecorder
    # pamixer
    # brillo
    # ndctl
    # xfsprogs
    # archey
    # gpatch
    # loc
    # micro
    # opam
    # open-mpi
    # openblas
    # peco
    # plplot
    # sccache
    # basictex
    # orbstack
    # swimat
    # alsa-utils
    # neo-cowsay
    # glow gum
    # slides charm
    # skate vhs
    # acpi
    # nginx
    # deluge
    file
    # bluez-openrc
    # cronie-openrc
    # cryptsetup-openrc
    # cups-openrc
    # dhcpcd-openrc
    # dmraid
    # haveged-openrc
    # inxi
    # libva-vdpau-driver
    # libvdpau-va-gl
    # lsb-release
    # lvm2-openrc
    # man-pages
    # markdownpart
    # mdadm-openrc
    # mkinitcpio-openswap
    # nbd
    # nfs-utils-openrc
    # ntp-openrc
    # openrc-settingsd
    # openssh-openrc
    # powertop
    # raw-thumbnailer
    # scrot
    # svgpart
    # sweeper
    # sysfsutils
    # syslog-ng-openrc
    # texinfo
    # tumbler
    # vkd3d
    # wpa_supplicant-openrc
    # hugo
    # re2
    # btrfs-progs
    # catch2
    # gitoxide
    # gptfdisk
    # libmfx
    # loupe
    # nano
    # scdoc
    # snapshot
    # stb
    neovide
    # wasmtime

    zoom-us

    # qutebrowser

    # rclone
    # rclone-browser
    ## OR
    # insync

    # grim slurp
    maim slop

    ### Games
    heroic
    lutris
    # dolphin-emu retroarch
    # minecraft

    ### Japanese
    memento
    komikku
    ani-cli

    # gnome-extension-manager

    obsidian
  ]) ++ (with getchoo; [
    # modrinth-app
  ]);
}

{ config, pkgs, unstable, ... }: {
  imports = [ ./theme.nix ./cmd ./firefox ./emacs ];

  # requires: `security.pam.services.swaylock = {};`
  # programs.swaylock.enable = true;

  home.packages = (with pkgs; [
    alsa-utils
    # (pkgs.callPackage ./pkgs/jerry.nix {})

    # cargo rustc rust-analyzer # alternaticly: rustup
    zig zls
    gdb clang

    ghidra

    tmux

    ## Langs
    # go
    # nim
    # gleam
    # erlang
    # elixir
    # bun nodejs
    # sassc
    # ghc
    # flutter

    ## Python
    # jupyter
    # python3
    # pip3

    ### Tools
    # clang gcc
    # gnumake
    # just

    # bazel meson cmake
    # qtcreator qt6.full

    ### Lsp (try to limit use of)
    # elixir-ls
    # shellcheck
    # gopls
    # clang-tools
    # lua-language-server
    # haskell-language-server
    # swiftlint

    #### Formating
    # shfmt
    # stylua
    # nixfmt-classic
    # swiftformat
    # taplo

    ### Music
    # mpd
    # mpc-cli
    # mpdevil # clerk ncmpcpp

    spotify
    discord

    newsboat
    mpv

    pass
    # fdupes
    # pdftk
    # imagemagick

    zathura
    mako
    libnotify
    brightnessctl

    unzip
    btar
    libarchive

    # wget
    ripgrep
    yt-dlp
    # mediainfo
    # rsync # provided by system
    # jq
    # hyperfine
    # libreoffice-fresh
    # obs-studio
    killall
    tty-clock
    file
    ffmpeg
    # blender
    pfetch
    # drive
    pavucontrol
    # networkmanagerapplet
    porsmo
    # playerctl
    bluetuith
    # mprocs
    du-dust
    # wiki-tui
    xdg-utils
    # handlr-regex
    # neo-cowsay
    # browserpass
    # inotify-tools
    cool-retro-term
    fd

    # Security
    # nmap

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
    # inxi

    # dmraid
    # libva-vdpau-driver
    # libvdpau-va-gl
    # lsb-release
    # lvm2-openrc
    # man-pages
    # markdownpart
    # mdadm-openrc
    # nbd
    # nfs-utils-openrc
    # openrc-settingsd
    # powertop
    # scrot
    # svgpart
    # sweeper
    # sysfsutils
    # syslog-ng-openrc
    # texinfo
    # vkd3d
    # wpa_supplicant-openrc
    # re2
    # btrfs-progs
    # catch2
    # gitoxide
    # gptfdisk
    # loupe
    # scdoc
    # snapshot
    # stb
    neovide
    # wasmtime

    # TODO: install this before school starts
    # zoom-us

    # rclone
    # rclone-browser
    ## OR
    # insync

    grim
    slurp
    # maim slop

    ### Games
    # heroic
    # lutris

    ### Japanese
    # memento
    # komikku
    # ani-cli

    obsidian
    # qutebrowser

    # godot_4
  ]);
}

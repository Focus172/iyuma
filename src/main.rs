//! Configuration for packages to install

fn main() {
    let mut ctx = yuma::ctx();

    ctx.add_if_hosts(
        &["steambox", "steamfunk"],
        &[
            // # - acpi
            // # - acpid-openrc
            "alsa-utils-openrc",
            "amd-ucode",
            "intel-ucode",
            "artix-archlinux-support",
            "b43-fwcutter",
            // # - cronie-openrc
            // "cryptsetup-openrc",
            // # - cups-openrc
            "dhcpcd-openrc",
            "dmraid",
            "grub",
            // # - ecryptfs-utils
            // # - gwenview
            // # - haveged-openrc
            // # - inxi

            // ### The likely broke it
            // # - libva-vdpau-driver
            // # - libvdpau-va-gl
            "lsb-release",
            "lvm2-openrc",
            // # - man-pages
            // # - markdownpart
            "mdadm-openrc",
            "memtest86+",
            "mkinitcpio-openswap",
            // # - nbd
            "nfs-utils-openrc",
            "ntp-openrc",
            // # - nvidia
            // # - openrc-settingsd
            "openssh-openrc",
            // # - partitionmanager
            // # - powertop
            // # - print-manager
            // # - raw-thumbnailer
            "rsync-openrc",
            // # - scrot
            "sddm-openrc",
            // # - spectacle
            // # - svgpart
            // # - sweeper
            // # - syslog-ng-openrc
            // # - terminus-font
            // # - texinfo
            // # - tumbler
            "vkd3d",
            "wpa_supplicant-openrc",
            // ytmdl
            // pulseaudio
            // libnotify
            // xdg-utils
            // gtk3
            // jq
            // st
            // spotdl
            // python310Packages.pip
            // discord
            // unzip
            // imgclr
            // git
            // mpv
            // xdotool
            // simplescreenrecorder
            // brightnessctl
            // pamixer
            // nix-prefetch-git
            // brillo
            // wmctrl
            // slop
            // ripgrep
            // maim
        ],
    );

    // # Audio
    // aon gjalg nfa
    //
    // ## Alsa
    ctx.add(&["alsa-tools", "alsa-utils", "alsa-firmware"]);
    // ## Clients
    ctx.add(&["pavucontrol", "mpd", "mpc", "ncmpcpp"]);

    // # Code
    ctx.add(&["neovim"]);
    // ## Lsp
    ctx.add(&["lua-language-server", "zls"]);
    // ## Langs
    ctx.add(&["rustup", "zig", "clang", "nodejs"]);
    // ## Tooling
    ctx.add(&["just", "make", "base-devel", "bacon"]);

    ctx.add(&[
        // -------- Utils -------
        "xdg-utils",
        "imv",
        "networkmanager-qt",
        "imagemagick",
        "brightnessctl",
        "wayland",
        "hyprland",
        "waybar",
        "ttf-hack-nerd",
        "ttf-mononoki-nerd",
        "alacritty",
        "cool-retro-term",
        "libgit2",
        "openssh",
        "unzip",
        "wget",
        "starship",
        "lf",
        "zsh",
        "bat",
        "bottom",
        "broot",
        "exa",
        "fd",
        "fzf",
        "gnupg",
        "mpv",
        "newsboat",
        "pass",
        "ripgrep",
        "vorbis-tools",
        "yt-dlp",
        "zellij",
        "rsync",
        "hyperfine",
        "mako",
        "swaybg",
        "man-db",
        // # media-info
        // - net-tools
        // # netctl
        // # pacman-contrib
        // # tinycompress
        // ndctl
        // xfsprogs
        // # gitoxide
        // # gh
        // # jql
        // # discord
        "nano",
        "dmraid",
        "evtest",
        // "powertop",
        // "re2",
        "grub",
        "base",
        "sysfsutils",
        // # btrfs-progs
    ]);

    // ------- Firefox --------
    ctx.add(&["firefox", "firefox-pwa"]);

    // -------- Aur ---------
    ctx.add(&[
        "rofi-lbonn-wayland",
        "pfetch",
        "zsh-antidote",
        "sddm-theme-corners-git",
    ]);

    // ### applictions
    // # brave
    // # pavucontrol
    // - cpupower-gui
    // - zellij
    // - lf
    // - bottom
    //
    //       # exa bat pfetch
    //       # pass
    //       # ripgrep fzf
    //       # starship
    //
    //       ### Utils
    // - zathura
    // - imv
    // - yt-dlp
    // - imagemagick
    //
    //
    // - sassc
    // - ghc
    // - cabal-install
    // - flutter
    // - python310 # node
    //
    // - xdg-utils
    // - jql
    // - swaybg # swww
    // - wl-gammactl
    // - wlsunset
    //
    // - brightnessctl
    // - alsa-utils
    // - grim
    // - libreoffice-fresh
    // - mako
    // - slurp
    // - wl-clipboard
    //
    //         # neo-cowsay
    //         # glow gum
    //         # slides charm
    //         # skate vhs
    //         # blender
    //         # acpi
    //         # hyprpicker
    //         # nginx
    //         # ani-cli
    //         # obsidian
    //         # obs-studio
    // - deluge
    //
    //
    // - discord
    // - killall
    // - cava
    // - tty-clock
    // - mpv
    // - clang
    // - btar
    // - fd
    // - file
    // - ffmpeg
    // - gnumake just
    // - unzip
    // - libnotify
    // - newsboat
    // - vorbis-tools
    // - appimage-run
    //
    // - pinentry
    //
    //
    // ## Neovim deps
    // - stylua
    // - lua-language-server
    // - taplo
    // - neovim
    // - zls
    // - haskell-language-server
    //
    // ### Games
    // - dolphin-emu
    // # retroarch
    //
    // ### study
    // - memento
    // - onscripter-en

    ctx.add_if_host("steambox", &["bottles", "steam"]);

    ctx.add_if_host(
        "steambox",
        &[
            "hugo",
            "linux-headers",
            "meson",
            "nm-connection-editor",
            "nmap",
            "powertop",
            "pulseaudio-alsa",
            "qastools",
        ],
    );

    ctx.add_if_host(
        "steambox",
        &[
            // ### for powermanagement and event, bad for desktop,
            // ### look into for laptop
            // # - acpi
            "amd-ucode",
            "intel-ucode",
            "cpupower-openrc",
            // "acpid-openrc"

            // - alsa-firmware
            // - alsa-utils-openrc
            // - pulseaudio-alsa
            // # - amd-ucode
            // - artix-archlinux-support
            // - b43-fwcutter
            // # - bluez-openrc
            // # - cronie-openrc
            // - cryptsetup-openrc
            // # cups-openrc
            // - dhcpcd-openrc
            // - dmraid
            // - haveged-openrc
            // - inxi
            // - libva-vdpau-driver
            // - libvdpau-va-gl
            // - lsb-release
            // - lvm2-openrc
            // # man-pages
            // # - markdownpart
            // - mdadm-openrc
            // - memtest86+
            // - mkinitcpio-openswap
            // # - nbd
            // - nfs-utils-openrc
            // - ntp-openrc
            // # - openrc-settingsd
            // - openssh-openrc
            // # - powertop
            // - raw-thumbnailer
            "rsync-openrc",
            // # - scrot
            // - sddm-openrc
            // # - svgpart
            // # - sweeper
            "sysfsutils",
            // # - syslog-ng-openrc
            // # - texinfo
            // # - tumbler
            "vkd3d",
            "wpa_supplicant-openrc",
            // aur
            "gtk-theme-iris-dark-git",
        ],
    );

    ctx.add_if_host(
        "hazed",
        &[

    // - linux-asahi-edge
    // - mesa-asahi-edge
    // - archlinuxarm-keyring
    // - pipewire-alsa
    // - pipewire-pulse
    // - asahi-meta
    // - netctl
    // # - antidote
    // ### - archey
    // # - diff-pdf
    // # - difftastic
    // ### - duf
    // ### - gpatch
    // # - hugo
    // ### - loc
    // # - micro
    // # - ncdu
    // # - nmap
    // # - opam
    // ### - open-mpi
    // # - openblas
    // # - pdfgrep
    // # - peco
    // # - plplot
    // # - redis
    // ### - scc
    // # - shellcheck
    // # - swiftformat
    // # - swiftlint
    // ### - terminal-notifier
    // - tldr
    // ### - ugit
    // # - zlib
    //
    // # - teamookla/speedtest/speedtest
    // # - basictex
    // # - db-browser-for-sqlite
    // # - notunes
    // ### - openinterminal
    // ### - orbstack
    // ### - raycast
    // ### - rio
    // ### - swimat
    // # - syntax-highlight
    ],
    );

    ctx.add(&["paru", "pacman"]);

    yuma::update(ctx).unwrap();
}

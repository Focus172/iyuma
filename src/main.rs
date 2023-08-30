//! Configuration for packages to install

mod colors;

// #[yuma::doc]
fn main() {
    let mut ctx = yuma::ctx();

    // # Audio
    // fake docs and stuff
    //
    // ## Alsa
    ctx.add(&["alsa-tools", "alsa-utils", "alsa-firmware"]);
    // ## Clients
    ctx.add(&["pavucontrol", "mpd", "mpc", "ncmpcpp"]);

    // # Code
    ctx.add(&["neovim"]);
    // ## Lsp
    ctx.add(&["lua-language-server", "zls", "taplo-cli"]);
    // ctx.add(&["stylua", "haskell-language-server", "shellcheck"]);

    // ## Langs
    ctx.add(&["rustup", "zig", "clang", "nodejs"]);
    // ## Tooling
    ctx.add(&["just", "make", "base-devel"]);

    ctx.add(&["alacritty", "cool-retro-term"]);

    // "wayland",
    ctx.add(&["sddm-theme-corners-git"]);
    ctx.add(&["rofi-lbonn-wayland", "hyprland", "waybar"]);

    ctx.add(&["zsh", "zsh-antidote"]);

    ctx.add(&[
        // -------- Utils -------
        "xdg-utils",
        "tldr",
        "bacon",
        "imv",
        "networkmanager-qt",
        "imagemagick",
        "brightnessctl",
        "ttf-hack-nerd",
        "ttf-mononoki-nerd",
        "libgit2",
        "openssh",
        "unzip",
        "wget",
        "starship",
        "lf",
        "bat",
        "bottom",
        "broot",
        "exa",
        "fd",
        "fzf",
        "mpv",
        "newsboat",
        "pass",
        "gnupg",
        "ripgrep",
        "vorbis-tools",
        "yt-dlp",
        "zellij",
        "rsync",
        "hyperfine",
        "mako",
        "swaybg",
        "man-db",
        "mediainfo",
        "nm-connection-editor",
        "nmap",
        // "linux-headers",
        "qastools",
        // "net-tools",
        // "netctl",
        // # pacman-contrib
        // # tinycompress
        // ndctl
        // xfsprogs
        // # gitoxide
        // # gh
        // # jql
        "discord",
        "nano",
        "pfetch",
        // ### - archey
        // # - diff-pdf
        // # - difftastic
        // ### - duf
        // ### - gpatch
        // ### - loc
        // # - micro
        // # - ncdu
        // # - opam
        // ### - open-mpi
        // # - openblas
        // # - pdfgrep
        // # - peco
        // # - plplot
        // # - redis
        // ### - scc
        // # - swiftformat
        // # - swiftlint
        // ### - terminal-notifier
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
    ]);

    // ------- Firefox --------
    ctx.add(&["firefox", "firefox-pwa"]);

    ctx.add_if_hosts(
        &["steambox", "steamfunk"],
        &[
            "cpupower-openrc",
            // "acpid-openrc"
            "alsa-utils-openrc",
            "amd-ucode",
            "intel-ucode",
            "artix-archlinux-support",
            // "b43-fwcutter",
            "cronie-openrc",
            // "cryptsetup-openrc",
            // "cups-openrc",
            "dhcpcd-openrc",
            // ecryptfs-utils
            // gwenview
            // haveged-openrc
            // inxi

            // libva-vdpau-driver
            // libvdpau-va-gl
            "lsb-release",
            "lvm2-openrc",
            // man-pages
            // markdownpart
            "mdadm-openrc",
            "memtest86+",
            "mkinitcpio-openswap",
            // nbd
            "nfs-utils-openrc",
            "ntp-openrc",
            // openrc-settingsd
            "openssh-openrc",
            // partitionmanager
            // powertop
            // print-manager
            // raw-thumbnailer
            "rsync-openrc",
            // scrot
            "sddm-openrc",
            // spectacle
            // svgpart
            // sweeper
            // syslog-ng-openrc
            // terminus-font
            // texinfo
            // tumbler
            "vkd3d",
            "wpa_supplicant-openrc",
            // ytmdl
            // pulseaudio
            // libnotify
            // xdg-utils
            // gtk3
            // jq
            // st
            // pip3
            // unzip
            // imgclr
            // xdotool
            // simplescreenrecorder
            // brightnessctl
            // pamixer
            // brillo
            // slop
            // ripgrep
            // maim
        ],
    );

    // ### applictions
    // # pavucontrol
    // exa bat pfetch
    // pass
    // ripgrep fzf
    // starship
    //
    // ### Utils
    // zathura
    // imv
    // yt-dlp
    // imagemagick
    //
    //
    // sassc
    // ghc
    // flutter
    // python310 # node
    //
    // xdg-utils
    // jql
    // swaybg # swww
    // wl-gammactl
    // wlsunset
    //
    // brightnessctl
    // alsa-utils
    // grim
    // libreoffice-fresh
    // mako
    // slurp
    // wl-clipboard
    //
    // neo-cowsay
    // glow gum
    // slides charm
    // skate vhs
    // blender
    // acpi
    // hyprpicker
    // nginx
    // ani-cli
    // obsidian
    // obs-studio
    // deluge
    //
    //
    // killall
    // cava
    // tty-clock
    // mpv
    // clang
    // btar
    // fd
    // file
    // ffmpeg
    // unzip
    // libnotify
    // appimage-run
    // pinentry-rofi
    //
    // ### Games
    // dolphin-emu
    // retroarch
    //
    // ### study
    // memento
    // onscripter-en
    // "meson",

    ctx.add_if_host("steambox", &["bottles", "steam"]);

    // "hugo",
    ctx.add_if_host("steambox", &["pulseaudio-alsa"]);

    ctx.add_if_host(
        "steambox",
        &[
            // ### for powermanagement and event, bad for desktop,
            // ### look into for laptop
            "amd-ucode",
            "intel-ucode",
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
        &["linux-asahi-edge", "mesa-asahi-edge", "asahi-meta"]
    );
    ctx.add_if_host(
        "hazed",
        &["pipewire-alsa", "pipewire-pulse", "archlinuxarm-keyring"]
    );

    // "re2",
    // "btrfs-progs"
    ctx.add(&["dmraid", "evtest", "sysfsutils"]);
    ctx.add(&["grub", "base"]);

    // TODO: Make a insure sane method
    ctx.add(&["paru", "pacman"]);

    ctx.update();
}

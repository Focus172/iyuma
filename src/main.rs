#![feature(lazy_cell)]

//! Configuration for packages to install

use std::{cell::LazyCell, env};

mod asahi;
mod desktop;

// const HOSTNAME: LazyCell<String> = LazyCell::new(|| env::var("HOST").unwrap());

fn main() {
    let mut ctx = yuma::ctx();

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

    // if "steamfunk" == HOSTNAME.as_str() {
        ctx.add(&[
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
        ]);
    // }

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

    // if "steambox" == HOSTNAME.as_str() {
    //     desktop::add(&mut ctx);
    // }

    // if "hazed" == HOSTNAME.as_str() {
    //     asahi::add(&mut ctx);
    // }

    ctx.add(&["paru", "pacman"]);

    yuma::update(ctx).unwrap();
}

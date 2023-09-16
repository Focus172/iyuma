//! Configuration for packages to install

use yuma::prelude::*;

mod colors;
mod web;

fn main() -> Result<(), YumaError> {
    yuma::init_logger()?;

    let mut ctx = ctx();

    // # Audio
    // fake docs and stuff
    //
    // ## Alsa
    ctx.add(["alsa-tools", "alsa-utils", "alsa-firmware"]);
    // - pulseaudio-alsa
    // - alsa-utils-openrc
    // tinycompress

    // ## Clients
    ctx.add(["pavucontrol", "mpd", "mpc", "ncmpcpp"]);

    // # Code
    ctx.add(["neovim"]);
    // ## Lsp
    ctx.add(["lua-language-server", "zls", "taplo-cli", "stylua"]);

    // "shellcheck"]);
    // "haskell-language-server",

    ctx.add(["emacs"]);

    // ## Langs
    ctx.add(["rustup", "zig", "clang", "nodejs"]);
    // ## Tooling
    ctx.add(["just", "make", "base-devel", "bacon"]);

    ctx.add(["alacritty", "cool-retro-term"]);

    // WM
    ctx.add(["rofi-lbonn-wayland", "hyprland", "waybar", "wayland"]);
    // And DM
    ctx.add([
        "sddm-theme-corners-git",
        "sddm",
    ]);
    ctx.add(["sddm-openrc".b().on_hosts(&["steambox", "steamfunk"])]);

    ctx.add(["zsh", "zsh-antidote"]);

    // ----- Libs ------
    ctx.add(["libgit2", "openssh"]);

    // ---- Utils -------
    ctx.add(["xdg-utils", "tldr", "imagemagick"]);
    ctx.add(["libnotify", "mako"]);

    ctx.add(["imv", "grim", "slurp"]);

    ctx.add(["ttf-hack-nerd", "ttf-mononoki-nerd"]);

    // Fancy Shell tools
    ctx.add(["lf", "bat", "bottom", "eza", "fd", "fzf", "mpv"]);

    // Other Shell tools
    ctx.add(["brightnessctl", "unzip", "wget"]);
    ctx.add(["broot", "newsboat", "ripgrep", "vorbis-tools", "yt-dlp"]);
    ctx.add(["zellij", "rsync", "hyperfine"]);

    ctx.add(["starship"]);

    // Needs alsa kernal modules
    ctx.add(["cava"]);

    // Security
    ctx.add(["pass", "gnupg"]);
    ctx.add(["nmap"]);

    ctx.add(["swaybg", "man-db", "mediainfo", "linux-headers", "qastools"]);

    // "nm-connection-editor",
    // "networkmanager-qt",
    // "net-tools",
    // "netctl",

    // # gh
    ctx.add(["gitoxide", "nano", "pfetch"]);

    // ======== Applications ==========
    ctx.add(["discord"]);
    // ------------- Web --------------
    crate::web::install(&mut ctx)?;

    // "sddm-openrc",
    ctx.add(
        [
            "cpupower-openrc",
            // "acpid-openrc",
            "alsa-utils-openrc",
            "amd-ucode",
            "intel-ucode",
            "artix-archlinux-support",
            // "b43-fwcutter",
            "cronie-openrc",
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
            // spectacle
            // svgpart
            // sweeper
            // texinfo
            // tumbler
            "vkd3d",
            "wpa_supplicant-openrc",
            "gtk3",
            "jq",
            // st
            // pip3
            // unzip
            // imgclr
            // xdotool
            // "simplescreenrecorder",
            // pamixer
            // brillo
            // ripgrep
            "gtk-theme-iris-dark-git",
        ]
        .b()
        .on_hosts(&["steambox", "steamfunk"]),
    );
    // ndctl
    // xfsprogs
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
    //
    // ### - terminal-notifier
    // ### - ugit
    // # - zlib
    //
    // # - basictex
    // # - db-browser-for-sqlite
    // # - notunes
    // ### - openinterminal
    // ### - orbstack
    // ### - raycast
    // ### - rio
    // ### - swimat
    // # - syntax-highlight

    // Alternative to grim + slurp
    // maim, slop

    // sassc
    // ghc
    // flutter
    // python310 node
    //
    // jql
    // swaybg swww
    // wl-gammactl
    // wlsunset
    //
    // brightnessctl
    // alsa-utils
    // libreoffice-fresh
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
    // killall
    // tty-clock
    // clang
    // btar
    // file
    // ffmpeg
    // unzip
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

    ctx.add(
        ["steam", "heroic-games-launcher"]
            .b()
            .on_hosts(&["steambox"]),
    );

    ctx.add(
        [
            "pulseaudio-alsa",
            "amd-ucode",
            "intel-ucode",
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
            "hugo",
        ]
        .b()
        .on_hosts(&["steambox"]),
    );

    ctx.add(
        [
            "linux-asahi-edge",
            "mesa-asahi-edge",
            "asahi-meta",
            "archlinuxarm-keyring",
        ]
        .b()
        .on_hosts(&["hazed"]),
    );

    ctx.add(
        ["pipewire-alsa", "pipewire-pulse"]
            .b()
            .on_hosts(&["hazed"]),
    );

    // "re2",
    // "btrfs-progs"
    ctx.add(["dmraid", "evtest", "sysfsutils"]);
    ctx.add(["grub", "base"]);

    // TODO: Make a insure sane method
    ctx.add(["paru", "pacman"]);

    ctx.add(["neofetch".b().on_hosts(&["not a host"])]);

    ctx.update();

    Ok(())
}

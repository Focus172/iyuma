# This file is ran on all fish shells but only does anything on once shells

set -q __init_config_sourced; and exit
set -gx __init_config_sourced 1


set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_CACHE_HOME "$HOME/.cache"

export LESSHISTFILE=-

set -gx RUSTUP_HOME "$XDG_DATA_HOME/rustup"
set -gx CARGO_HOME "$XDG_DATA_HOME/cargo"
set -gx GNUPGHOME "$XDG_DATA_HOME/gnupg"
set -gx PASSWORD_STORE_DIR "$XDG_DATA_HOME/pass"
# export npm_config_prefix="$XDG_DATA_HOME/npm"


if string match Darwin (uname) >/dev/null
    export XDG_DESKTOP_DIR="$HOME/Desktop"
    export XDG_DOCUMENTS_DIR="$HOME/Documents"
    export XDG_DOWNLOAD_DIR="$HOME/Downloads"
    export XDG_MUSIC_DIR="$HOME/Music"
    export XDG_PICTURES_DIR="$HOME/Pictures"

    export PATH="$PATH:/opt/homebrew/opt/coreutils/libexec/gnubin"
else
    export XDG_DESKTOP_DIR="$HOME/cur"
    export XDG_DOCUMENTS_DIR="$HOME/dox"
    export XDG_DOWNLOAD_DIR="$HOME/dl"
    export XDG_MUSIC_DIR="$HOME/aud"
    export XDG_PICTURES_DIR="$HOME/pix"
    #export XDG_PUBLICSHARE_DIR="$HOME"
end

export EDITOR="nvim"
export READER="zathura"
export VISUAL="nvim"
# export TERMINAL="foot"
export BROWSER="brave"
export VIDEO="mpv"
export IMAGE="imv"
export OPENER="handlr open"
# export PAGER="less"
export WM="Hyprland"
# export MANPAGER='less'
# export XDG_CURRENT_DESKTOP='Hyprland'
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"

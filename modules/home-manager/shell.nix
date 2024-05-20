{
  config,
  pkgs,
  ...
}: {
  home.sessionVariables = let
    data-home = "$HOME/.local/share";
  in {
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = data-home;
    XDG_CACHE_HOME = "$HOME/.cache";
    # export XDG_DESKTOP_DIR="$HOME/cur"; # this moves the location of where `.desktop` files go
    XDG_DOCUMENTS_DIR = "$HOME/dox";
    XDG_DOWNLOAD_DIR = "$HOME/dl";
    XDG_MUSIC_DIR = "$HOME/aud";
    XDG_PICTURES_DIR = "$HOME/pix";
    XDG_PUBLICSHARE_DIR = "$HOME";

    RUSTUP_HOME = "${data-home}/rustup";
    CARGO_HOME = "${data-home}/cargo";
    GNUPGHOME = "${data-home}/gnupg";
    PASSWORD_STORE_DIR = "${data-home}/pass";

    VISUAL = "nvim";
    EDITOR = "emacs";
    READER = "zathura";
    TERMINAL = "alacritty";
    BROWSER = "firefox";
    # BROWSER = "brave";
    VIDEO = "mpv";
    IMAGE = "imv";
    OPENER = "handlr open";
    PAGER = "less";
    MANPAGER = "less";

    HISTORY_IGNORE = "(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..|clear)";
    LESSHISTFILE = "-";

  };

  # PATH="$PATH:$HOME/.local/bin:$CARGO_HOME/bin:$HOME/dev/scripts"
  # PATH="$PATH:$HOME/.local/share/go/bin/"
  # export PATH="$PATH:$HOME/.local/bin:$CARGO_HOME/bin:$HOME/.config/scripts"

  programs = {
    direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };

    bash = {
      enable = true;
      # This runs on all shells not just interactive ones
      bashrcExtra = ''
        PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
        export HISTFILE="$USER/.local/share/bash/history"
      '';
    };
  };

  programs.starship.enable = true;
  programs.starship.enableFishIntegration = true;
  programs.starship.enableBashIntegration = false;

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting
      fish_vi_key_bindings
    '';
  };

  xdg = {
    configHome = "/home/focus/.config";
  };

  # xdg.dataHome Absolute path to directory holding application data.	path
  # xdg.cacheHome	Absolute path to directory holding application caches.	path
  # xdg.stateHome	Absolute path to directory holding application states.	path
  # xdg.mimeApps.enable	Whether to manage {file}`$XDG_CONFIG_HOME/mimeapps.list`. The generated file is read-only.	boolean
  # xdg.userDirs.enable
}

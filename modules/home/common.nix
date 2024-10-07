{ config, pkgs, ... }: {
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

  # programs.starship.enable = true;
  # programs.starship.enableFishIntegration = true;
  # programs.starship.enableBashIntegration = false;

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting
      fish_vi_key_bindings
    '';
  };

  # xdg = { configHome = "/home/focus/.config"; };
}

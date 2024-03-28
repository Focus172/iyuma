{
  config,
  pkgs,
  ...
}: {
  programs = {
    direnv = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true; # loaded as a part of fish, does nothing
      nix-direnv.enable = true;
    };

    bash = {
      enable = true;
      # [ -e "$HOME/.env" ] && . "$HOME/.env"

      # This runs on all shells not just interactive ones
      bashrcExtra = ''
        PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
        HISTFILE="$USER/.local/share/bash/history"
      '';
    };
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting
      # export PATH="$PATH:$HOME/.local/bin:$CARGO_HOME/bin:$HOME/.config/scripts"
      fish_vi_key_bindings
    '';
  };
}

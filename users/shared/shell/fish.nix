{ config, pkgs, ... }: {
  programs.fish = {
    enable = true;

    shellAliases = {
      e = "nvim";
      i = "imv";
      land = "cat $HOME/.config/george.txt | cowsay -W 70";
      sdn = "shutdown -h now";
      cd = "z";
    };

    shellAbbrs = {
      gu = "gitui";
    };

    loginShellInit = ''
      set -g --export XDG_DATA_DIRS $HOME/.nix-profile/share:/usr/local/share/:/usr/share/
      set -g --export FONTCONFIG_FILE ${pkgs.fontconfig.out}/etc/fonts/fonts.conf
    '';

    interactiveShellInit = ''
      set -g fish_greeting 
      if string match 'Darwin' (uname) > /dev/null
          /opt/homebrew/bin/brew shellenv | source
      end
    '';

    shellInit = ''
    '';
  };

  imports = [./starship.nix ];
  # programs.starship.enable = true;
}

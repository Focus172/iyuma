{ config, pkgs, ... }: {
  programs.fish = {
    enable = true;

    shellAliases = {
      ls = "exa";
      la = "ls -a";
      e = "nvim";
      land = "cat $HOME/.config/george.txt | cowsay -W 70";
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
    '';

    shellInit = ''
    '';
  };

  programs.starship = {
    enable = true;
    # settings = {
    #   format = "$directory$git_branch$git_status$cmd_duration\n[ ](fg:blue)  ";
    #   git_branch.format = "via [$symbol$branch(:$remote_branch)]($style) ";
    #   command_timeout = 1000;
    # };
  };
}

{ config, pkgs, ... }: {
  programs.fish = {
    # enable = true;

    shellAliases = {
      ls = "exa";
      la = "ls -a";
      e = "nvim";
    };

    # useBabelfish = true;

    interactiveShellInit = ''
      # starship init fish | source &
      # cat ~/.nix-profile/etc/profile.d/hm-session-vars.sh | babelfish | source
    '';

    shellInit = ''
      set -g XDG_DATA_DIRS $HOME/.nix-profile/share:/usr/local/share/:/usr/share/
      set -g fish_greeting 
      set --global --export FONTCONFIG_FILE ${pkgs.fontconfig.out}/etc/fonts/fonts.conf
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

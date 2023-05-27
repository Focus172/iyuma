{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;

    shellAliases = {
      la = "exa -l";
      ls = "ls --color=auto";
      v = "nvim";
      suda = "sudo -E -s";
    };
    history = {
      expireDuplicatesFirst = true;
      save = 512;
    };

    initExtra = ''
      # export PATH=${config.home.homeDirectory}/.local/bin:${config.home.homeDirectory}/.local/share/nvim/mason/bin:$PATH
      # export LD_LIBRARY_PATH=${config.home.homeDirectory}/.config/awesome:${pkgs.lua54Packages.lua}/lib/:${pkgs.pam}/lib
    '';
  };

  # programs.starship = {
    # enable = true;
    # settings = {
    #   format = "$directory$git_branch$git_status$cmd_duration\n[ ](fg:blue)  ";
    #   git_branch.format = "via [$symbol$branch(:$remote_branch)]($style) ";
    #   command_timeout = 1000;
    # };
  # };
}

{ config, pkgs, ... }: {
  programs.neovim = {
    enable = true;
    # plugins = with pkgs.vimPlugins; [
    #   sniprun
    #   rose-pine
    # ];

    withNodeJs = false;
    withPython3 = false;
    withRuby = false;
  };

  xdg.configFile = {
    "nvim/init.lua".source = ./init.lua;
    # "nvim/lazy-lock.json".source = ./lazy-lock.json;
  };
}

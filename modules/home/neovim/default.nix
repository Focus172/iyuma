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

  # home.packages = [pkgs.firefoxpwa];
}

{ config, pkgs, ... }: {

  imports = [ ./shell.nix ./neovim ./display.nix ];
}

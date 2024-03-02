{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [./pwa.nix];

  programs.firefox.enable = true;
}

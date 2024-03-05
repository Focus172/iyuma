{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [];

  home.packages = [
    (callPackage ./pwa.nix {})
  ];

  programs.firefox.enable = true;
}

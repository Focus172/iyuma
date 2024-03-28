{
  config,
  pkgs,
  unstable,
  ...
}: {

  imports = [
    ./broot.nix
  ];

  home.packages = with pkgs; [ cava ];

  xdg.configFile."cava/config".file = ./cava.toml;
};

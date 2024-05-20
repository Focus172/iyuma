{
  config,
  pkgs,
  unstable,
  ...
}: {
  imports = [./broot.nix];

  home.packages = with pkgs; [cava];
  home.file.".config/cava/config".source = ./cava.toml;
}

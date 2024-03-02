{
  config,
  pkgs,
  ...
}: {
  imports = [./jerry.nix ./firefox ./lock.nix];
}

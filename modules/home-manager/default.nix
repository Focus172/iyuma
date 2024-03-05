{
  config,
  pkgs,
  ...
}: {
  imports = [
    # ./firefox
    # ./lock.nix
  ];

  home.packages = [
    (callPackage ./jerry.nix {})
  ];
}

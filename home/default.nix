{...}: {
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = {};

  home-manager.users.focus = import ./focus.nix;
}

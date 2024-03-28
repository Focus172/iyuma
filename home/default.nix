{
    unstable,
    ...
}: {
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.extraSpecialArgs = {
    inherit unstable;
  };

  home-manager.users.focus = import ./focus.nix;
}

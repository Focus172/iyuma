{
    unstable, 
    # getchoo-pkgs,
    ...
}: {
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.extraSpecialArgs = {
    inherit unstable;
    # inherit getchoo-pkgs;
  };

  home-manager.users.focus = import ./focus.nix;
}

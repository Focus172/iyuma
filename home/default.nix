{
  nixpkgs,
  home-manager,
  ...
}: let
  lib = nixpkgs.lib;
  home-lib = home-manager.lib;

  system = "x86_64-linux";
  pkgs = import nixpkgs {
    system = system; # inherit system;
    config.allowUnfree = true;
  };
in {
  focus = home-lib.homeManagerConfiguration {
    pkgs = pkgs; # inherit pkgs;

    modules = [
      ./focus.nix
      ../modules/home-manager
    ];
  };
}

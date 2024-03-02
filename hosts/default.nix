{
  inputs,
  nixpkgs,
  # nixpkgs-unstable,
  ...
}: let
  system = "x86_64-linux";
  pkgs = import nixpkgs {
    system = system; # inherit system;
    config.allowUnfree = true;
  };
  lib = nixpkgs.lib;
  user = "focus";
  # unstable = import nixpkgs-unstable {
  #   inherit system;
  #   config.allowUnfree = true;
  # };
in {
  steamfunk = lib.nixosSystem {
    system = system; # inherit system;

    # args that are passed to each of the modules
    specialArgs = {
      inputs = inputs; # inherit inputs user;
      user = user;
      host.hostName = "steamfunk";
    };
    modules = [
      ./steamfunk
      ../modules/nixos
      # ./home.nix
    ];
    # ++ ( import ../modules/home-manager {} );
  };
}

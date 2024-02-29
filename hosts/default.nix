{
  lib, inputs, nixpkgs,
  # nixpkgs-unstable,
  user,
  ...
}:
let
  system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
  # unstable = import nixpkgs-unstable {
  #   inherit system;
  #   config.allowUnfree = true;
  # };
in {
  steamfunk = lib.nixosSystem {
    inherit system;
    specialArgs = {
        inherit inputs user;
        host.hostName = "steamfunk";
    };
    modules = [
        # ./home.nix
        ./steamfunk
        # ../modules/nixos
    ];
  };
}

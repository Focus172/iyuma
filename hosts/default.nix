{ lib, inputs, nixpkgs, nixpkgs-unstable, user, hyprland, ... }:
let
  system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
  unstable = import nixpkgs-unstable {
    inherit system;
    config.allowUnfree = true;
  };
in {
  steelwork = lib.nixosSystem {
    inherit system;
    specialArgs = {
        inherit unstable inputs user;
        host = {
            hostName = "steelwork";
        };
    };
    modules = [
        # hyprland.nixosModules.default
        ./configuration.nix
        ./steelwork
    ];
  };
}



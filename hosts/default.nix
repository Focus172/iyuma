{ lib, inputs, home-manager, nixpkgs, nixpkgs-stable, user, hyprland, ... }:
let
  system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
  pkgs-stable = import nixpkgs-stable {
    inherit system;
    config.allowUnfree = true;
  };
in {
  steelwork = lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit inputs system user hyprland pkgs-stable;
      host = {
        hostName = "steelwork";
      };
    };
    modules = [
      # hyprland.nixosModules.default
      ./host.nix
      ./steelwork
      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = {
          inherit user pkgs-stable;
          host = {
            hostName = "steelwork";
          };
        };
        home-manager.users.${user} = {
          imports = [
            ./home.nix
            ./steelwork/home.nix
          ];
        };
      }
    ];
  };
}

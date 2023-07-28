{ lib, inputs, home-manager, nixpkgs, user, hyprland, ... }:
let
  system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
in {
  steelwork = lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit inputs system user hyprland;
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
        inherit user;
          host = {
            hostName = "steelwork";
          };
        };
        home-manager.users.${user} = {
          imports = [
            ./home.nix
            # ./steelwork/home.nix
          ];
        };
      }
    ];
  };
}

{
  description = "nixos config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hardware.url = "github:NixOS/nixos-hardware/master";
  };

  # This request each of the arguments from the flake registry. It is how you
  # get data from each thing you brought into scope.
  #
  # @ inputs to add it as an arg i think
  # The imports a map which is assined to this value each key is a thing that
  # can be build as config when no name is passed then `default` is built.
  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [ ];
      };
    in {
      nixosConfigurations.steamfunk = nixpkgs.lib.nixosSystem {
        inherit system;

        # args that are passed to each of the modules
        specialArgs = { inherit inputs; };
        modules = [
          ./host/steamfunk
          inputs.hardware.nixosModules.framework-13th-gen-intel
        ];
      };

      nixosConfigurations.hazed = nixpkgs.lib.nixosSystem {
        inherit system;

        # args that are passed to each of the modules
        specialArgs = { inherit inputs; };
        modules =
          [ ./host/hazed inputs.hardware.nixosModules.apple-macbook-pro-12-1 ];
      };

      homeConfigurations.ginger = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home/ginger.nix ];
        extraSpecialArgs = { inherit inputs; };
      };

      homeConfigurations.focus = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home/focus.nix ];
        extraSpecialArgs = { inherit inputs; };
      };
    };
}

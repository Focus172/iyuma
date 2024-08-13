{
  description = "Nixos config";

  inputs = {
    # nixpkgs-old.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hardware.url = "github:NixOS/nixos-hardware/master";
  };

  # This request each of the arguments from the flake registry. It is how you
  # get data from each thing you brought into scope.
  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      user = "focus";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [];
      };
    in {
      # @ inputs to add it as an arg i think
      # The imports a map which is assined to this value each key is a thing that
      # can be build as config when no name is passed then `default` is built.
      nixosConfigurations.steamfunk = nixpkgs.lib.nixosSystem {
        inherit system;

        # args that are passed to each of the modules
        specialArgs = { inherit inputs; };
        modules = [
          ./modules/host
          ./modules/host/grub.nix
          ./modules/host/desktop.nix
          ./host/steamfunk
          inputs.hardware.nixosModules.framework-13th-gen-intel
        ];
      };

      nixosConfigurations.hazed = nixpkgs.lib.nixosSystem {
        inherit system;

        # args that are passed to each of the modules
        specialArgs = { inherit inputs; };
        modules = [
          ./modules/host
          ./host/hazed
          # inputs.hardware.nixosModules.framework-13th-gen-intel
        ];
      };

      homeConfigurations."ginger" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
         ./modules/home
         ./home/focus.nix
        ];
        extraSpecialArgs = {
          # inherit inputs;
        };
      };

      homeConfigurations."${user}" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
         ./modules/home
         ./modules/home/desktop.nix
         ./home/focus.nix
        ];
        extraSpecialArgs = {
          # inherit inputs;
        };
      };
    };
}

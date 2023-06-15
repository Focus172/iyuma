{
  description = "Stupid dumb very bad sysconf";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
  } @ inputs: let
    inherit (self) outputs;

    # system = "x86_64-linux";
    # builtins.currentSystem;
    system = "aarch64-darwin";

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    lib = nixpkgs.lib;
  in {
    # user configurations
    homeConfigurations = {
      focus = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {inherit inputs outputs self;};
        modules = [
          ./users/focus
        ];
      };
      evan = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {inherit inputs outputs self;};
        modules = [
          ./users/evan
        ];
      };
    };

    # host configurations
    nixosConfigurations = {
      steambox = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [./hosts/steambox];
      };
    };

    steambox = self.nixosConfigurations.steambox.config.system.build.toplevel;
  };
}

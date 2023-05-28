{
  description = "Stupid dumb very bad sysconf";

  inputs = {
    # Package sources.
    home-manager.url = "github:nix-community/home-manager";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Channel to follow.
    # home-manager.inputs.nixpkgs.follows = "unstable";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
  } @ inputs: let
    inherit (self) outputs;
    # system = builtins.currentSystem;
    system = "aarch64-linux";
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
          ./users/focus/home.nix
          {
            home.username = "focus";
            home.homeDirectory = "/home/focus";
          }
        ];
      };
      fears = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {inherit inputs outputs self;};
        modules = [
          ./users/fears/home.nix
          {
            home.username = "fears";
            home.homeDirectory = "/home/fears";
          }
        ];
      };
    };

    # host configurations
    nixosConfigurations = {
      steambox = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [ ./hosts/steambox ];
      };
      steamfunk = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [ ./hosts/steamfunk ];
      };
    };

    steambox = self.nixosConfigurations.steambox.config.system.build.toplevel;
    steamfunk = self.nixosConfigurations.steamfunk.config.system.build.toplevel;
  };
}

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
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    lib = nixpkgs.lib;
  in {
    # user configurations
    homeConfigurations = {
      focus = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
        extraSpecialArgs = {inherit inputs outputs self;};
        modules = [
          ./focus/home.nix
          {
            home.username = "focus";
            home.homeDirectory = "/home/focus";
          }
        ];
      };
    };
  };
}

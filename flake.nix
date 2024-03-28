{
  description = "Nixos config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nix-doom-emacs.url = "github:nix-community/nix-doom-emacs";
  };

  # This request each of the arguments from the flake registry. It is how you
  # get data from each thing you brought into scope.
  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixpkgs-unstable,
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      system = system; # inherit system;
      config.allowUnfree = true;
    };
    lib = nixpkgs.lib;
    user = "focus";
    unstable = import nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    # @ inputs to add it as an arg i think
    # The imports a map which is assined to this value each key is a thing that
    # can be build as config when no name is passed then `default` is built.
    #
    # `inherit` is the same as saying `name = name` when calling a function.
    #
    # In summary, what this line does is import a function from `./hosts` and
    # then call it with 3 arguments. It just so happens that the names of that
    # each of those values exists in this scope and have the same name.
    nixosConfigurations.steamfunk = lib.nixosSystem {
      inherit system;

      # args that are passed to each of the modules
      specialArgs = {
        # inputs = inputs;
        inherit user;
        host.hostName = "steamfunk";

        inherit unstable;
      };
      modules = [
        ./hosts/steamfunk
        ./modules/nixos

        home-manager.nixosModules.home-manager
        ./home
      ];
    };
  };
}

{
  description = "Nixos config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
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
  }: {
    # Home manager can be built with nix run . -- switch --flake .
    defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;

    # @ inputs to add it as an arg i think
    # The imports a map which is assined to this value each key is a thing that
    # can be build as config when no name is passed then `default` is built.
    #
    # `inherit` is the same as saying `name = name` when calling a function.
    #
    # In summary, what this line does is import a function from `./hosts` and
    # then call it with 3 arguments. It just so happens that the names of that
    # each of those values exists in this scope and have the same name.
    nixosConfigurations = let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        system = system; # inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
      user = "focus";
      # unstable = import nixpkgs-unstable {
      #   inherit system;
      #   config.allowUnfree = true;
      # };
    in {
      steamfunk = lib.nixosSystem {
        system = system; # inherit system;

        # args that are passed to each of the modules
        specialArgs = {
          # inputs = inputs;
          user = user; # inherit user;
          host.hostName = "steamfunk";
        };
        modules = [
          home-manager.nixosModules.home-manager

          ./hosts/steamfunk
          ./modules/nixos

          ./home
        ];
      };
    };
    # homeConfigurations = import ./home {inherit nixpkgs home-manager;};
  };
}

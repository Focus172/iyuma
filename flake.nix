{
  description = "Nixos config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # This request each of the arguments from the flake registry. It is how you
  # get data from each thing you brought into scope.
  outputs = {
    nixpkgs,
    home-manager,
    # self,
    # inputs,
    ...
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
    nixosConfigurations = import ./hosts {inherit nixpkgs;}; # inherit inputs

    homeConfigurations = import ./home {inherit nixpkgs home-manager;};
  };
}

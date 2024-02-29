{
  description = "Nixos config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    # nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # home-manager = {
    #   url = "github:nix-community/home-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    # The imports a map which is assined to this value each key is a thing
    # that can be build as config when no name is passed then `default` is
    # built.
    #
    # `inherit` is the same as saying `name = name` when calling a function.
    #
    # In summary, what this line does is import a function from `./hosts` and
    # then call it with 3 arguments. It just so happens that the names of that
    # each of those values exists in this scope and have the same name.
    nixosConfigurations = import ./hosts { inherit inputs nixpkgs user; };
  };
}

{
  description = "Nixos config";

  inputs = {
    nixpkgs-old.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # https://github.com/NixOS/nixos-hardware/tree/master/framework/13-inch

    # firefox-addons = {
    #   url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
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
        overlays = [
          # (final: prev: {
          #   xdg-open = pkgs.writeShellScriptBin "handlr-open" ''
          #     ${prev.handlr}/bin/handlr open $@
          #   '';
          # })
        ];
      };
      pold = import inputs.nixpkgs-old { inherit system; };
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
      nixosConfigurations.steamfunk = nixpkgs.lib.nixosSystem {
        inherit system;

        # args that are passed to each of the modules
        specialArgs = {
          inherit pold;
          inherit inputs;
        };
        modules = [ ./modules/host ./host/steamfunk ];
      };

      homeConfigurations."${user}" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./modules/home ./home/focus.nix ];
        extraSpecialArgs = {
          # inherit inputs;
        };
      };
    };
}

{
  inputs =
    {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
      nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

      hyprland = {
        url = "github:vaxerski/Hyprland";
        inputs.nixpkgs.follows = "nixpkgs";
      };
    };

  outputs = inputs @ { self, nixpkgs, nixpkgs-unstable, hyprland, ... }:
    let
      user = "focus";
    in
    {
      nixosConfigurations = (
        import ./hosts {                                                    # Imports ./hosts/default.nix
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs nixpkgs-unstable user hyprland;
        }
      );
    };
}


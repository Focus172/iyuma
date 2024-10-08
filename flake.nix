{
  description = "nixos config";

  inputs = rec {
    nixpkgs.url = github:nixos/nixpkgs/a1ff09664a29517a20ce2891402c4d84c1004084;
    hardware.url = "github:NixOS/nixos-hardware/master";

    nixpkgs-emacs-pin.url = github:NixOs/nixpkgs/f3dab3509afca932f3f4fd0908957709bb1c1f57;
    nix-doom-emacs = {
      # TODO: uses flake utils, have rest of installed packages then follow this
      url = github:nix-community/nix-doom-emacs;
      inputs.nixpkgs.follows = "nixpkgs-emacs-pin";
    };
  };

  # This request each of the arguments from the flake registry. It is how you
  # get data from each thing you brought into scope.
  #
  # @ inputs to add it as an arg i think
  # The imports a map which is assined to this value each key is a thing that
  # can be build as config when no name is passed then `default` is built.
  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        # overlays = [ (final: prev: { }) ];
      };

      # Shared functions
      iyuma = {
        mkSystem = modules: nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs system; };
          inherit system modules;
        };
        mkTool = name: code: {
          type = "app";
          program = "${pkgs.writeShellScriptBin name code}/bin/${name}";
        };
      };
    in {
      # run with `nix run .#stow`
      apps."${system}".stow = iyuma.mkTool "stow-config" ''
        ${pkgs.stow}/bin/stow --target $HOME/ --dotfiles stow
      '';

      # run with `sudo nixos-rebuild switch --flake .#steamfunk`
      nixosConfigurations.steamfunk = iyuma.mkSystem [
          ./hosts/steamfunk

          ./modules/common.nix
          ./modules/desktop.nix
          # ./modules/emacs.nix

          ./modules/grub.nix
          inputs.hardware.nixosModules.framework-13th-gen-intel
      ];

      nixosConfigurations.hazed = iyuma.mkSystem [
          ./host/hazed

          inputs.hardware.nixosModules.apple-macbook-pro-12-1 
      ];
    };
}

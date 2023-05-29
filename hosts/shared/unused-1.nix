  nixpkgs = {
    overlays = [
      outputs.overlays.modifications
      outputs.overlays.additions
      inputs.nixpkgs-f2k.overlays.stdenvs
      inputs.nixpkgs-f2k.overlays.compositors
      (final: prev:
        {
          awesome = inputs.nixpkgs-f2k.packages.${pkgs.system}.awesome-git;
        })
    ];

    config = {
      allowUnfree = true;
    };
  };
}

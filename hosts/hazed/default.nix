_: {
  imports = [
    ./hardware-configuration.nix

    # I have no idea what is happening but for some reason one one works and the other doesnt
    ./configuration.nix
    # ./system.nix
  ];
}

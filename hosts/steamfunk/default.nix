_: {
  imports = [
    ./hardware-configuration.nix
    ../shared
    ./system.nix
    <apple-silicon-support/apple-silicon-support>
    # ./apple-silicon-support
  ];
}

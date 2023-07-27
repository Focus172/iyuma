let 
  pkgs = import <nixpkgs> {};
in
pkgs.mkShell {
  buildInputs = [
    pkgs.pkg-config
    pkgs.dbus
    pkgs.openssl
    pkgs.alsa-lib
    pkgs.protobuf
  ];
}

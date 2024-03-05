#!/usr/bin/env just --justfile

default:
    just --list

crates := "cargo-expand cargo-info cargo-watch"
# install rust packages
cargo:
    cargo install {{crates}}

# install nix packages
nix:
    sudo nixos-rebuild switch --flake .

# install home manager packages
home:
    home-manager switch --flake .

# loadkeys ./keys.kmap

all: nix cargo

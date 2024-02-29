#!/usr/bin/env just --justfile


# rust packages
crates := "cargo-expand cargo-info cargo-watch"

default:
    just --list

# keys:
#     loadkeys ./keys.kmap

cargo:
    cargo install {{crates}}

nix:
    sudo nixos-rebuild switch --flake '.#steamfunk'

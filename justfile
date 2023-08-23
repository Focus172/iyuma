#!/usr/bin/env just --justfile

# web links
jerry := `test -e "$HOME/.local/bin/jerry" && echo '' || echo "curl -sL 'https://raw.githubusercontent.com/justchokingaround/jerry/main/jerry.sh' -o ~/.local/bin/jerry"`

# rust packages
crates := "cargo-expand cargo-info cargo-watch du-dust mprocs porsmo wiki-tui gitui"

default:
	just --list

keys:
	loadkeys ./keys.kmap

web:
	{{jerry}}
	chmod +x ~/.local/bin/*

firefox:
	@echo "BEFORE RUNNING THIS MAKE SURE YOUR PROFILES ARE MOVE TO THE CORRENT DIR."
	@echo "UPDATE THE PROFILES.INI FILE TO MATCH THE CORRECT LOCATION. Enter to continue."
	read
	cp ./user.js ~/.mozilla/firefox/work.profile/
	cp ./user.js ~/.mozilla/firefox/personal.profile/

cargo:
	cargo install {{crates}}

arch set: web cargo
	yuma main.yuma {{set}}.yuma

nix: && web cargo
	sudo nixos-rebuild switch --flake '.#steelwork'

# vim: set ft=make :

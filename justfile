#!/usr/bin/env just --justfile

# web links
jerry := `test -e "$HOME/.local/bin/jerry" && echo '' || echo "curl -sL 'https://raw.githubusercontent.com/justchokingaround/jerry/main/jerry.sh' -o ~/.local/bin/jerry"`

# arch pkgs
all := `cat pkglist.yuma | sed '/#/d' | xargs`
pac := `cat pkglist.yuma | sed '/#/d' | grep -v "aur:" | xargs`
aur := `cat pkglist.yuma | sed '/#/d' | grep "aur:" | sed 's/aur://g' | xargs`
remove := `for pk in $(pacman -Qqt); do cat pkglist.yuma | sed '/#/d' | grep "$pk" >/dev/null || echo "$pk"; done | xargs`

# rust packages
crates := "cargo-expand cargo-info cargo-watch du-dust mprocs porsmo wiki-tui gitui"

default:
	just --list

web:
	{{jerry}}
	chmod +x ~/.local/bin/*

firefox:
	@echo "BEFORE RUNNING THIS MAKE SURE YOUR PROFILES ARE MOVE TO THE CORRENT DIR. UPDATE THE PROFILES.INI FILE TO MATCH THE CORRECT LOCATION"
	@read
	cp ./user.js ~/.mozilla/firefox/work.profile/
	cp ./user.js ~/.mozilla/firefox/personal.profile/

pkgs:
	[ -z "{{remove}}" ] || sudo pacman -Rns {{remove}}
	sudo pacman -S --needed {{pac}}
	paru -S --needed {{aur}}

cargo:
	cargo install {{crates}}

arch: pkgs web cargo

nix: && web cargo
	sudo nixos-rebuild switch --flake '.#steelwork'

# vim: set ft=make :

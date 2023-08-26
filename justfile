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

# needs root
sddm:
	cp ./src/sddm/sddm.conf /etc/sddm.conf
	cp ./src/sddm/*.face.icon /usr/share/sddm/faces/

cargo:
	cargo install {{crates}}



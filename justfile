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

pkgs:
	[ -z "{{remove}}" ] || sudo pacman -Rns {{remove}}
	sudo pacman -S --needed {{pac}}
	paru -S --needed {{aur}}

cargo:
	cargo install {{crates}}

linux: pkgs web cargo

# vim: set ft=make :

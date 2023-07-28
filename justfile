#!/usr/bin/env just --justfile

jerry := ```
test -e "$HOME/.local/bin/jerry" && echo '# Jerry already install' \
	|| echo "curl -sL 'https://raw.githubusercontent.com/justchokingaround/jerry/main/jerry.sh' -o ~/.local/bin/jerry && chmod +x ~/.local/bin/jerry"
```
packages := "cargo-expand cargo-info cargo-watch du-dust mprocs porsmo wiki-tui"

default:
	just --list

brew:
	brew bundle

web:
	{{jerry}}

# builds nix
nix host:
	@echo "Requesting sudo privaliges ..."
	sudo nixos-rebuild switch --flake .#{{host}}

cargo:
	nix-shell --run 'cargo install {{packages}}'

# installs all software used on linux
linux host: web cargo (nix host)
	@echo "Done!"

mac: brew web cargo


# vim: set ft=make :

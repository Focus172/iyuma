#!/usr/bin/env just --justfile

jerry := ```
test -e "$HOME/.local/bin/jerry" && echo '# Jerry already install' \
	|| echo "curl -sL 'https://raw.githubusercontent.com/justchokingaround/jerry/main/jerry.sh' -o ~/.local/bin/jerry && chmod +x ~/.local/bin/jerry"
```

default:
	just --list

brew-install:
	brew bundle

web-install:
	{{jerry}}

# builds the nix configuration
nix host:
	@echo "Requesting sudo privaliges ..."
	sudo nixos-rebuild switch --flake .#{{host}}

cargo-install:
	cargo install cargo-expand
	cargo install cargo-info
	cargo install cargo-watch
	cargo install du-dust
	cargo install mprocs
	cargo install porsmo
	cargo install wiki-tui

linux: web-install cargo-install

mac: brew-install web-install cargo-install


# vim: set ft=make :

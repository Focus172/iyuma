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

# removes sys nix files (RUN WITH CARE)
clean-nix:
	rm -rf /etc/nixos/*

# links sys nix conf (host: "hazed"|"steambox"|"steelworks"|"steamfunk")
link-nix host: clean-nix
	test -e "./hosts/{{host}}/configurations.nix"
	ln "./hosts/{{host}}/configurations.nix" /etc/nixos/configuration.nix
	ln "./hosts/{{host}}/hardware-configuration.nix" /etc/nixos/hardware-configuration.nix
	ln "./hosts/shared/shared.nix" /etc/nixos/shared.nix

# builds the nix configuration
build-nix: 
	@echo "Requesting sudo privaliges ..."
	sudo nixos-rebuild switch

cargo-install:
	# cargo install termmusic
	# cargo install termmusic-server
	cargo install cargo-expand
	cargo install cargo-info
	cargo install cargo-watch
	cargo install du-dust
	cargo install mprocs
	cargo install porsmo
	cargo install wiki-tui
	cargo install jt


linux: build-nix web-install cargo-install

mac: brew-install web-install cargo-install


# vim: set ft=make :

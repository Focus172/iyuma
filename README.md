# Iyuma
A no-good, very bad, horrid system configuration. It works on my machine.

Made with [freight](https://github.com/gingerfocus/freight).

```bash
git clone https://github.com/Focus172/iyuma.git
cargo run
```

## Nix
Change nix registry dir
```bash
nix registry add nixpkgs ~/my-nixpkgs
```

```
sudo nixos-rebuild switch --flake .
nix run .#stow
`

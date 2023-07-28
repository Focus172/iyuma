# Iyuma
A no-good, very bad, horrid system config. It works on my machine.

Choose one of the hosts that you think looks nice and then boot up a
nix machine.

```bash
# Get the files onto your device
git clone https://github.com/Focus172/iyuma.git

# get your hardware configuration file and copy it to a place where the builder
# will read it. Overriding my hardware file.
nixos-generate-config
cp -f /etc/nixos/hardware-configuration.nix ./hosts/CHOSEN-HOST/

# run the build script. Note: this need just so install it with:
# `nix-shell -p just` if you dont have it.
just linux CHOSEN-HOST
```

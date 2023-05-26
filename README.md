# Iyuma
A no-good, very bad, horrid sysconf. It works on my machine so hope you have fun as well

This requires a bit of setup to get it running the way I want but here it is.
```bash
sudo chown root ./nixos

# not the bellow are hard file links, if you dont know how they work
# be carful
sudo ln /etc/nixos/hardware-configuration.nix ./nixos/hardware-configuration.nix

# setup for the next link
sudo mv ./nixos/configuration.nix /etc/nixos/configuration.nix
# overwrite when prompted

sudo ln /etc/nixos/configuration.nix ./nixos/configuration.nix
```

Now you can use sudoedit to change the configuration.nix file

In addition, you can now build just like this:
```bash
./build sys
./build usr
```

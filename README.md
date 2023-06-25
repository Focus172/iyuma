# Iyuma
A no-good, very bad, horrid sysconf. It works on my machine so hope you have 
fun as well.

the files in /hosts are hardlinked to /etc/nixos/ and owned by the user.
you can figure it out i belive in you

once you have done that you can just
```bash
nixos-rebuild switch

# or 

home-manager switch --flake ".#$user"
```

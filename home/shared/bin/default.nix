{ config, ... }:

{
  home = {
    file = {
      ".local/bin/fetch" = {
        executable = true;
        text = import ./eyecandy/nixfetch.nix { };
      };
      ".local/bin/tiling" = {
        executable = true;
        text = import ./misc/tiling.nix { };
      };
      ".local/bin/panes" = {
        executable = true;
        text = import ./eyecandy/panes.nix { };
      };
      ".local/bin/wifimenu" = {
        executable = true;
        text = import ./rofiscripts/wifi.nix { };
      };
      ".local/bin/powermenu" = {
        executable = true;
        text = import ./rofiscripts/powermenu.nix { };
      };
      ".local/bin/screenshotmenu" = {
        executable = true;
        text = import ./rofiscripts/screenshot.nix { };
      };
      ".local/bin/changebrightness" = {
        executable = true;
        text = import ./notifs/changebrightness.nix { };
      };
      ".local/bin/changevolume" = {
        executable = true;
        text = import ./notifs/changevolume.nix { };
      };
    };
  };
}

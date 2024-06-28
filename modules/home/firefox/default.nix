{ config, pkgs, inputs, ... }:
let userjs = builtins.readFile ./user.js;
in {
  programs.firefox = {
    enable = true;
    profiles."work" = {
      id = 0;
      isDefault = true;
      name = "work";
      extraConfig = userjs;
      # extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
      #   # qbitwarden
      #   ublock-origin
      #   darkreader
      #   youtube-shorts-block
      # ];
    };
    profiles."school" = {
      id = 1;
      extraConfig = userjs;
      name = "school";
    };
    profiles."personal" = {
      id = 2;
      extraConfig = userjs;
      name = "personal";
    };
    # nativeMessagingHosts = [ pkgs.firefoxpwa pkgs.gnome-browser-connector ];
  };

  # home.packages = [pkgs.firefoxpwa];
}

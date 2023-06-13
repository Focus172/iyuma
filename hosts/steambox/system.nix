{ config, pkgs, ... }: {
  networking.hostName = "steambox";

  # TODO: add users per system

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.focus = {
    isNormalUser = true;
    shell = pkgs.fish;
    description = "focus";
    extraGroups = [ "wheel" "networkmanager" "audio" "video" "libvirtd" ];
    packages = with pkgs; []; # see home manager for things
  };

  programs.steam.enable = true;
  # virtualisation.virtualbox.host.enable = true;
}

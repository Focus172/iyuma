{
  config,
  pkgs,
  ...
}: {
  programs.hyprland.enable = true;

  # security = {
  #   polkit.enable = true;
  #   pam.services = {
  #     swaylock = {};
  #   };
  # };
}

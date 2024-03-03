{
  config,
  pkgs,
  ...
}: {
  # programs.dconf.enable = true;
  programs.hyprland = {
    enable = true;
    # xwayland.enable = true;
  };

  environment.sessionVariables = {
    # tell electron apps to use wayland
    NIXOS_OZONE_WL = "1";
  };

  # xdg.portal.enable = true;
  # xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-hyprland];

  hardware.opengl.enable = true;

  # security = {
  #   polkit.enable = true;
  #   pam.services = {
  #     swaylock = {};
  #   };
  # };
}

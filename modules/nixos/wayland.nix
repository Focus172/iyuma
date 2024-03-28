{
  config,
  pkgs,
  ...
}: {
  # programs.dconf.enable = true;

  environment.sessionVariables = {
    # tell electron apps to use wayland
    NIXOS_OZONE_WL = "1";
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [
    # for screen sharing
    pkgs.xdg-desktop-portal-wlr
    # for file picking
    pkgs.xdg-desktop-portal-gtk
  ];

  hardware.opengl.enable = true;

  # security = {
  #   polkit.enable = true;
  #   pam.services = {
  #     swaylock = {};
  #   };
  # };
}

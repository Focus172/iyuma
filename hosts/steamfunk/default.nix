{
  config,
  pkgs,
  lib,
  ...
}: {
  # Include the results of the hardware scan.
  imports = [./hardware-configuration.nix];

  networking.hostName = "steamfunk";

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  programs.steam = {
    enable = true;
    # remotePlay.openFirewall = true;
    # dedicatedServer.openFirewall = true;
  };

  services.tlp = {
    enable = true;
    settings = {
      CPU_BOOST_ON_BAT = 0;
      CPU_SCALING_GOVERNOR_ON_BATTERY = "powersave";
      START_CHARGE_THRESH_BAT0 = 90;
      STOP_CHARGE_THRESH_BAT0 = 97;
      RUNTIME_PM_ON_BAT = "auto";
    };
  };

  i18n.defaultLocale = "en_US.UTF-8";

  # ------------- Input --------------- #
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = [pkgs.fcitx5-mozc];
  };

  environment.variables = {
    XMODIFIERS = "@im=fcitx";
    XMODIFIER = "@im=fcitx";
    # GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    GLFW_IM_MODULE = "fcitx";
  };
  # ----------------------------------- #

  system.stateVersion = "23.11";
}

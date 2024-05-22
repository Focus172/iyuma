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
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  ## Tf2
  # there is currently a bug in a vendored dependency of the game that causes
  # it to crash. We load the fixed version and then puth it in the LD_PRELOAD to
  # make the game use it.
  #
  # Launch options:
  # LD_PRELOAD=$LD_PRELOAD:/run/current-system/sw/lib/libtcmalloc_minimal.so %command%
  environment.systemPackages = [pkgs.pkgsi686Linux.gperftools];

  # services.tlp = {
  #   enable = true;
  #   settings = {
  #     CPU_BOOST_ON_BAT = 0;
  #     CPU_SCALING_GOVERNOR_ON_BATTERY = "powersave";
  #     START_CHARGE_THRESH_BAT0 = 90;
  #     STOP_CHARGE_THRESH_BAT0 = 97;
  #     RUNTIME_PM_ON_BAT = "auto";
  #   };
  # };

  i18n.defaultLocale = "en_US.UTF-8";

  # ------------- Input --------------- #
  i18n.inputMethod = {
    # enabled = "ibus";
    # ibus.engines = with pkgs.ibus-engines; [ mozc ]; # hangul 

    enabled = "fcitx5";
    fcitx5.addons = [pkgs.fcitx5-mozc];
  };
  # ----------------------------------- #

  system.stateVersion = "23.11";
}

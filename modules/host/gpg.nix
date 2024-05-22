{
  config,
  pkgs,
  ...
}: {
  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-gnome3;
    enableSSHSupport = true;
  };

  # environment.systemPackages = with pkgs; [
  #   # pinentry-rofi
  #   # pinentry-bemenu
  #   pinentry-gnome
  #   pinentry-qt
  # ];
}

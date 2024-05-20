{
  config,
  pkgs,
  ...
}: {
  programs.gnupg.agent = {
    enable = true;
    # pinentryPackage = pkgs.pinentry-gnome;
    pinentryFlavor = "gnome3"; # "qt", "curses";
    enableSSHSupport = true;
  };

  environment.systemPackages = with pkgs; [
    # pinentry-rofi
    # pinentry-bemenu
    pinentry-gnome
    pinentry-qt
  ];
}

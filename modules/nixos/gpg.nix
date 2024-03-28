{
  config,
  pkgs,
  ...
}: {
  programs.gnupg.agent = {
    enable = true;
    #pinentryPackage = pkgs.pinentry-bemenu;
    pinentryFlavor = "qt";
    # pinentryFlavor = "curses";
    # enableSSHSupport = true;
  };

  environment.systemPackages = with pkgs; [
    # pinentry-rofi
    pinentry-bemenu
    pinentry-qt
  ];
}

{
  config,
  pkgs,
  ...
}: {
  programs.gnupg.agent = {
    enable = true;
    pinentryFlavor = "qt";
    # pinentryFlavor = "curses";
    # enableSSHSupport = true;
  };

  environment.systemPackages = with pkgs; [
    pinentry-rofi
    pinentry-qt
  ];
}

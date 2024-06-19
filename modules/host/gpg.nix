{ config, pkgs, ... }: {
  programs.gnupg.agent = {
    enable = true;
    # pinentryPackage = pkgs.pinentry-gnome3;
    pinentryPackage = pkgs.pinentry-bemenu;
    enableSSHSupport = true;
  };
}

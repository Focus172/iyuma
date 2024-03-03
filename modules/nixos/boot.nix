{
  config,
  pkgs,
  ...
}: {

  boot.loader.timeout = 3;
  boot.loader.efi.canTouchEfiVariables = true;

  # Systemd Bootloader.
  boot.loader.systemd-boot.enable = true;

  # Grub Bootloader.
  # boot.loader.grub = {
  #   enable = true;
  #   devices = ["nodev"];
  #   efiSupport = true;
  #   configurationLimit = 30;
  #   # useOSProber = true;
  #   # font = path
  #   # fontSize = uint
  #   # theme = string
  # };


  # environment.systemPackages = [ pkgs.greetd.tuigreet ];
  #
  # services.greetd = {
  #   enable = true;
  #   vt = 2;
  #   settings.default_session.command = "${pkgs.greetd.tuigreet}/bin/tuigreet --remember --time --asterisks --greeting 'Welcome home' --cmd Hyprland";
  # };
  #
  # systemd.services.greetd = {
  #   preStart = "kill -SIGRTMIN+21 1";
  #   postStop = "kill -SIGRTMIN+20 1";
  # };


  # boot.plymouth.enable = true;
  # boot.plymouth.theme = "catppuccin-mocha";
  # boot.plymouth.themePackages = [ pkgs.catppuccin-plymouth ];
}

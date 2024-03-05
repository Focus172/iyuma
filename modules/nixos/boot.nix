{
  config,
  pkgs,
  ...
}: let
  hyprlaunch = pkgs.writeShellScriptBin "hyprlaunch" ''
    export XDG_SESSION_TYPE=wayland
    export XDG_SESSION_DESKTOP=Hyprland
    export XDG_CURRENT_DESKTOP=Hyprland

    # Bug fixing
    export WLR_RENDERER_ALLOW_SOFTWARE=1
    export LIBSEAT_BACKEND=logind

    . $HOME/.env

    ## asahi fixes
    # export MESA_GL_VERSION_OVERRIDE=3.3
    # export MESA_GLSL_VERSION_OVERRIDE=330
    # export MESA_GLES_VERSION_OVERRIDE=3.1

    exec ${pkgs.dbus}/bin/dbus-run-session ${pkgs.hyprland}/bin/Hyprland "$@"
  '';
  tuigreet_command = "${pkgs.greetd.tuigreet}/bin/tuigreet --remember --time --asterisks --greeting 'Welcome home' --cmd ${hyprlaunch}/bin/hyprlaunch";
in {
  boot.loader.timeout = 3;
  boot.loader.efi.canTouchEfiVariables = true;

  # Grub Bootloader.
  boot.loader.grub = {
    enable = true;
    # device = "/dev/disk/by-uuid/D442-50BC";
    devices = ["nodev"];
    efiSupport = true;
    # configurationLimit = 30;
    # useOSProber = true;
    # font = path
    # fontSize = uint
    # theme = string
  };

  environment.systemPackages = [
    pkgs.greetd.tuigreet
    hyprlaunch
  ];

  services.greetd = {
    enable = true;
    vt = 2;
    settings.default_session.command = tuigreet_command;
  };

  systemd.services.greetd = {
    preStart = "kill -SIGRTMIN+21 1";
    postStop = "kill -SIGRTMIN+20 1";
  };

  # boot.plymouth.enable = true;
  # boot.plymouth.theme = "catppuccin-mocha";
  # boot.plymouth.themePackages = [pkgs.catppuccin-plymouth];
  #
}

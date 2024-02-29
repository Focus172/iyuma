{ pkgs, ... }: {
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        devices = [ "nodev" ];
        efiSupport = true;
        # useOSProber = true;
        configurationLimit = 2;
        # font = path
        # fontSize = uint
        # theme = string
      };
      timeout = 2;
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };

  ### printing
  services.printing.enable = true;
  services.avahi.enable = true;
  services.avahi.nssmdns = true;
  # for a WiFi printer
  services.avahi.openFirewall = true;


  time.timeZone = "America/Tijuana";

  # Enable networking
  networking.networkmanager.enable = true;

  # programs.dconf.enable = true;
  programs.hyprland.enable = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
    useXkbConfig = false;
  };

  # services.syncthing.enable = true;
  # services.syncthing.user = "focus";
  # services.syncthing.dataDir = "/home/focus/";

  # Enable sound.
  sound.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    # jack.enable = true;
  };

  environment.variables = {
    ZDOTDIR = "$HOME/.config/zsh";
    EDITOR = "nvim";
  };

  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
  };
  users.defaultUserShell = pkgs.zsh;

  programs.fish = {
    enable = false;
    shellAliases = { # for some reason nix has opionated shell aliases
      l = null;      # this is really dumb but I am too lazy to complain
      ls = null;     # upstream so I guess I am the dumb one here. Anyware
      ll = null;     # this will do for now.
    };
  };

  fonts = {
    fonts = with pkgs; [
      (nerdfonts.override { fonts = ["Hack" "Mononoki"]; })
      rounded-mgenplus
      # hanazono # a bit too fancy
    ];
    enableDefaultFonts = false;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.focus = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "focus";
    extraGroups = [ "wheel" "networkmanager" "audio" "video" "libvirtd" ];
  };

  security.polkit.enable = true;
  security.sudo.enable = true;

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.openssh.enable = true;

  environment.systemPackages = with pkgs; [ git coreutils ];
}

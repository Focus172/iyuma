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

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    # alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  environment.shellAliases = {};
  programs.fish = {
    enable = true;
    shellAliases = { # for some reason nix has opionated shell aliases
      l = null;      # this is really dumb but I am too lazy to complain
      ls = null;     # upstream so I guess I am the dumb one here. Anyware 
      ll = null;     # this will do for now.
    };
  };
  users.defaultUserShell = pkgs.fish;

  fonts = {
    fonts = with pkgs; [
      (nerdfonts.override {fonts = ["Hack" "Mononoki"];})
      rounded-mgenplus
      # hanazono # a bit too fancy
    ];
    enableDefaultFonts = false;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.focus = {
    isNormalUser = true;
    shell = pkgs.fish;
    description = "focus";
    extraGroups = [ "wheel" "networkmanager" "audio" "video" "libvirtd" ];
  };

  security.polkit.enable = true;
  security.sudo.enable = true;

  nix = {
    package = pkgs.nixFlakes;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      trusted-users = [ "root" "@wheel" ];
      auto-optimise-store = true;
      warn-dirty = false;
    };
    gc = {
      automatic = true;
      options = "--delete-older-than 5d";
    };
    optimise.automatic = true;
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  nixpkgs.config.allowUnfree = true;

  services.openssh.enable = true;

  environment.systemPackages = with pkgs; [
    git

    ## Only choose 1:
    # busybox
    coreutils
  ];
}

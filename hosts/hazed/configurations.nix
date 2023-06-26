{ config, pkgs, ... }: {
  imports = [ ./hardware-configuration.nix ];

  networking.hostName = "hazed";

  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      # useOSProber = true;
      # font = path
      # fontSize = uint
      # theme = string
    };
    # plymouth.enable = true;

    efi.efiSysMountPoint = "/boot/efi";
    efi.canTouchEfiVariables = true;
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  time.timeZone = "America/Tijuana";

  # Enable networking
  networking.networkmanager.enable = true;
  # networking.firewall.enable = false;

  # programs.dconf.enable = true;
  programs.hyprland.enable = true;
  programs.steam.enable = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # i18n.extraLocaleSettings = {
  #   LC_ADDRESS = "en_US.UTF-8";
  #   LC_IDENTIFICATION = "en_US.UTF-8";
  #   LC_MEASUREMENT = "en_US.UTF-8";
  #   LC_MONETARY = "en_US.UTF-8";
  #   LC_NAME = "en_US.UTF-8";
  #   LC_NUMERIC = "en_US.UTF-8";
  #   LC_PAPER = "en_US.UTF-8";
  #   LC_TELEPHONE = "en_US.UTF-8";
  #   LC_TIME = "en_US.UTF-8";
  # };

  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkbOptions in tty.
  # };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  programs.fish.enable = true;
  # users.defaultUserShell = pkgs.fish;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.focus = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "video" ];
    shell = pkgs.fish;
  };

  # security.polkit.enable = true;
  # security.sudo.enable = true;

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


  # virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.host.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };


  nixpkgs.config.allowUnfree = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  environment.systemPackages = with pkgs; [
    vim 
    git

    ## Only choose 1:
    # busybox
    coreutils
  ];


  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}


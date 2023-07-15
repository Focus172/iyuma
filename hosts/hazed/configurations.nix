{ config, pkgs, ... }: {
  imports = [ 
    ./hardware-configuration.nix 
    ./shared.nix
  ];

  networking.hostName = "hazed";

  # Enable networking
  networking.networkmanager.enable = true;
  # networking.firewall.enable = false;

  # programs.dconf.enable = true;
  programs.hyprland.enable = true;


  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkbOptions in tty.
  # };

  services.syncthing.enable = true;
  services.syncthing.user = "focus";
  services.syncthing.dataDir = "/home/focus/";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # users.defaultUserShell = pkgs.fish;


  # security.polkit.enable = true;
  # security.sudo.enable = true;


  # virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.host.enable = true;

  xdg.portal.enable = true;
  xdg.portal.wlr.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };


  nixpkgs.config.allowUnfree = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

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


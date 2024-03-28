{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hyprland.nix
    ./boot.nix
    ./gpg.nix
    # ./sync.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Network Manager
  networking.networkmanager.enable = true;
  # Wpa Supplicant
  # networking.wireless.enable = true;

  # Set your time zone.
  time.timeZone = "America/Tijuana";

  ### Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  services.blueman.enable = true;

  environment = {
    shellAliases = {};
    variables = {};
    # NixOs has non-nessisary pacakage installed by default
    # defaults are shown. Commented out one are 'deleted'
    defaultPackages = [
      # pkgs.perl
      pkgs.rsync
      pkgs.strace
    ];

    systemPackages = with pkgs; [vim git coreutils]; # busybox
  };

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    # alsa.support32Bit = true;
    # jack.enable = true;
  };

  nixpkgs.config = {
    permittedInsecurePackages = ["electron-25.9.0"];
    allowUnfree = true;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
  };

  # ------------- Fonts --------------- #
  fonts = {
    packages = with pkgs; [
      (nerdfonts.override {fonts = ["Hack" "Mononoki"];})
      noto-fonts-emoji
      dejavu_fonts
      ipafont
      kochi-substitute
      # rounded-mgenplus
      # Too Fancy
      # hanazono
    ];
    enableDefaultPackages = false;
  };

  # fonts.fontconfig.defaultFonts = {
  #   monospace = ["Hack Nerd Mono" "DejaVu Sans Mono" "IPAGothic"];
  #   sansSerif = ["DejaVu Sans" "IPAPGothic"];
  #   serif = ["DejaVu Serif" "IPAPMincho"];
  # };

  users.defaultUserShell = pkgs.bash;

  # ----------------------------------- #
  users.users.focus = {
    isNormalUser = true;
    description = "Evan Stokdyk";
    shell = pkgs.bash;
    extraGroups = ["wheel" "networkmanager" "audio" "video" "libvirtd"];
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # ### printing
  # services.printing.enable = true;
  # services.avahi.enable = true;
  # services.avahi.nssmdns = true;
  # # for a WiFi printer
  # services.avahi.openFirewall = true;

  # # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  #
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = false;
  # };

  # security.polkit.enable = true;
  # security.sudo.enable = true;

  # services.openssh.enable = true;
}

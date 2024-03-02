{
  config,
  pkgs,
  ...
}: {
  imports = [./hyprland.nix];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Network Manager
  networking.networkmanager.enable = true;
  # Wpa Supplicant
  # networking.wireless.enable = true;

  # services.gnome.gnome-keyring.enable = true;
  # preHook = '' until /run/wrappers/bin/ping google.com -c1 -q >/dev/null; do :; done '';

  # Set your time zone.
  time.timeZone = "America/Tijuana";

  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  services.blueman.enable = true;

  environment.variables = {
    ZDOTDIR = "$HOME/.config/zsh";
  };

  programs.zsh = {enable = true;};
  users.defaultUserShell = pkgs.zsh;

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

  programs.gnupg.agent = {
    enable = true;
    pinentryFlavor = "qt";
    # enableSSHSupport = true;
  };

  nixpkgs.config = {
    permittedInsecurePackages = ["electron-25.9.0"];
    allowUnfree = true;
  };

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    libsecret
    openssl
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
  };

  programs.fish.enable = true;

  # ------------- Fonts --------------- #
  fonts.packages = with pkgs; [
    (nerdfonts.override {fonts = ["Hack" "Mononoki"];})
    dejavu_fonts
    ipafont
    kochi-substitute
  ];

  fonts.fontconfig.defaultFonts = {
    monospace = ["Hack Nerd Mono" "IPAGothic"];
    sansSerif = ["DejaVu Sans" "IPAPGothic"];
    serif = ["DejaVu Serif" "IPAPMincho"];
  };
  # ----------------------------------- #
  users.users.focus = {
    isNormalUser = true;
    description = "Evan Stokdyk";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [
      firefox
      alacritty
      fzf
      broot
      eza
      gnumake
      just
      starship
      rustup
      bun
      clang # zig
      swww
      # gnome.nautilus
      rofi
      pass
      wl-clipboard
      fdupes
      shellcheck
      taplo
      bat
      gitui
      (waybar.override {hyprlandSupport = true;})
      imv
      neofetch
      bottom
      # pinentry-rofi
      pinentry-qt
      pdftk
      imagemagick
      grim
      slurp
      mpv
      zathura
      mako
      libnotify
      zoom-us

      clerk
      mpd
      brightnessctl
      unzip
      wget
      newsboat
      ripgrep
      yt-dlp
      cava
      nmap
      mediainfo
      zellij
      rsync
      jq
      # libreoffice-fresh
      discord

      ani-cli
      obsidian
      # obs-studio
      killall
      tty-clock
      file
      ffmpeg
      btar
      # blender
      pfetch

      drive
      # komikku
      # heroic

      pavucontrol
      networkmanagerapplet
      pkg-config
      porsmo
      spotify
      vscodium

      playerctl
      bluetuith

      chocolate-doom

      rclone
      rclone-browser

      # (callPackage /home/focus/.config/iyuma/firefoxpwa.nix {})

      mprocs
      du-dust
      wiki-tui
      insync

      alejandra

      # neo-cowsay
    ];
  };

  environment.systemPackages = with pkgs; [vim git];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # boot = {
  #   loader = {
  #     efi.canTouchEfiVariables = true;
  #     grub = {
  #       enable = true;
  #       devices = ["nodev"];
  #       efiSupport = true;
  #       # useOSProber = true;
  #       configurationLimit = 2;
  #       # font = path
  #       # fontSize = uint
  #       # theme = string
  #     };
  #     timeout = 2;
  #   };
  #   kernelPackages = pkgs.linuxPackages_latest;
  # };
  #
  # ### printing
  # services.printing.enable = true;
  # services.avahi.enable = true;
  # services.avahi.nssmdns = true;
  # # for a WiFi printer
  # services.avahi.openFirewall = true;
  #
  # time.timeZone = "America/Tijuana";
  #
  # # Enable networking
  # networking.networkmanager.enable = true;
  #
  # # programs.dconf.enable = true;
  # programs.hyprland.enable = true;
  #
  # # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  #
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = false;
  # };
  #
  # # services.syncthing.enable = true;
  # # services.syncthing.user = "focus";
  # # services.syncthing.dataDir = "/home/focus/";
  #
  # # Enable sound.
  # sound.enable = true;
  # services.pipewire = {
  #   enable = true;
  #   alsa.enable = true;
  #   pulse.enable = true;
  #   # jack.enable = true;
  # };
  #
  # environment.variables = {
  #   ZDOTDIR = "$HOME/.config/zsh";
  #   EDITOR = "nvim";
  # };
  #
  # programs.zsh = {
  #   enable = true;
  #   syntaxHighlighting.enable = true;
  #   enableCompletion = true;
  # };
  # users.defaultUserShell = pkgs.zsh;
  #
  # programs.fish = {
  #   enable = false;
  #   shellAliases = {
  #     # for some reason nix has opionated shell aliases
  #     l = null; # this is really dumb but I am too lazy to complain
  #     ls = null; # upstream so I guess I am the dumb one here. Anyware
  #     ll = null; # this will do for now.
  #   };
  # };
  #
  # fonts = {
  #   fonts = with pkgs; [
  #     (nerdfonts.override {fonts = ["Hack" "Mononoki"];})
  #     rounded-mgenplus
  #     # hanazono # a bit too fancy
  #   ];
  #   enableDefaultFonts = false;
  # };
  #
  # # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.focus = {
  #   isNormalUser = true;
  #   shell = pkgs.zsh;
  #   description = "focus";
  #   extraGroups = ["wheel" "networkmanager" "audio" "video" "libvirtd"];
  # };
  #
  # security.polkit.enable = true;
  # security.sudo.enable = true;
  #
  # xdg.portal.enable = true;
  # xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-hyprland];
  #
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  #
  # services.openssh.enable = true;
  #
  # environment.systemPackages = with pkgs; [git coreutils];
}

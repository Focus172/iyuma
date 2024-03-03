{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hyprland.nix
    ./boot.nix
    # ./sync.nix
  ];

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

  environment.shellAliases = {};
  # add .local/bin to bath
  environment.localBinInPath = true;
  environment.variables = {
    ZDOTDIR = "$HOME/.config/zsh";
  };

  # NixOs non-nessisary pacakage
  # defualt is pkgs.perl pkgs.rsync pkgs.strace
  environment.defaultPackages = [pkgs.rsync pkgs.strace];

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

  # programs.nix-ld.enable = true;
  # programs.nix-ld.libraries = with pkgs; [
  #   libsecret
  #   openssl
  # ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
  };

  # ------------- Fonts --------------- #
  fonts = {
    packages = with pkgs; [
      (nerdfonts.override {fonts = ["Hack" "Mononoki"];})
      dejavu_fonts
      ipafont
      kochi-substitute
      # rounded-mgenplus
      # Too Fancy
      # hanazono
    ];
    enableDefaultPackages = false;
  };

  fonts.fontconfig.defaultFonts = {
    monospace = ["Hack Nerd Mono" "IPAGothic"];
    sansSerif = ["DejaVu Sans" "IPAPGothic"];
    serif = ["DejaVu Serif" "IPAPMincho"];
  };

  # nix does bad things with my fish config
  programs.fish.enable = false;

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  # ----------------------------------- #
  users.users.focus = {
    isNormalUser = true;
    description = "Evan Stokdyk";
    shell = pkgs.zsh;
    extraGroups = ["wheel" "networkmanager" "audio" "video" "libvirtd"];
    packages = with pkgs; [
      fish

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
      rofi-wayland
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
      komikku
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

  environment.systemPackages = with pkgs; [vim git coreutils]; # busybox

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

  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # services.openssh.enable = true;
}

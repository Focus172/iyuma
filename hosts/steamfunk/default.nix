# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }: {
  # Include the results of the hardware scan.
  imports = [ ./hardware-configuration.nix ];
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # preHook = '' until /run/wrappers/bin/ping google.com -c1 -q >/dev/null; do :; done '';

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "steamfunk";

    # Network Manager
    networkmanager.enable = true;
    # Wpa Supplicant
    # networking.wireless.enable = true;
  };

  # services.gnome.gnome-keyring.enable = true;

  # Set your time zone.
  time.timeZone = "America/Tijuana";

  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  services.blueman.enable = true;

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  environment.variables = {
    ZDOTDIR = "$HOME/.config/zsh";
  };

  programs.zsh = { enable = true; };
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
    permittedInsecurePackages = [ "electron-25.9.0" ];
    allowUnfree = true;
  };

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    libsecret
    openssl
  ];

  programs.hyprland.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
  };

  programs.steam = {
    enable = true;
    # remotePlay.openFirewall = true;
    # dedicatedServer.openFirewall = true;
  };

  services.tlp = {
    enable = true;
    settings = {
      CPU_BOOST_ON_BAT = 0;
      CPU_SCALING_GOVERNOR_ON_BATTERY = "powersave";
      START_CHARGE_THRESH_BAT0 = 90;
      STOP_CHARGE_THRESH_BAT0 = 97;
      RUNTIME_PM_ON_BAT = "auto";
    };
  };

  # ------------- Input --------------- #
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = [ pkgs.fcitx5-mozc ];
  };

  environment.variables = {
    XMODIFIERS="@im=fcitx";
    XMODIFIER="@im=fcitx";
    GTK_IM_MODULE="fcitx";
    QT_IM_MODULE="fcitx";
    GLFW_IM_MODULE = "fcitx";
  };
  # ----------------------------------- #

  # ------------- Fonts --------------- #
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Hack" "Mononoki" ]; })
    dejavu_fonts
    ipafont
    kochi-substitute
  ];

  fonts.fontconfig.defaultFonts = {
    monospace = [ "Hack Nerd Mono" "IPAGothic" ];
    sansSerif = [ "DejaVu Sans" "IPAPGothic"];
    serif = [ "DejaVu Serif" "IPAPMincho" ];
  };
  # ----------------------------------- #

  users.users.focus = {
    isNormalUser = true;
    description = "Evan Stokdyk";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
      alacritty
      fzf broot eza
      fish
      gnumake just
      starship
      rustup bun
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
      ( waybar.override { hyprlandSupport = true; })
      imv
      neofetch
      bottom
      # pinentry-rofi
      pinentry-qt
      pdftk imagemagick
      grim slurp
      mpv
      zathura
      mako libnotify
      zoom-us

      clerk mpd
      brightnessctl
      unzip wget
      newsboat
      ripgrep
      yt-dlp
      cava
      nmap
      mediainfo
      zellij rsync
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
    ]
    # ++ [ unstable.komikku ]
    ;
  };
  environment.systemPackages = with pkgs; [ vim git ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}

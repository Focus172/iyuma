{ config, pkgs, ... }: {

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

  services.syncthing.enable = true;
  services.syncthing.user = "focus";
  services.syncthing.dataDir = "/home/focus/";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  programs.fish.enable = true;
  # users.defaultUserShell = pkgs.fish;

  # programs.neovim = {
  #   enable = false;
  #   defaultEditor = true;
  #   withRuby = false;
  #   withNodeJs = false;
  #   withPython3 = false;
  # };


  fonts = {
    enableDefaultFonts = true;
    fonts = with pkgs; [
      (nerdfonts.override {fonts = ["Hack" "Mononoki"];})
      # fira-code
      # fira-code-symbols
    ];

    fontconfig = {
      defaultFonts = {
        # serif = [ "Vazirmatn" "Ubuntu" ];
        # sansSerif = [ "Vazirmatn" "Ubuntu" ];
        # monospace = [ "Ubuntu" ];
      };
    };
  };


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.focus = {
    isNormalUser = true;
    shell = pkgs.fish;
    description = "focus";
    extraGroups = [ "wheel" "networkmanager" "audio" "video" "libvirtd" ];
    packages = with pkgs; [
      rofi-wayland rofi-calc # rofi-pass
      ncmpcpp playerctl # clerk 
      foot alacritty
      neovim
      pass 
      bat
      ripgrep
      exa
      starship zoxide
      go
      pfetch
      gitui
      alejandra
      bottom
      handlr-regex
      ripgrep
      fzf
      gitoxide
      jq
      yt-dlp
      bacon
      imagemagick
      # fortune
      # neo-cowsay
      # glow
      # gum
      # slides
      # charm
      # skate
      # vhs
      lf
      rustup
      zig
      # nodejs
      # sassc
      mpc-cli
      swww
      # htop
      # blender
      tmux
      # acpi
      # wl-gammactl
      # wlsunset
      # hyprpicker
      pavucontrol
      brightnessctl
      alsa-utils
      grim
      libreoffice-fresh
      mako
      slurp
      swayidle
      wl-clipboard
      brave
      discord
      # swaylock-effects
      # swayidle
      nginx
      killall
      cava
      tty-clock
      # ani-cli
      mpv
      clang
      btar
      fd
      file
      obsidian
      obs-studio
    ];
  };

  services.mpd = {
    enable = true;
    user = "focus";
    musicDirectory = "/home/focus/aud";
    dataDir = "/home/focus/.config/mpd";
    extraConfig = ''
    auto_update       "yes"
    restore_paused    "yes"

    audio_output {
        type "pulse"
        name "Pulseaudio"
        server "127.0.0.1" 
    }

    audio_output {
      	type            "fifo"
      	name            "Visualizer"
      	format          "44100:16:2"
      	path            "/tmp/mpd.fifo"
    }
    
    audio_output {
      	type		    "httpd"
      	name		    "lossless"
      	encoder		    "flac"
      	port		    "8000"
      	max_client	    "8"
      	mixer_type	    "software"
      	format		    "44100:16:2"
    }
    '';
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

  xdg.portal.enable = true;
  # xdg.portal.wlr.enable = true;
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

  environment.systemPackages = with pkgs; [
    git

    ## Only choose 1:
    # busybox
    coreutils
  ];
}

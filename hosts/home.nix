{ config, lib, pkgs, user, ... }: {

  home.stateVersion = "23.05";
  programs.home-manager.enable = true;

  imports =
    (import ./shared); # ++
    # (import ../modules/services);

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";

    packages = with pkgs; [
      rofi-wayland # rofi-calc rofi-pass
      # playerctl ncmpcpp mpc-cli
      alacritty cool-retro-term
      pass
      zathura imv
      bat
      ripgrep
      starship
      go
      pfetch
      gitui
      bottom
      handlr-regex
      ripgrep
      fzf
      gitoxide
      jql
      yt-dlp
      bacon
      imagemagick
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
      swaybg # swww
      # blender
      zellij
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
      wl-clipboard
      brave
      discord
      # swaylock-effects
      # swayidle
      # nginx
      python312
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
      gnumake just
      unzip
      libnotify

      # HACK: the agent isn't working for me so just installing it raw
      pinentry-rofi
      pinentry

      # Neovim deps
      stylua
      lua-language-server
      alejandra
      neovim
      appimage-run
      exa
      #libnotify
      #wlr-randr
      #swaylock-fancy
      #deluge
      #steam
      light
    ];

    pointerCursor = {
      gtk.enable = true;
      name = "Catppuccin-Mocha-Dark-Cursors";
      package = pkgs.catppuccin-cursors.mochaDark;
      size = 16;
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Compact-Mauve-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = ["mauve"];
        size = "compact";
        variant = "mocha";
      };
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    font.name = "Hack Nerd Font Medium";
  };

  systemd.user.targets.tray = {
    Unit = {
      Description = "Home Manager System Tray";
      Requires = [ "graphical-session-pre.target" ];
    };
  };
}

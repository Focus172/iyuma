{ config, lib, pkgs, user, ... }: {

  home.stateVersion = "23.05";
  # programs.home-manager.enable = true;

  imports = (import ./shared);
    # ++
    # (import ../modules/services);


  programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      patchPhase = ''
        substituteInPlace src/modules/wlr/workspace_manager.cpp --replace "zext_workspace_handle_v1_activate(workspace_handle_);" "const std::string command = \"hyprctl dispatch workspace \" + name_; system(command.c_str());"
      '';
    });
  };

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";

    packages = with pkgs; [
        rofi-wayland # rofi-calc rofi-pass
        # playerctl ncmpcpp mpc-cli
        alacritty cool-retro-term
        exa
        pass
        zathura imv
        bat
        ripgrep
        starship
        go rustup zig

        pfetch
        bottom
        handlr-regex
        ripgrep
        fzf
        gitui gitoxide
        jql
        yt-dlp
        bacon
        imagemagick
        # neo-cowsay
        # glow gum
        # slides charm
        # skate vhs
        lf
        swaybg # swww
        # blender
        zellij
        # acpi
        wl-gammactl
        wlsunset
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
        swaylock-effects swayidle
        #swaylock-fancy
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
        # obs-studio
        ffmpeg
        gnumake just
        unzip
        libnotify
        newsboat
      # deluge
      vorbis-tools

        pinentry-rofi
        pinentry

      ## Neovim deps
      stylua
      lua-language-server
      alejandra
      taplo
      neovim
      statix
      appimage-run

      ## Games
      dolphin-emu
      # retroarch

      ## study
      memento
      onscripter-en
    ];

    # pointerCursor = {
    #   gtk.enable = true;
    #   name = "Catppuccin-Mocha-Dark-Cursors";
    #   package = pkgs.catppuccin-cursors.mochaDark;
    #   size = 16;
    # };
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
}

{ config, pkgs, ... }: {
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Compact-Mauve-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "mauve" ];
        size = "compact";
        variant = "mocha";
      };
    };
    # iconTheme = {
    #   name = "Papirus-Dark";
    #   package = pkgs.papirus-icon-theme;
    # };
    font = {
      name = "Hack Nerd Font Medium";
      # package = pkgs.nerdfont.override { fonts = [ "Hack", "Mononoki" ] }
    };
  };
}

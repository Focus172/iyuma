{colors}:
with colors; {
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding = { x = 16; y = 16; };
        decorations = "none";
        font = {
            normal = {
                family = "Hack Nerd Font";
                size = 12;
            };
        };
        # dpi-aware = "yes";
        # # line-height = 16;
        # pad = "16x16";
        # # vertical-letter-offset = "3px";
      };
    };
  };
}

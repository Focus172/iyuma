{colors}:
with colors; {
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding = { x = 5; y = 5; };
        decorations = "none";
        font = {
            normal = {
                family = "Hack Nerd Font";
                size = 18;
            };
        };
        opacity = 0.6;
        # dpi-aware = "yes";
        # line-height = 18;
        # pad = "16x16";
        # vertical-letter-offset = "3px";
      };
    };
  };
}

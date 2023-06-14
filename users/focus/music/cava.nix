{ colors }: {
  home.file.".config/cava/config".text = ''
    [general]
    bar_width = 1
    bar_spacing = 0

    [color]
    gradient = 1
    gradient_count = 3
    gradient_color_1 = '#${colors.color4}'
    gradient_color_2 = '#${colors.color5}'
    gradient_color_3 = '#${colors.color1}'
  '';
}



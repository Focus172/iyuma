{
  config,
  pkgs,
  unstable,
  ...
}: {
  programs.broot = {
    enable = true;
    # vim mode
    enableBashIntegration = true;
    enableFishIntegration = true;
    settings = {
      # Configuration documentation is available at
      #     https://dystroy.org/broot

      ### read https://dystroy.org/broot/modal
      # modal = true;
      # initial_mode = "input";

      # Show hidden and gitignored files in search
      default_flags = "hg";

      # date_time_format: %Y/%m/%d %R

      # Mark the selected line with a triangle
      show_selection_mark = true;

      # Allows more than 2 splits at once
      max_panels_count = 2;

      # See https://dystroy.org/broot/icons for more info
      # Comment out for no icons
      # icon_theme = "vscode";

      # Bigger files are ignored when searching their content.
      # content_search_max_file_size = "5MB";

      ###############################################################
      # Column order
      # cols_order, if specified, must be a permutation of the following
      # array. You should keep the name column at the end as it has a
      # variable length.
      #
      # cols_order: [
      #     mark
      #     git
      #     size
      #     permission
      #     date
      #     count
      #     branch
      #     name
      # ]

      true_colors = false;

      # Special paths
      special_paths = {
        "/home/focus/ext" = "no-enter";
        "/home/focus/.local" = "hide";
        "/home/focus/.cache" = "hide";
        "/home/focus/dox" = "enter";
      };

      ###############################################################
      # Search modes
      #
      # broot allows many search modes.
      # A search mode is defined by
      # - the way to search: 'fuzzy', 'exact', 'regex', or 'tokens'.
      # - where to search: file 'name', 'path', or file 'content'
      # A search pattern may for example be "fuzzy path" (default),
      # "regex content" or "exact path".
      #
      # The search mode is selected from its prefix. For example, if
      # you type "abc", the default mode is "fuzzy path". If you type
      # "/abc", the mode is "regex path". If you type "rn/abc", the mode
      # is "regex name".
      #
      # More information on
      #  https://dystroy.org/broot/input/#the-filtering-pattern
      #
      # search_modes: {
      #     <empty>: fuzzy name
      #     /: regex name
      # }

      # File Extension Colors
      ext_colors = {
        png = "rgb(255, 128, 75)";
        rs = "yellow";
        toml = "ansi(105)";
      };
    };
  };
};

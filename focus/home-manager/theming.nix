{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # fonts
    (nerdfonts.override { fonts = [
      # "HackNerd"
      "Mononoki"
    ]; })
  ];

  home = {
    file = {
      ".config/gtk-4.0/gtk.css" = {
        text = ''
        window.messagedialog .response-area > button,
        window.dialog.message .dialog-action-area > button,
          .background.csd{ border-radius: 0; }
        '';
      };
    };
  };

  gtk = {
    enable = true;
    font.name = "Hack Nerd Font";
  };
}

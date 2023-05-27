{ pkgs, ... }:
{
  imports = [
    # ./starship.nix
    ./packages.nix
    # ./helix.nix
    ./neovim.nix
    ./sh.nix
    ./neofetch.nix
    ./desktop.nix
    ./theming.nix
    ./files.nix
    ./hyprland.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.package = pkgs.nix;

  targets.genericLinux.enable = true;
  
  home = {
    sessionVariables = {
      QT_XCB_GL_INTEGRATION = "none"; # kde-connect
      EDITOR = "nvim";
      VISUAL = "nvim";
      BROWSER = "brave";
      TERMINAL = "foot";
      NIXPKGS_ALLOW_UNFREE = "1";
      SHELL = "fish";
    };

    sessionPath = [
      "$HOME/.local/bin"
    ];
  };

  services = {
    kdeconnect = {
      enable = true;
      indicator = true;
    };
  };
}

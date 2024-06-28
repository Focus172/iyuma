{ config, pkgs, ... }: {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "focus";
  home.homeDirectory = "/home/focus";

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    cava
    foot
    # git
    # river
    bottom
    newsboat
    tmux
  ];

  xdg.configFile = {
    "cava/config".source = ../config/cava.toml;
    "foot/foot.ini".source = ../config/foot/foot.ini;
    "git/config".source = ../config/git/config;
    "bottom/bottom.toml".source = ../config/bottom.toml;
    # TODO: can set executable to true
    "river".source = ../config/river;
    "tmux/tmux.conf".source = ../config/tmux.conf;
    "newsboat".source = ../config/newsboat;
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/focus/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.
}

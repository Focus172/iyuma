{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    foot
    bemenu
    sandbar

    wlr-randr
  ];
}

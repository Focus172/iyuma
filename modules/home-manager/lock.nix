{
  config,
  lib,
  pkgs,
  user,
  ...
}: {
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      font-size = 24;
      indicator-idle-visible = false;
      indicator-radius = 100;
      line-color = "ffffff";
      show-failed-attempts = true;
      color = "282a2b";
      inside-color = "282a2b";
      inside-clear-color = "eeeeee";
      ring-color = "3B758C";
      ring-clear-color = "9fca56";
      ring-ver-color = "55b5db";
      fade-in = 0.2;
      grace = 2;
      screenshots = true;
      clock = true;
      # effect-vignette=0.5:0.5
      # effect-blur=7x5
      # ignore-empty-password =true;
    };
  };

  home.packages = [pkgs.swayidle];
}

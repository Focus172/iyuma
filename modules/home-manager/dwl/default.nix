{
  config,
  pkgs,
  unstable,
  ...
}: {
  home.packages = with unstable; [
    (dwl.override {conf = ./config.h;})
    foot
    eww-wayland
  ];
}

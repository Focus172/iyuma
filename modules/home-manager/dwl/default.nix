{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    (dwl.override {conf = ./config.h;})
    foot
  ];
}

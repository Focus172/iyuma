{
  pkgs,
  # config,
  ...
}: {
  services.syncthing.enable = true;
  services.syncthing.user = "focus";
  services.syncthing.dataDir = "/home/focus/dox";
}

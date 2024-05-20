{
  config,
  pkgs,
  unstable,
  ...
}: {
  programs.firefox.enable = true;

  programs.firefox.profiles = let
    userjs = builtins.readFile ./user.js;
  in
    (
      builtins.foldl' (acc: name: {
        id = acc.id + 1;
        profiles =
          acc.profiles
          // {
            "${name}" = {
              inherit name;
              inherit (acc) id;
              extraConfig = userjs;
              isDefault = name == "work";
            };
          };
      })
      {
        id = 0;
        profiles = {};
      }
      ["work" "personal" "school"]
    )
    .profiles;

  programs.firefox.nativeMessagingHosts = [unstable.firefoxpwa];
  home.packages = [unstable.firefoxpwa];

  programs.firefox.enableGnomeExtensions = true;
}

{pkgs, ...}: {
  environment.systemPackages = [pkgs.greetd.tuigreet];

  services.greetd = {
    enable = true;
    vt = 2;
    settings.default_session.command = "${pkgs.greetd.tuigreet}/bin/tuigreet --remember --time --asterisks --greeting 'Welcome home' --cmd Hyprland";
  };

  systemd.services.greetd = {
    preStart = "kill -SIGRTMIN+21 1";
    postStop = "kill -SIGRTMIN+20 1";
  };
}

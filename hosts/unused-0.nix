{ pkgs, home-manager, ... }: {

  environment.systemPackages = with pkgs; [
    git
    greetd.tuigreet
    vim
  ];

  services = {
    greetd = {
      enable = true;
      vt = 2;
      settings.default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --remember --time --asterisks --greeting 'Welcome home' --cmd Hyprland";
      };
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    printing.enable = true; # Abilita CUPS
    upower = {
      enable = true; # Abilita UPower
      ignoreLid = true; # Ignora lo stato del coperchio
    };
  };

  programs = {
    gnupg.agent.enable = true;
    ssh.startAgent = true;
  };

  virtualisation.docker.enable = true;

  # Abilitazione dei servizi PAM
  security = {
    polkit.enable = true;
    pam.services = {
      swaylock = {};
    };
  };

  systemd = {
    services = {
      greetd = {
        preStart = "kill -SIGRTMIN+21 1";
        postStop = "kill -SIGRTMIN+20 1";
      };
    };
  };
}

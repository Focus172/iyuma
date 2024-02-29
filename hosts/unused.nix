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
  };

  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    printing.enable = true; # Cups
    upower = {
      enable = true;
      ignoreLid = true;
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

  # time.hardwareClockInLocalTime = true;
  #
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;
  # hardware.pulseaudio.extraConfig = "load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1";
  # security.rtkit.enable = true;
  # virtualisation.libvirtd.enable = true;
  #
  # environment.shells = with pkgs; [ zsh ];
}

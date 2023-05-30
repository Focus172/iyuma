{ pkgs, home-manager, ... }: {

  boot = {
    loader = {
      grub = {
        enable = true;
        efiSupport = true;
        devices = [ "nodev" ];
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
    };
  };

  # Impostazioni di rete
  networking = {
    networkmanager.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  # Programmi da installare per tutto il sistema
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

  # Configurazione dei programmi installati
  programs = {
    fish.enable = true;
    gnupg.agent = {
      enable = true;
    };
    ssh.startAgent = true;
  };

  virtualisation = {
    docker.enable = true;
  };

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

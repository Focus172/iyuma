{ config, pkgs }: {
  services.mpd = {
    enable = true;
    musicDirectory = "${config.home.homeDirectory}/aud/music";
    dataDir = "${config.home.homeDirectory}/.config/mpd";
    extraConfig = ''
    auto_update       "yes"
    restore_paused    "yes"

    audio_output {
        type "pulse"
        name "Pulseaudio"
        server "127.0.0.1" 
    }

    audio_output {
      	type            "fifo"
      	name            "Visualizer"
      	format          "44100:16:2"
      	path            "/tmp/mpd.fifo"
    }
    
    audio_output {
      	type		    "httpd"
      	name		    "lossless"
      	encoder		    "flac"
      	port		    "8000"
      	max_client	    "8"
      	mixer_type	    "software"
      	format		    "44100:16:2"
    }
    '';
    network.startWhenNeeded = true;
  };


  home.packages = [ pkgs.playerctl ];
  # services.mpdris2.enable = true;
  services.playerctld.enable = true;
}


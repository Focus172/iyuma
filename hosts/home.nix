{ config, lib, pkgs, user, ... }: {
  home.packages = with pkgs; [
    playerctl
    # pkgs.mpc-cli
    # pkgs.lutris
  ];

  # services.mpd-discord-rpc.enable = false;
  # programs.ncmpcpp.enable = true;

  # services.mpd = {
  #   enable = true;
  #   musicDirectory = "${config.home.homeDirectory}/aud";
  #   dataDir = "${config.home.homeDirectory}/.config/mpd";
  #   extraConfig = ''
  #       auto_update       "yes"
  #       restore_paused    "yes"
  #       audio_output {
  #           type "alsa"
  #           name "Pulseaudio"
  #           server "127.0.0.1"
  #       }
  #       audio_output {
  #           type            "fifo"
  #           name            "Visualizer"
  #           format          "44100:16:2"
  #           path            "/tmp/mpd.fifo"
  #       }
  #       audio_output {
  #           type		    "httpd"
  #           name		    "lossless"
  #           encoder         "vorbis"
  #           port            "6600"
  #           max_client	    "8"
  #           mixer_type	    "software"
  #           format		    "44100:16:2"
  #       }
  #   '';
  #   network.startWhenNeeded = true;
  # };

  # services.mpd = {
  #   enable = true;
  #   # user = "focus";
  #   musicDirectory = "/home/${user}/aud";
  #   playlistDirectory = "/home/${user}/.config/mpd/playlists";
  #   extraConfig = ''
  #     auto_update "yes"
  #     pid_file "/tmp/mpd.pid"
  #     audio_output {
  #       type "pipewire"
  #       name "Main Out"
  #       # device "pipewire"
  #       # mixer_type "software"
  #     }
  #   '';
  # };


  # services.mpdris2.enable = true;
  # services.playerctld.enable = true;

  # programs.ncmpcpp = {
  #   enable = true;
  #   package = pkgs.ncmpcpp.override {
  #     visualizerSupport = true;
  #     clockSupport = false;
  #     taglibSupport = true;
  #   };
  #   mpdMusicDir = "${config.home.homeDirectory}/aud";
  #   settings = {
  #     ncmpcpp_directory = "${config.home.homeDirectory}/.config/ncmpcpp";
  #     ignore_leading_the = true;
  #     external_editor = "nvim";
  #     message_delay_time = 1;
  #     playlist_disable_highlight_delay = 2;
  #     autocenter_mode = "yes";
  #     centered_cursor = "yes";
  #     allow_for_physical_item_deletion = "no";
  #     lines_scrolled = "0";
  #     follow_now_playing_lyrics = "yes";
  #     lyrics_fetchers = "musixmatch";
  #     lyrics_directory = "${config.home.homeDirectory}/.local/share/lyrics";
  #
  #     # visualizer
  #     visualizer_data_source = "/tmp/mpd.fifo";
  #     visualizer_output_name = "mpd_visualizer";
  #     visualizer_type = "ellipse";
  #     visualizer_look = "●● ";
  #     visualizer_color = "blue, green";
  #
  #     # appearance
  #     colors_enabled = "yes";
  #     playlist_display_mode = "classic";
  #     user_interface = "classic";
  #     volume_color = "white";
  #   };
  # };
}

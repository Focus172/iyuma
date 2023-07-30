# vim: ts=2 : sw=2

{ config, lib, pkgs, host, user, ...}: {
  programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      patchPhase = ''
        substituteInPlace src/modules/wlr/workspace_manager.cpp --replace "zext_workspace_handle_v1_activate(workspace_handle_);" "const std::string command = \"hyprctl dispatch workspace \" + name_; system(command.c_str());"
      '';
    });
    # systemd = {
      # enable = true;
      # target = "sway-session.target";
    # };

    style = ''
* {
    border: none;
    border-radius: 2;
    font-family: Hack Nerd Font, monospace;
    font-weight: bold;
    font-size: 15px;
    min-height: 0;
}

window#waybar {
    background: rgba(21, 18, 27, 0);
    color: #cdd6f4;
}

tooltip {
    background: #1e1e2e;
    border-radius: 10px;
    border-width: 2px;
    border-style: solid;
    border-color: #11111b;
}

#workspaces button {
    padding: 5px;
    color: #313244;
    margin-right: 5px;
}

#workspaces button.active {
    color: #a6adc8;
}

#workspaces button.focused {
    color: #a6adc8;
    background: #eba0ac;
    border-radius: 10px;
}

#workspaces button.urgent {
    color: #11111b;
    background: #a6e3a1;
    border-radius: 10px;
}

#workspaces button:hover {
    background: #11111b;
    color: #cdd6f4;
    border-radius: 10px;
}

#custom-language,
#custom-updates,
#window,
#clock,
#battery,
#pulseaudio,
#network,
#workspaces,
#tray,
#cpu,
#memory,
#mpd,
#temperature,
#custom-menu,
#backlight {
    background: #1e1e2e;
    padding: 0px 0px;
    margin: 0px 0px;
    margin-top: 5px;
    border: 3px solid #181825;
}

#tray {
    border-radius: 10px;
    margin-right: 10px;
}

#mpd {
    border-radius: 10px;
    margin-left: 20px;
    padding-left: 10px;
}

#workspaces {
    background: #1e1e2e;
    border-radius: 10px;
    margin-left: 10px;
    padding-right: 0px;
    padding-left: 5px;
}

#custom-menu {
    color: #89dceb;
    border-radius: 0px 10px 10px 0px;
    border-right: 10px;
    margin-right: 5px;
    padding-right: 10px;
}

#custom-language {
    color: #f38ba8;
    border-left: 0px;
    border-right: 0px;
}

/* color: #f5c2e7; */

#window {
    border-radius: 0px 10px 10px 0px;
    margin-left: 0px;
    margin-right: 60px;
}

#clock {
    color: #fab387;
    border-radius: 10px;
    margin-left: 0px;
    border-right: 0px;
}

#network {
    color: #f9e2af;
    border-left: 0px;
    border-right: 0px;
}

#pulseaudio {
    color: #89b4fa;
    border-left: 0px;
    border-right: 0px;
}

#pulseaudio.microphone {
    color: #cba6f7;
    margin-right: 5px;
    border-radius: 0 10px 10px 0;
}

#battery {
    color: #a6e3a1;
    border-radius: 10px 0px 0px 10px;
    margin-right: 0px;
    border-left: 0px;
}

#custom-weather {
    border-radius: 0px 10px 10px 0px;
    border-right: 0px;
    margin-left: 0px;
}


/**/
/* window#waybar { */
/*     background: shade(alpha(@mantle, 0.9), 1.0); */
/*     border-bottom: shade(alpha(@base, 0.9), 1.0); */
/*     color: @rosewater; */
/*     transition-property: background-color; */
/*     transition-duration: .5s; */
/*     border-radius: 15px; */
/* } */
/**/
/* window#waybar.hidden { */
/*     opacity: 0.2; */
/* } */
/**/
/* window#waybar.empty { */
/*     background-color: transparent; */
/* } */
/* window#waybar.solo { */
/*     background-color: #FFFFFF; */
/* } */
/**/
/* window#waybar.alacritty { */
/*     background-color: #3F3F3F; */
/* } */
/**/
/* window#waybar.firefox { */
/*     background-color: #000000; */
/*     border: none; */
/* } */
/**/
/* workspaces { */
/*     border-radius: 15px 6px 6px 15px; */
/* } */
/**/
/* #workspaces button { */
/*     padding: 0 5px; */
/*     background-color: transparent; */
/*     color: @rosewater; */
    /* Use box-shadow instead of border so the text isn't offset */
/*     box-shadow: inset 0 -3px transparent; */
    /* Avoid rounded borders under each workspace name */
/*     border: none; */
/*     border-radius: 1px; */
/* } */
/**/
/* #workspaces button:hover { */
/*     background: rgba(0, 0, 0, 0.2); */
/*     box-shadow: inset 0 -3px @maroon; */
/*     border-radius: 5px; */
/*     border: none; */
/**/
/* } */
/**/
/* #workspaces button.active { */
/*     background-color: @surface2; */
/*     box-shadow: inset 0 -3px @pink; */
/*     border-radius: 5px; */
/*     border: none; */
/* } */
/**/
/* #workspaces button.urgent { */
/*     background-color: shade(alpha(@red, 0.7), 0.8); */
/* } */
/**/
/* #mode { */
/*     background-color: #64727D; */
/*     border-bottom: 3px solid #ffffff; */
/* } */
/**/
/* #window, */
/* #workspaces { */
/*     margin: 0 4px; */
/* } */
/**/
/* #clock { */
/*     background-color: @surface0; */
/*     color: @rosewater; */
/* } */
/**/
/* #battery { */
/*     background-color: #ffffff; */
/*     color: #000000; */
/* } */
/**/
/* #battery.charging, #battery.plugged { */
/*     color: #ffffff; */
/*     background-color: #26A65B; */
/* } */
/**/
/* @keyframes blink { */
/*     to { */
/*         background-color: #ffffff; */
/*         color: #000000; */
/*     } */
/* } */
/**/
/* #battery.critical:not(.charging) { */
/*     background-color: #f53c3c; */
/*     color: #ffffff; */
/*     animation-name: blink; */
/*     animation-duration: 0.5s; */
/*     animation-timing-function: linear; */
/*     animation-iteration-count: infinite; */
/*     animation-direction: alternate; */
/* } */
/**/
/* label:focus { */
/*     background-color: #000000; */
/* } */
/**/
/* #cpu { */
/*     background-color: @green; */
/*     color: #4c4f69; */
/* } */
/**/
/* #memory { */
/*     background-color: @lavender; */
/*     color: #4c4f69; */
/* } */
/**/
/* #disk { */
/*     background-color: #964B00; */
/* } */
/**/
/* #backlight { */
/*     background-color: #90b1b1; */
/* } */
/**/
/* #network { */
/*     background-color: @lavender; */
/*     color: #4c4f69; */
/* } */
/**/
/* #network.disconnected { */
/*     background-color: #f53c3c; */
/* } */
/**/
/* #pulseaudio { */
/*     background-color: @peach; */
/*     color: #4c4f69; */
/* } */
/**/
/* #pulseaudio.muted { */
/*     background-color: @peach; */
/*     color: #4c4f69; */
/* } */
/**/
/* #custom-media { */
/*     background-color: @red; */
/*     color: #4c4f69; */
/*     min-width: 100px; */
/* } */
/**/
/* #custom-media.custom-spotify { */
/*     background-color: @green; */
/*     color: #4c4f69; */
/* } */
/**/
/* #custom-media.custom-vlc { */
/*     background-color: #ffa000; */
/* } */
/**/
/* #temperature { */
/*     background-color: @peach; */
/*     color: #4c4f69; */
/* } */
/**/
/* #temperature.critical { */
/*     background-color: @red; */
/* } */
/**/
/* #tray { */
/*     background-color: @blue; */
/* } */
/**/
/* #tray > .passive { */
/*     -gtk-icon-effect: dim; */
/* } */
/**/
/* #tray > .needs-attention { */
/*     -gtk-icon-effect: highlight; */
/*     background-color: @blue; */
/* } */
/**/
/* #idle_inhibitor { */
/*     background-color: @surface0; */
/*     color: @rosewater; */
/* } */
/**/
/* #idle_inhibitor.activated { */
/*     background-color: @lavender; */
/*     color: #4c4f69; */
/* } */
/**/
/* #mpd { */
/*     background-color: #66cc99; */
/*     color: #2a5c45; */
/* } */
/**/
/* #mpd.disconnected { */
/*     background-color: #f53c3c; */
/* } */
/**/
/* #mpd.stopped { */
/*     background-color: #90b1b1; */
/* } */
/**/
/* #mpd.paused { */
/*     background-color: #51a37a; */
/* } */
/**/
/* #language { */
/*     background: @mauve; */
/*     color: #4c4f69; */
/*     padding: 0 5px; */
/*     margin: 0 5px; */
/*     min-width: 16px; */
/* } */
/**/
/* .custom-spotify { */
/*     padding: 0 10px; */
/*     background-color: @green; */
/*     color: #4c4f69; */
/* } */
/**/
/* #gamemode { */
/*     background-color: @surface1; */
/*     color: @rosewater; */
/**/
/* } */
/**/
/* #gamemode.running { */
/*     background-color: #ca9ee6; */
/*     padding: 0 5px; */
/*     margin: 0 4px; */
/*     color: #1e66f5; */
/* } */
/**/
/* #keyboard-state { */
/*     background: @mauve; */
/*     color: #4c4f69; */
/*     padding: 0 0px; */
/*     margin: 0 5px; */
/*     min-width: 16px; */
/* } */
/**/
/* #keyboard-state > label { */
/*     padding: 0 5px; */
/* } */
/**/
/* #keyboard-state > label.locked { */
/*     background: rgba(0, 0, 0, 0.2); */
/* } */
/* #custom-separator { */
/*   color: rgba(67, 255, 100, 0); */
/*   margin: 0px 30px; */
/* } */
/**/
/* #custom-separator2 { */
/*   color: rgba(67, 255, 100, 0); */
/*   padding: 0 1px; */
/*   font-size: 1px; */
/*   margin: 0px 1px 0px 3px; */
/* } */
/**/
/* #custom-separator3 { */
/*   color: rgba(67, 255, 100, 0); */
/*   padding: 0 1px; */
/*   font-size: 1px; */
/*   margin: 0px 3px 0px 1px; */
/* } */
/**/
/* #custom-power { */
/*     background-color: @mauve; */
/*     color: @base; */
/*     padding: 0 15px; */
/*     border-radius: 6px 15px 15px 6px; */
/* } */
/*   * { */
/*     border: none; */
/*     border-radius: 0; */
/*     font-family: Blex Mono Nerd Font; */
/*     font-size: 13px; */
/*     font-weight: 400; */
/*   } */
/**/
/*   window#waybar { */
/*     background-color: #13171b; */
/*     color: #b6beca; */
/*   } */
/**/
/*   #window { */
/*     margin-top: 0px; */
/*     margin-bottom: 4px; */
/*     padding-left: 16px; */
/*     padding-right: 16px; */
/*     padding-top: 0; */
/*     padding-bottom: 0; */
/*     border-radius: 13px; */
/*     transition: none; */
/*   } */
/**/
/*   #custom-notification{ */
/*     font-size: 13px; */
/*   } */
/**/
/*   #custom-logo{ */
/*     font-size: 16px; */
/*     color: #8cc1ff */
/*   } */
/**/
/**/
/*   #workspaces button { */
/*     padding-top: 2px; */
/*     padding-bottom: 2px; */
/*     padding-left: 4px; */
/*     padding-right: 4px; */
/*     color: #3b4b58; */
/*     font-family: SFMono; */
/*     border-radius: 5px; */
/*     font-size: 20px; */
/*   } */
/**/
/*   #workspaces button.focused { */
/*     color: #dee1e6; */
/*     border-bottom: none; */
/*     font-size: 20px; */
/*   } */
/*   #workspaces button.active { */
/*     color: #dee1e6; */
/*     border-bottom: none; */
/*     font-size: 20px; */
/*   } */
/*   #workspaces button.urgent { */
/*     color: #f9929b; */
/*   } */
/**/
/* #mode, */
/* #custom-updates, */
/* #cpu, */
/* #memory, */
/* #temperature, */
/* #custom-fans, */
/* #tray, */
/* #idle_inhibitor, */
/* #language, */
/* #custom-spacer, */
/* #custom-power { */
/*   background-color: #171b20; */
/*   padding: 0 10px; */
/*   margin: 2px 4px 5px 4px; */
/*   border: 3px solid rgba(0, 0, 0, 0); */
/*   border-radius: 90px; */
/*   background-clip: padding-box; */
/* } */
/**/
/* #custom-updates { */
/*   background-color: #1e222a; */
/*   padding: 0 10px; */
/*   color: #8cc1ff; */
/*   margin: 2px 4px 5px 4px; */
/*   border: 3px solid rgba(0, 0, 0, 0); */
/*   border-radius: 90px; */
/*   background-clip: padding-box; */
/* } */
/**/
/*   #workspaces { */
/*     margin-top: 5px; */
/*     margin-bottom: 4px; */
/*     margin-left: 8px; */
/*     margin-right: 8px; */
/*     transition: none; */
/*     padding: 0px 0px 0px 10px; */
/*     background: transparent; */
/*   } */
/**/
/* #custom-power { */
/*   background-color: #1e222a; */
/*   padding: 0 12px; */
/*   margin: 2px 4px 5px 4px; */
/*   border: 3px solid rgba(0, 0, 0, 0); */
/*   border-radius: 0px; */
/*   background-clip: padding-box; */
/* } */
/* #workspaces button { */
/*   transition: none; */
/*   padding-left: 6px; */
/*   padding-right: 6px; */
/*   color: #3b4b58; */
/*   font-weight: normal; */
/* } */
/**/
/* #workspaces button:hover { */
/*   color: #61afef; */
/* } */
/**/
/* #workspaces button.focused { */
/*   color: #b6beca; */
/*   font-weight: bold; */
/* } */
/**/
/* #tray { */
/*   margin-top: 5px; */
/*   margin-bottom: 4px; */
/*   margin-right: 6px; */
/*   margin-left: 0px; */
/*   padding: 0px 9px; */
/* } */
/**/
/* #workspaces button.urgent { */
/*   color: #e06c75; */
/* } */
/* #temperature { */
/*   color: #d19a66; */
/* } */
/**/
/* #temperature.critical { */
/*   background-color: #e06c75; */
/*   color: #1e222a; */
/* } */
/* #battery { */
/*   margin-top: 5px; */
/*   margin-bottom: 4px; */
/*   margin-right: 6px; */
/*   margin-left: 0px; */
/*   padding: 0px 9px; */
/*   color: #b6beca; */
/* } */
/**/
/* #battery.charging, #battery.plugged { */
/*   color: #a3b8ef; */
/* } */
/**/
/**/
/*   #battery.discharging { */
/*     color: #b6beca; */
/*   } */
/* @keyframes blink { */
/*     to { */
/*         background-color: #1e222a; */
/*         color: #e06c75; */
/*     } */
/* } */
      '';
      settings = with host; {
        Main = {
          layer = "top";
          position = "top";
          height = 16;
          tray = { spacing = 5; };

          modules-left = [ "wlr/workspaces" "tray" "mpd"];
          modules-center = [ "clock" ];
          modules-right = ["battery" "pulseaudio" "pulseaudio#microphone" "backlight" "network" "cpu" "memory" "temperature"];
          # modules-right = [ "cpu" "memory" "custom/pad" "battery" "custom/pad" "backlight" "custom/pad" "pulseaudio" "custom/pad" "tray" ];

          "wlr/workspaces" = {
            format = "{name}";
            format-icons = {
              "1"="";
              "2"="";
              "3"="";
              "4"="";
              "5"="";
              "9"="";
              "10"="";
            };
            active-only = false;
            on-click = "activate";
          };
          clock = {
            format = "{:%b %d %H:%M}";
            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          };
          cpu = {
            format = " {usage}%  ";
            interval = 3;
          };
          disk = {
            format = "{percentage_used}%  ";
            path = "/";
            interval = 300;
          };
          memory = {
            format = "{}%  ";
            interval = 3;
          };
          backlight = {
            device = "intel_backlight";
            format= "{percent}% {icon}";
            format-icons = ["" ""];
            # on-scroll-down = "${pkgs.light}/bin/light -U 5";
            # on-scroll-up = "${pkgs.light}/bin/light -A 5";
          };
          battery = {
            interval = 60;
            states = {
              warning = 30;
              critical = 15;
            };
            format = "{capacity}% {icon}";
            format-charging = "{capacity}%  ";
            format-icons = [" " " " " " " " " "];
            max-length = 25;
          };
          network = {
            format-wifi = " ";
            format-ethernet = "󰈀 "; #{ifname}: {ipaddr}/{cidr}";
            format-linked = "󱘖 {ifname} (No IP)";
            format-disconnected = "󱘖  Not connected";
            tooltip-format = "{essid} {ipaddr}/{cidr}";
            on-click-right = "alacritty -e nmtui";
          };
          pulseaudio = {
            format = "{icon} {volume}% {format_source} ";
            format-bluetooth = "<span font='11'>{icon}</span> {volume}% {format_source} ";
            format-bluetooth-muted = "<span font='11'>x</span> {volume}% {format_source} ";
            format-muted = "<span font='11'>x</span> {volume}% {format_source} ";
            #format-source = "{volume}% <span font='11'></span>";
            format-source = "<span font='10'></span> ";
            format-source-muted = "<span font='11'> </span> ";
            format-icons = {
              default = [ "" "" "" ];
              headphone = "";
              #hands-free = "";
              #headset = "";
              #phone = "";
              #portable = "";
              #car = "";
            };
            tooltip-format = "{desc}, {volume}%";
            on-click = "${pkgs.pamixer}/bin/pamixer -t";
            on-click-right = "${pkgs.pamixer}/bin/pamixer --default-source -t";
            on-click-middle = "${pkgs.pavucontrol}/bin/pavucontrol";
          };
          tray = {
            icon-size = 13;
          };
        };
      };
    };
}

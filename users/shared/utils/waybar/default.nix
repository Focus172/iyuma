{pkgs, ...}: {
  programs.waybar = {
    enable = true;
    systemd = {
      enable = false;
      target = "graphical-session.target";
    };
    style = (import ./style.nix) {};
    settings = [
      {
        "layer" = "top";
        "position" = "top";
        modules-left = [
          "wlr/workspaces"
          "tray"
          "mpd"
        ];
        # "custom/launcher"
        modules-center = [
          "clock"
        ];
        modules-right = [
          "battery"
          "pulseaudio"
          "pulseaudio#microphone"
          "backlight"
          "network"
          "custom/power"
        ];
        "disk" = {
          "path" = "/home";
          "format" = "󰋊 {percentage_used}%";
        };
        "custom/wall" = {
          "on-click" = "wallpaper_random";
          "on-click-middle" = "default_wall";
          "on-click-right" = "killall dynamic_wallpaper || dynamic_wallpaper &";
          "format" = " ﴔ ";
          "tooltip" = false;
        };
        "wlr/workspaces" = {
          "all-outputs" = true;
          "on-scroll-up" = "hyprctl dispatch workspace e+1";
          "on-scroll-down" = "hyprctl dispatch workspace e-1";
          "on-click" = "activate";
          "format" = "{name}";
        };
        "pulseaudio" = {
          "scroll-step" = 5;
          "format" = "{icon} {volume}%";
          "format-muted" = "󰸈 Muted";
          "format-icons" = {
            "default" = ["" "" "󱄠"];
          };
          "on-click" = "pamixer -t";
          "on-click-right" = "pavucontrol";
          "on-click-middle" = "$HOME/.local/bin/toggle_sound_output";
          "tooltip" = false;
        };
        "pulseaudio#microphone" = {
          "format" = "{format_source}";
          "format-source" = "󰍬 {volume}%";
          "format-source-muted" = "󰍭 Muted";
          "on-click" = "pamixer --default-source -t";
          "on-scroll-up" = "pamixer --default-source -i 5";
          "on-scroll-down" = "pamixer --default-source -d 5";
          "scroll-step" = 5;
          "on-click-right" = "pavucontrol";
        };
        "clock" = {
          "interval" = 1;
          "format" = "{:%I:%M %p  %A %b %d}";
          "tooltip" = true;
          "tooltip-format" = "<tt>{calendar}</tt>";
        };
        "memory" = {
          "interval" = 1;
          "format" = "󰨅 {percentage}%";
          "states" = {
            "warning" = 85;
          };
        };
        "cpu" = {
          "interval" = 1;
          "format" = " {usage}%";
        };
        "network" = {
          "interval" = 1;
          # "format" = "說 Connected({ifname})";
          "format" = "說 Connected";
          "format-alt" = "  {bandwidthUpBytes}    {bandwidthDownBytes}";
          "format-disconnected" = "說 Disconnected";
          "tooltip" = false;
        };
        "temperature" = {
          "tooltip" = false;
          "thermal-zone" = 2;
          "hwmon-path" = "/sys/class/hwmon/hwmon2/temp1_input";
          "format" = " {temperatureC}°C";
        };
        "tray" = {
          "icon-size" = 12;
          "spacing" = 8;
        };
      }
    ];
  };
  programs.waybar.package = pkgs.waybar.overrideAttrs (oa: {
    mesonFlags = (oa.mesonFlags or []) ++ ["-Dexperimental=true"];
  });
}

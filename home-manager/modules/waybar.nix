{ config, ... }:

let
  colors = config.lib.stylix.colors;
in
{
  programs.waybar = {
    enable = true;
    style = ''
      * {
        background-color: #${colors.base01};
        color: #${colors.base08};

        border: none;
        border-radius: 0;
        min-height: 0;
        font-family: 'DejaVu Sans Mono', 'Font Awesome 7 Free';
        font-size: 14px;
      }

      .modules-left {
        margin-left: 8px;
      }

      .modules-right {
        margin-right: 8px;
      }

      #workspaces button {
        all: initial;
        padding: 0 6px;
        margin: 0 1.5px;
        min-width: 9px;
      }

      #workspaces button.empty {
        opacity: 0.5;
      }

      #tray {
        margin-right: 20px;
      }

      #network,
      #bluetooth,
      #pulseaudio,
      #cpu,
      #battery {
        margin-right: 15px;
      }

      tooltip {
        padding: 2px;
      }
    '';
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        modules-left = [ "niri/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [
          "tray"
          "network"
          "bluetooth"
          "pulseaudio"
          "cpu"
          "battery"
        ];

        "niri/workspaces" = {
          format = "{icon}";
          format-icons = {
            "default" = "";
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
            "10" = "0";
            "active" = "󱓻";
          };
        };

        "clock" = {
          tooltip = false;
        };

        "tray" = {
          icon-size = 12;
          spacing = 17;
        };

        "network" = {
          format = "{icon}";
          format-icons = {
            "wifi-0" = "󰤯";
            "wifi-1" = "󰤟";
            "wifi-2" = "󰤢";
            "wifi-3" = "󰤥";
            "wifi-4" = "󰤨";
            "ethernet" = "󰀂";
            "disconnected" = "󰤮";
          };
          tooltip-format-wifi = "{essid} ({frequency} GHz)\n⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}";
          tooltip-format-ethernet = "⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}";
          tooltip-format-disconnected = "Disconnected";
          interval = 3;
          spacing = 1;
          on-click = "$TERMINAL -e impala";
        };

        "bluetooth" = {
          format = "󰂲";
          format-connected = "󰂱";
          format-no-controller = "";
          tooltip-format = "Devices connected: {num_connections}";
          on-click = "$TERMINAL -e bluetui";
        };

        "pulseaudio" = {
          format = "{icon}";
          tooltip-format = "Volume: {volume}%";
          scroll-step = 5;
          format-muted = "󰝟";
          format-icons = {
            "default" = [
              "󰖁"
              "󰖀"
              "󰕾"
            ];
          };
          on-click = "pavucontrol";
        };

        "cpu" = {
          interval = 5;
          format = "󰍛";
        };

        "battery" = {
          format = "{capacity}% {icon}";
          format-discharging = "{icon}";
          format-charging = "{icon}";
          format-plugged = "";
          format-icons = {
            charging = [
              "󰢜"
              "󰂆"
              "󰂇"
              "󰂈"
              "󰢝"
              "󰂉"
              "󰢞"
              "󰂊"
              "󰂋"
              "󰂅"
            ];
            default = [
              "󰁺"
              "󰁻"
              "󰁼"
              "󰁽"
              "󰁾"
              "󰁿"
              "󰂀"
              "󰂁"
              "󰂂"
              "󰁹"
            ];
          };
          format-full = "󰂅";
          tooltip-format-discharging = "{power:>1.0f}W↓ {capacity}%";
          tooltip-format-charging = "{power:>1.0f}W↑ {capacity}%";
          interval = 5;
          states = {
            warning = 30;
            critical = 20;
          };
        };
      };
    };
  };
}

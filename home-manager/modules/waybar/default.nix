{
  programs.waybar = {
    enable = true;
    style = ./style.css;
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

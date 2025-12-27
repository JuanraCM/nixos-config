{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        modules-left = [
          "niri/workspaces"
          "niri/window"
        ];
        modules-center = [ "clock" ];
        modules-right = [
          "cpu"
          "battery"
          "pulseaudio"
          "network"
          "bluetooth"
        ];

        "pulseaudio" = {
          on-click = "pavucontrol";
        };
      };
    };
  };
}

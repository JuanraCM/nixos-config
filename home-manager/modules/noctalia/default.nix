{ config, inputs, ... }:

{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;
    settings =
      # toml
      ''
        [shell]
        font_family = "Noto Sans"
        settings_show_advanced = true

        [location]
        auto_locate = true

        [theme]
        builtin = "Tokyo-Night"
        mode = "dark"
        source = "builtin"

        [wallpaper.default]
        path = "${config.home.homeDirectory}/Pictures/Wallpapers/background.png"

        [bar.default]
        start = [ "workspaces" ]
        center = [ "clock", "media" ]
        end = [ "tray", "notifications", "network", "bluetooth", "volume", "sysmon", "battery" ]
        margin_edge = 0
        margin_ends = 0
        radius = 0
        widget_spacing = 10


        [widget.workspaces]
        minimal = true

        [widget.media]
        hide_when_no_media = true

        [widget.volume]
        show_label = false

        [widget.sysmon]
        display = "text"
      '';
  };

  home.file."Pictures/Wallpapers/background.png" = {
    source = ./background.png;
  };
}

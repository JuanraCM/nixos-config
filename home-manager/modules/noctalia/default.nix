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

        [shell.launcher]
        categories = false

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
        shadow = false
        widget_spacing = 10

        [widget.workspaces]
        display = "name"
        minimal = true
        labels_only_when_occupied = true

        [widget.media]
        hide_when_no_media = true

        [widget.network]
        show_label = false

        [widget.volume]
        show_label = false

        [widget.sysmon]
        display = "text"

        [plugins]
        enabled = [ "noctalia/translator" ]

        [desktop_widgets]
        enabled = false

        [lockscreen_widgets]
        enabled = false

        [keybinds]
        validate = [ "Return", "KP_Enter" ]
        down = [ "Down", "Ctrl+n" ]
        up = [ "Up", "Ctrl+p" ]
      '';
  };

  home.file."Pictures/Wallpapers/background.png" = {
    source = ./background.png;
  };
}

{ config, inputs, ... }:

{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;
    settings = {
      shell = {
        font_family = "Noto Sans";
        settings_show_advanced = true;
        launcher.categories = false;
        panel.shadow = false;
      };

      theme = {
        builtin = "Tokyo-Night";
        mode = "dark";
      };

      location.auto_locate = true;

      wallpaper.default.path = "${config.home.homeDirectory}/Pictures/Wallpapers/background.png";

      bar.default = {
        start = [ "workspaces" ];
        center = [
          "clock"
          "media"
          "pulse"
        ];
        end = [
          "tray"
          "notifications"
          "network"
          "bluetooth"
          "volume"
          "sysmon"
          "battery"
        ];
        margin_edge = 0;
        margin_ends = 0;
        radius = 0;
        shadow = false;
        widget_spacing = 10;
      };

      widget = {
        workspaces = {
          label_source = "name";
          labels_only_when_occupied = true;
          scale = 0.75;
          style = "minimal";
        };

        media = {
          hide_when_no_media = true;
        };

        network = {
          show_label = false;
        };

        volume = {
          show_label = false;
        };

        sysmon = {
          show_value = true;
          visualization = "none";
        };

        pulse = {
          type = "lowcache/claude-companion:pulse";
        };
      };

      desktop_widgets.enabled = false;
      lockscreen_widgets.enabled = false;

      plugins = {
        enabled = [
          "noctalia/translator"
          "noctalia/bitwarden"
          "lowcache/claude-companion"
        ];
      };

      keybinds = {
        validate = [
          "Return"
          "KP_Enter"
        ];
        down = [
          "Down"
          "Ctrl+n"
        ];
        up = [
          "Up"
          "Ctrl+p"
        ];
      };
    };
  };

  home.file."Pictures/Wallpapers/background.png" = {
    source = ./background.png;
  };

  # Symlink claude-companion plugin files to its canonical folder
  home.file.".local/share/noctalia/plugins/claude-companion" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.local/state/noctalia/plugins/materialized/community/claude-companion";
  };
}

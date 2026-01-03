{ config, ... }:

let
  colors = config.lib.stylix.colors;
in
{
  home.file.".config/niri/config.kdl" = {
    text =
      # kdl
      ''
        spawn-at-startup "waybar"
        spawn-at-startup "mako"
        spawn-sh-at-startup "swaybg -m fill -i ~/.config/niri/background.png"

        // spawn-sh-at-startup "wl-paste --watch cliphist store"
        screenshot-path "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png"
        prefer-no-csd

        input {
          keyboard {
            numlock
          }

          touchpad {
            tap
            natural-scroll
          }

          mouse {
            accel-speed -0.2
            accel-profile "flat"
          }

          warp-mouse-to-focus
          focus-follows-mouse
        }

        layout {
          gaps 8
          center-focused-column "never"
          default-column-width { proportion 0.5; }

          focus-ring {
            off
          }

          border {
            width 2
            active-color "${colors.base0D}"
            inactive-color "${colors.base04}"
            urgent-color "${colors.base0F}"
          }
        }

        animations {
          slowdown 0.8
        }

        window-rule {
          geometry-corner-radius 4
          clip-to-geometry true
        }

        window-rule {
          match app-id="qemu"
          open-maximized true
        }

        window-rule {
          match title="^Picture in picture$"
          open-floating true
        }

        window-rule {
          match app-id="steam" title=r#"^notificationtoasts_\d+_desktop$"#
          default-floating-position x=10 y=10 relative-to="bottom-right"
        }

        binds {
          Mod+Return { spawn "wezterm"; }
          Mod+B { spawn "chromium"; }
          Mod+Space { spawn "wofi" "-S" "drun"; }
          Mod+Q { spawn "power-menu"; }

          Mod+O repeat=false { toggle-overview; }
          Mod+W repeat=false { close-window; }

          Mod+H     { focus-column-left; }
          Mod+J     { focus-window-down; }
          Mod+K     { focus-window-up; }
          Mod+L     { focus-column-right; }

          Mod+Shift+H     { move-column-left; }
          Mod+Shift+J     { move-window-down; }
          Mod+Shift+K     { move-window-up; }
          Mod+Shift+L     { move-column-right; }

          Mod+F { maximize-column; }
          Mod+Shift+F { fullscreen-window; }
          Mod+Alt+F { toggle-window-floating; }

          Mod+Minus { set-column-width "-10%"; }
          Mod+Plus  { set-column-width "+10%"; }

          Mod+Escape allow-inhibiting=false { toggle-keyboard-shortcuts-inhibit; }

          Print { screenshot; }
          Ctrl+Print { screenshot-screen; }
          Alt+Print { screenshot-window; }

          Mod+1 { focus-workspace "1"; }
          Mod+2 { focus-workspace "2"; }
          Mod+3 { focus-workspace "3"; }
          Mod+4 { focus-workspace "4"; }
          Mod+5 { focus-workspace "5"; }
          Mod+Shift+1 { move-column-to-workspace "1"; }
          Mod+Shift+2 { move-column-to-workspace "2"; }
          Mod+Shift+3 { move-column-to-workspace "3"; }
          Mod+Shift+4 { move-column-to-workspace "4"; }
          Mod+Shift+5 { move-column-to-workspace "5"; }

          XF86AudioRaiseVolume { spawn "swayosd-client" "--output-volume=raise"; }
          XF86AudioLowerVolume { spawn "swayosd-client" "--output-volume=lower"; }
          XF86AudioMute { spawn "swayosd-client" "--output-volume=mute-toggle"; }
          XF86MonBrightnessUp { spawn "swayosd-client" "--brightness=raise"; }
          XF86MonBrightnessDown { spawn "swayosd-client" "--brightness=lower"; }
        }

        hotkey-overlay {
            skip-at-startup
        }

        include "user.kdl"
      '';
  };

  home.file.".config/niri/background.png" = {
    source = ./background.png;
  };
}

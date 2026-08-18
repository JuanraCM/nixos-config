{ config, ... }:

let
  colors = config.lib.stylix.colors;
in
{
  home.file.".config/niri/config.kdl" = {
    text =
      # kdl
      ''
        spawn-at-startup "noctalia"

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
          open-focused false
          default-floating-position x=10 y=10 relative-to="bottom-right"
        }

        window-rule {
          match app-id="dev.noctalia.Noctalia"
          open-floating true
          default-column-width { fixed 1080; }
          default-window-height { fixed 920; }
        }

        gestures {
          hot-corners {
            off
          }
        }

        debug {
          // Allows notification actions and window activation from Noctalia.
          honor-xdg-activation-with-invalid-serial
        }

        binds {
          Mod+Space { spawn-sh "noctalia msg panel-toggle launcher"; }
          Mod+S { spawn-sh "noctalia msg panel-toggle control-center"; }
          Mod+Comma { spawn-sh "noctalia msg settings-toggle"; }

          Mod+Return { spawn-sh "GTK_IM_MODULE=simple ghostty -e tmux"; }
          Mod+B { spawn "chromium"; }

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

          Mod+Period { spawn "makoctl" "dismiss"; }

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

          XF86AudioRaiseVolume { spawn-sh "noctalia msg volume-up"; }
          XF86AudioLowerVolume { spawn-sh "noctalia msg volume-down"; }
          XF86AudioMute { spawn-sh "noctalia msg volume-mute"; }
          XF86MonBrightnessUp { spawn-sh "noctalia msg brightness-up"; }
          XF86MonBrightnessDown { spawn-sh "noctalia msg brightness-down"; }
        }

        hotkey-overlay {
            skip-at-startup
        }

        include optional=true "user.kdl"
      '';
  };
}

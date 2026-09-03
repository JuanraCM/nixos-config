hl.config({
  dwindle = {
    preserve_split = true
  },
  scrolling = {
    fullscreen_on_one_column = true,
    column_width = 0.5,
    explicit_column_widths = "0.5, 1.0"
  }
})

hl.config({
  misc = {
    force_default_wallpaper = 0,
    disable_hyprland_logo   = true,
  },
  general = {
    gaps_in = 5,
    gaps_out = 10,
    allow_tearing = true,
    col = {
      active_border   = "rgba(33ccffee)",
      inactive_border = "rgba(595959aa)",
    },
  },
  decoration = {
    rounding = 10,
    rounding_power = 2,
    shadow = {
      enabled = false
    },
    blur = {
      enabled = false
    }
  },
  animations = {
    enabled = true
  }
})

hl.animation({ leaf = "global", enabled = true, speed = 1, bezier = "default" })

hl.window_rule({
  match = { class = "dev.noctalia.Noctalia" },
  float = true,
  size = { 1080, 920 }
})

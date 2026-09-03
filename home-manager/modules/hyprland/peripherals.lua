hl.config({
  input = {
    follow_mouse = 1,
    sensitivity  = -0.8,
    touchpad     = {
      natural_scroll = true,
    },
  },
})

-- Fallback monitor config
hl.monitor({
  output   = "",
  mode     = "preferred",
  position = "auto",
  scale    = "auto",
})

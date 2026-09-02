hl.on("hyprland.start", function()
  hl.exec_cmd("noctalia")
end)

hl.monitor({
  output   = "",
  mode     = "preferred",
  position = "auto",
  scale    = "auto",
})

hl.config({
  input = {
    follow_mouse = 1,
    sensitivity  = -0.8,
    touchpad     = {
      natural_scroll = true,
    },
  },
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

--- TODO: Implement remaining window rules
hl.window_rule({
  match = { class = "dev.noctalia.Noctalia" },
  float = true,
  size = { 1080, 920 }
})

local mainMod = "SUPER"
local ipc = "noctalia msg "

hl.bind(mainMod .. "+ Space", hl.dsp.exec_cmd(ipc .. "panel-toggle launcher"))
hl.bind(mainMod .. "+ S", hl.dsp.exec_cmd(ipc .. "panel-toggle control-center"))
hl.bind(mainMod .. "+ comma", hl.dsp.exec_cmd(ipc .. "settings-toggle"))

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc .. "volume-up"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc .. "volume-down"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(ipc .. "volume-mute"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(ipc .. "brightness-up"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. "brightness-down"))

hl.bind(mainMod .. "+ Return", hl.dsp.exec_cmd("GTK_IM_MODULE=simple ghostty -e tmux"))
hl.bind(mainMod .. "+ B", hl.dsp.exec_cmd("chromium"))

hl.bind(mainMod .. "+ W", hl.dsp.window.close())

hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

hl.bind(mainMod .. " + ALT + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ action = "toggle" }))

for i = 1, 10 do
  local key = i % 10 -- 10 maps to key 0
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

local ok, _ = pcall(require, "user")

if not ok then
  print("Specific machine config not found")
end

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

local mainMod = "SUPER"
local ipc = "noctalia msg "

local is_scrolling_layout = function()
  local workspace = hl.get_active_workspace()
  local layout = workspace and workspace.tiled_layout

  return layout == "scrolling"
end

hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(ipc .. "panel-toggle launcher"))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd(ipc .. "panel-toggle control-center"))
hl.bind(mainMod .. " + comma", hl.dsp.exec_cmd(ipc .. "settings-toggle"))

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc .. "volume-up"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc .. "volume-down"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(ipc .. "volume-mute"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(ipc .. "brightness-up"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. "brightness-down"))

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd("GTK_IM_MODULE=simple ghostty -e tmux"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("chromium"))

hl.bind(mainMod .. " + W", hl.dsp.window.close())

hl.bind(mainMod .. " + H", function()
  if is_scrolling_layout() then
    hl.dispatch(hl.dsp.layout("move -col"))
  else
    hl.dispatch(hl.dsp.focus({ direction = "left" }))
  end
end)
hl.bind(mainMod .. " + L", function()
  if is_scrolling_layout() then
    hl.dispatch(hl.dsp.layout("move +col"))
  else
    hl.dispatch(hl.dsp.focus({ direction = "right" }))
  end
end)
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))


hl.bind(mainMod .. " + SHIFT + H", function()
  if is_scrolling_layout() then
    hl.dispatch(hl.dsp.layout("swapcol l"))
  else
    hl.dispatch(hl.dsp.window.move({ direction = "left" }))
  end
end)
hl.bind(mainMod .. " + SHIFT + L", function()
  if is_scrolling_layout() then
    hl.dispatch(hl.dsp.layout("swapcol r"))
  else
    hl.dispatch(hl.dsp.window.move({ direction = "right" }))
  end
end)
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + ALT + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", function()
  return is_scrolling_layout() and hl.dispatch(hl.dsp.layout("colresize +conf"))
end)

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize({ keep_aspect_ratio = true }), { mouse = true })

for i = 1, 10 do
  local key = i % 10 -- 10 maps to key 0
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Cycles between dwindle and scrolling layouts
hl.bind(mainMod .. "+ tab", function()
  local workspace = hl.get_active_workspace()
  if not workspace then
    return
  end

  local target_layout = nil
  if workspace.tiled_layout == "dwindle" then
    target_layout = "scrolling"
  else
    target_layout = "dwindle"
  end

  hl.workspace_rule({ workspace = workspace.name, layout = target_layout })
end)

local ok, _ = pcall(require, "user")

if not ok then
  print("Specific machine config not found")
end

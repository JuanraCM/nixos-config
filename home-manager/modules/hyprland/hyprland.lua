require("autostart")
require("peripherals")
require("general")
require("keybindings")

local ok, _ = pcall(require, "user")
if not ok then
  hl.notification.create({ text = "Specific user config not found", timeout = 3000, icon = "warn" })
end

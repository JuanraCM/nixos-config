require("autostart")
require("peripherals")
require("general")
require("keybindings")

local ok, _ = pcall(require, "user")
if not ok then
  print("Specific machine config not found")
end

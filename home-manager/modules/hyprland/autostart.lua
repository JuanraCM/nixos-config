hl.on("hyprland.start", function()
  if os.getenv("SUNSHINE_HEADLESS") ~= "1" then
    hl.exec_cmd("noctalia")
  end
end)

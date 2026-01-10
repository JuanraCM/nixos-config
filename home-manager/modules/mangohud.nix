{
  home.file.".config/MangoHud/MangoHud.conf" = {
    text = ''
      fps_limit=0,60,75,120,165

      preset=1,2

      toggle_preset=Shift+F10
      toggle_fps_limit=Shift+F11
      toggle_hud=Shift+F12
    '';
  };

  home.file.".config/MangoHud/presets.conf" = {
    text = ''
      [preset 1]
      fps_only

      [preset 2]
      gpu_stats
      gpu_temp
      gpu_power
      cpu_stats
      cpu_temp
      cpu_power
      vram
      ram
      fps_metrics=avg,0.01
      show_fps_limit
    '';
  };
}

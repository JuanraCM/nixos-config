{
  programs.wezterm = {
    enable = true;
  };

  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [
        "com.mitchellh.ghostty.desktop"
        "-Alacritty.desktop"
        "-org.wezfurlong.wezterm.desktop"
      ];
    };
  };
}

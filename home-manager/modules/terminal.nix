{
  programs.wezterm = {
    enable = true;
  };

  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [
        "Alacritty.desktop"
        "-org.wezfurlong.wezterm.desktop"
      ];
    };
  };
}

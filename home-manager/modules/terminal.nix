{
  programs.ghostty = {
    enable = true;
  };

  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [
        "com.mitchellh.ghostty.desktop"
        "-Alacritty.desktop"
      ];
    };
  };
}

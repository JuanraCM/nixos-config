{ pkgs, inputs, ... }:

{
  imports = [ inputs.stylix.homeModules.stylix ];

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    font-awesome
  ];

  fonts.fontconfig.enable = true;

  stylix = {
    enable = true;

    targets = {
      neovim.enable = false;
      waybar.enable = false;
      wezterm.enable = false;
      wofi.colors.enable = false;
    };

    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";

    cursor = {
      name = "DMZ-Black";
      size = 24;
      package = pkgs.vanilla-dmz;
    };

    fonts = {
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };

      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };

      monospace = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans Mono";
      };

      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };

    iconTheme = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
      light = "Papirus-Light";
    };
  };
}

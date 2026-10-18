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
    # nixpkgs options are disabled with home-manager.useGlobalPkgs
    overlays.enable = false;

    targets = {
      neovim.enable = false;
      waybar.enable = false;
      ghostty.enable = false;
    };

    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";

    cursor = {
      name = "Bibata-Modern-Classic";
      size = 24;
      package = pkgs.bibata-cursors;
    };

    fonts = {
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };

      sansSerif = {
        package = pkgs.noto-fonts;
        name = "Noto Sans";
      };

      monospace = {
        package = pkgs.jetbrains-mono;
        name = "JetBrains Mono";
      };

      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };

    icons = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
      light = "Papirus-Light";
    };
  };
}

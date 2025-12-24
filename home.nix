{ config, pkgs, ... }:

{
  home = {
    username = "juanrita";
    homeDirectory = "/home/juanrita";
    stateVersion = "25.11";
  };

  programs.git = {
    enable = true;
    settings = {
      user.email = "juanracm.dev@gmail.com";
      user.name = "JuanraCM";
    };
  };

  programs.chromium = {
    enable = true;
  };

  programs.wezterm = {
    enable = true;
  };

  home.packages = with pkgs; [
    # Niri deps
    alacritty
    fuzzel
    gnome-keyring
    xdg-desktop-portal-gnome
    xdg-desktop-portal-gtk
    xwayland-satellite

    # Others
    gcc
    neovim
    stow
    fzf
    nil
  ];
}

{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Niri deps
    alacritty
    fuzzel
    gnome-keyring
    xdg-desktop-portal-gnome
    xdg-desktop-portal-gtk
    xwayland-satellite

    # Others
    fzf
    gcc
    neovim
    nil
    stow
  ];
}

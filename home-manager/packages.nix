{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Niri deps
    alacritty
    fuzzel
    gnome-keyring
    xdg-desktop-portal-gnome
    xdg-desktop-portal-gtk
    xwayland-satellite

    # LSPs
    lua-language-server
    nil

    # Others
    fzf
    gcc
    nautilus
    neovim
    nodejs
    pavucontrol
    ripgrep
    ruby
    spotify
    stow
    vesktop
    vlc
    zoxide
  ];
}

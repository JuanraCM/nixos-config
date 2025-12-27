{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Niri deps
    alacritty
    fuzzel
    gnome-keyring

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
    swaybg
  ];
}

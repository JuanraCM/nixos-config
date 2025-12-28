{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Niri deps
    alacritty
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
    opencode
    pavucontrol
    ripgrep
    ruby
    spotify
    stow
    swaybg
    vesktop
    vlc
    zoxide
  ];
}

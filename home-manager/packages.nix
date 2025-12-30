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
    bluetui
    btop
    fzf
    gcc
    impala
    nautilus
    neovim
    nodejs
    opencode
    pavucontrol
    r2modman
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

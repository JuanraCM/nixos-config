{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
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
    nautilus
    neovim
    nodejs
    obsidian
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

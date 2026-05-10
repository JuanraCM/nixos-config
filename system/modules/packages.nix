{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Niri deps
    alacritty
    gnome-keyring

    # LSPs
    lua-language-server
    nil

    # System tools
    alsa-utils
    bluetui
    btop
    fzf
    gcc
    ghostty
    lsof
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
    tmux
    tree-sitter
    unzip
    vesktop
    vlc
    zip
    zoxide
  ];
}

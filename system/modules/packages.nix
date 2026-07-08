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
    claude-code
    devenv
    fzf
    gcc
    ghostty
    libnotify
    lsof
    nautilus
    neovim
    nodejs
    obsidian
    opencode
    pavucontrol
    pi-coding-agent
    r2modman
    reco
    ripgrep
    rtk
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

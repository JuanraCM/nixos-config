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
    bitwarden-cli
    bluetui
    btop
    claude-code
    devenv
    fzf
    gcc
    herdr
    herdr-desktop
    jq
    libnotify
    lsof
    nautilus
    neovim
    nodejs
    obsidian
    pavucontrol
    pi-coding-agent
    playerctl
    python3
    r2modman
    ripgrep
    ruby
    spotify
    stow
    tmux
    tree-sitter
    unzip
    vesktop
    vlc
    worktrunk
    wt
    zip
    zoxide
  ];
}

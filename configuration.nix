# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Enable flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Use limine boot loader.
  boot.loader.limine.enable = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Set hostname.
  networking.hostName = "nixos";

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Atlantic/Canary";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Desktop environment
  programs.niri.enable = true;

  # User config
  services.getty.autologinUser = "juanrita";
  programs.zsh = {
    enable = true;
    shellInit = ''
      if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
        exec niri --session
      fi
    '';
  };

  users = {
    defaultUserShell = pkgs.zsh;
    users.juanrita = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };
  };

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    home-manager
  ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  system.stateVersion = "25.11";
}

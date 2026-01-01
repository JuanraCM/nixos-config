{ pkgs, stateVersion, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../system/modules
  ];

  # Wireless support
  networking = {
    wireless.iwd.enable = true;
    networkmanager.wifi.backend = "iwd";
  };

  environment.systemPackages = with pkgs; [
    # NOTE (hdajackretask): Pin 17 - Internal Speaker LFE
    alsa-tools
    impala
  ];

  system.stateVersion = stateVersion;
}

{ pkgs, stateVersion, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../system/modules
  ];

  networking = {
    wireless.iwd.enable = true;
    networkmanager.wifi.backend = "iwd";
  };
  environment.systemPackages = [ pkgs.impala ];

  system.stateVersion = stateVersion;
}

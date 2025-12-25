{ pkgs, stateVersion, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../system/modules
  ];

  environment.systemPackages = [ pkgs.home-manager ];

  system.stateVersion = stateVersion;
}

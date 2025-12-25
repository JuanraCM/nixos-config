{ pkgs, stateVersion, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules
  ];

  environment.systemPackages = [ pkgs.home-manager ];

  system.stateVersion = stateVersion;
}

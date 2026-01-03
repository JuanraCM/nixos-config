{ stateVersion, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../system/modules
    ./modules
  ];

  system.stateVersion = stateVersion;
}

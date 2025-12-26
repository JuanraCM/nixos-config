{ stateVersion, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../system/modules
  ];

  system.stateVersion = stateVersion;
}

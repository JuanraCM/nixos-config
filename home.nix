{ stateVersion, username, ... }:

{
  imports = [
    ./home-manager/modules
    ./home-manager/packages.nix
  ];

  home = {
    username = username;
    homeDirectory = "/home/${username}";
    stateVersion = stateVersion;
  };
}

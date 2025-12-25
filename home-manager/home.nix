{ stateVersion, username, ... }:

{
  imports = [
    ./modules
    ./packages.nix
  ];

  home = {
    username = username;
    homeDirectory = "/home/${username}";
    stateVersion = stateVersion;
  };
}

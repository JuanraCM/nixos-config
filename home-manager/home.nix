{ stateVersion, username, ... }:

{
  imports = [ ./modules ];

  home = {
    username = username;
    homeDirectory = "/home/${username}";
    stateVersion = stateVersion;
  };
}

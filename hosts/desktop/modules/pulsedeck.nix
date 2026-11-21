{ inputs, username, ... }:

{
  imports = [ inputs.pulsedeck.nixosModules.default ];

  services.pulsedeck = {
    enable = true;
    user = username;
    port = 9292;
    openFirewall = true;
  };
}

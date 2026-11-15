{ inputs, ... }:

{
  imports = [ inputs.pulsedeck.nixosModules.default ];

  services.pulsedeck = {
    enable = true;
    port = 9292;
    openFirewall = true;
  };
}

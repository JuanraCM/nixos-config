{ pkgs, username, ... }:

{
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
  };

  programs.gamescope = {
    enable = true;
    enableWsi = true;
  };

  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    heroic
    mangohud
    protonup-qt
  ];

  hardware.xpadneo.enable = true;

  users.users.${username}.extraGroups = [ "gamemode" ];
}

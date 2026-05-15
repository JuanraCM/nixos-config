{ pkgs, ... }:

{
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    heroic
    mangohud
    protonup-qt
  ];

  hardware.xpadneo.enable = true;
}

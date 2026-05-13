{ pkgs, ... }:

{
  programs.steam = {
    enable = true;
  };

  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    heroic
    mangohud
    protonup-qt
  ];

  hardware.xpadneo.enable = true;

  jovian = {
    steam.enable = true;
    hardware.has.amd.gpu = true;
  };
}

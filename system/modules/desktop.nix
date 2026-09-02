{ pkgs, ... }:

{
  services.displayManager.ly = {
    enable = true;
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
  };
  environment.systemPackages = [ pkgs.xwayland-satellite ];

  programs.niri.enable = true;

  programs.hyprland.enable = true;

  services.gvfs.enable = true;

  programs.kdeconnect = {
    enable = true;
  };
}

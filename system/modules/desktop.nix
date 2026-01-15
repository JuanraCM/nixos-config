{ pkgs, ... }:

{
  programs.niri.enable = true;
  services.displayManager.gdm.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
  };

  environment.systemPackages = [ pkgs.xwayland-satellite ];

  services.gvfs.enable = true;
}

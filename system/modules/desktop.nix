{ pkgs, ... }:

{
  services.displayManager.noctalia-greeter = {
    enable = true;
    settings = {
      cursor.size = 24;
      appearance = {
        hide_logo = true;
      };
    };
    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
    };
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

  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  services.gvfs.enable = true;

  programs.kdeconnect = {
    enable = true;
  };
}

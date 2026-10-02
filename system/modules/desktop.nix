{ pkgs, ... }:

{
  services.greetd = {
    enable = true;
    settings.default_session = {
      user = "greeter";
      command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --remember-session --asterisks";
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

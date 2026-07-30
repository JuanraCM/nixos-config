{ pkgs, ... }:

{
  services.displayManager.ly = {
    enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
  };
  environment.systemPackages = [ pkgs.xwayland-satellite ];

  programs.niri = {
    enable = true;
    package = pkgs.niri.override {
      libdisplay-info = pkgs.libdisplay-info.overrideAttrs (finalAttrs: {
        version = "0.3.0";
        src = pkgs.fetchFromGitLab {
          domain = "gitlab.freedesktop.org";
          owner = "emersion";
          repo = "libdisplay-info";
          rev = finalAttrs.version;
          sha256 = "sha256-nXf2KGovNKvcchlHlzKBkAOeySMJXgxMpbi5z9gLrdc=";
        };
      });
    };
  };

  services.gvfs.enable = true;

  # services.desktopManager.plasma6.enable = true;
  programs.kdeconnect = {
    enable = true;
  };
}

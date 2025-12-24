{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    shellInit = ''
      if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
        exec niri --session
      fi
    '';
  };

  users = {
    defaultUserShell = pkgs.zsh;
    users.juanrita = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };
  };

  services.getty.autologinUser = "juanrita";
}

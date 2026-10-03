{ pkgs, username, ... }:

let
  moonshineGamescope = pkgs.writeShellApplication {
    name = "moonshine-gamescope";
    text = ''
      if [ -n "''${MOONSHINE_CLIENT_WIDTH:-}" ]; then
        exec gamescope \
          -f \
          -W "$MOONSHINE_CLIENT_WIDTH" -H "$MOONSHINE_CLIENT_HEIGHT" \
          -w "$MOONSHINE_CLIENT_WIDTH" -h "$MOONSHINE_CLIENT_HEIGHT" \
          -r "$MOONSHINE_CLIENT_FRAMERATE" \
          -- "$@"
      else
        exec "$@"
      fi
    '';
  };
in
{
  services.moonshine = {
    enable = true;
    user = username;
    firewallInterfaces = [ "enp5s0" ];
    settings = {
      application = [
        {
          title = "Steam";
          command = [
            "/run/current-system/sw/bin/steam"
            "steam://open/bigpicture"
          ];
        }
      ];
      application_scanner = [
        {
          type = "steam";
          library = "$HOME/.local/share/Steam";
          command = [
            "/run/current-system/sw/bin/steam"
            "-bigpicture"
            "steam://rungameid/{game_id}"
          ];
        }
      ];
    };
  };

  environment.systemPackages = [ moonshineGamescope ];

  networking = {
    interfaces = {
      enp5s0 = {
        wakeOnLan.enable = true;
      };
    };
    firewall.allowedUDPPorts = [ 9 ];
  };
}

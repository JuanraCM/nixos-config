{ username, ... }:
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

  networking = {
    interfaces = {
      enp5s0 = {
        wakeOnLan.enable = true;
      };
    };
    firewall.allowedUDPPorts = [ 9 ];
  };
}

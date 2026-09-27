{ pkgs, username, ... }:

let
  sunshineSession = pkgs.writeShellApplication {
    name = "sunshine-greetd-session";
    text = ''
      if grep -qx connected /sys/class/drm/card*-{DP,HDMI-A,Virtual}-*/status; then
        exit 0
      fi

      exec ${pkgs.uwsm}/bin/uwsm start hyprland.desktop
    '';
  };
  sunshinePrepCmd = pkgs.writeShellApplication {
    name = "sunshine-hyprland-prep-cmd";
    text = ''
      client_mode="''${SUNSHINE_CLIENT_WIDTH}x''${SUNSHINE_CLIENT_HEIGHT}@''${SUNSHINE_CLIENT_FPS}"

      hyprctl output create headless SUNSHINE
      hyprctl eval "hl.monitor({ output = \"SUNSHINE\", mode = \"''${client_mode}\" })"
    '';
  };
  steamAppCmd = pkgs.writeShellApplication {
    name = "steam-app-cmd";
    text = ''
      gamescope --steam -f -W "''${SUNSHINE_CLIENT_WIDTH}" -H "''${SUNSHINE_CLIENT_HEIGHT}" -- steam
    '';
  };
in
{
  services.sunshine = {
    enable = true;
    capSysAdmin = true;
    openFirewall = true;
    settings = {
      global_prep_cmd = builtins.toJSON [
        {
          do = "${sunshinePrepCmd}/bin/sunshine-hyprland-prep-cmd";
          undo = "hyprctl output remove SUNSHINE";
        }
      ];
      output_name = "SUNSHINE";
    };
    applications = {
      apps = [
        {
          name = "Desktop";
          image-path = "desktop.png";
        }
        {
          name = "Steam Big Picture";
          cmd = "${steamAppCmd}/bin/steam-app-cmd";
          image-path = "steam.png";
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

  services.greetd = {
    settings.initial_session = {
      command = "${sunshineSession}/bin/sunshine-greetd-session";
      user = username;
    };
  };

  # Ensure DRM devices are populated as early as possible
  hardware.amdgpu.initrd.enable = true;
}

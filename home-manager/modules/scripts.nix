{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (writeShellApplication {
      name = "power-menu";
      text = ''
        options=(
          "  Shutdown"
          "  Reboot"
          "  Suspend"
        )
        chosen=$(printf '%s\n' "''${options[@]}" | wofi --dmenu --prompt "Power Menu")
        case $chosen in
          "  Shutdown") systemctl poweroff ;;
          "  Reboot") systemctl reboot ;;
          "  Suspend") systemctl suspend ;;
        esac
      '';
    })
  ];
}

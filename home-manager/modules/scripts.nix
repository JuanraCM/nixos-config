{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (writeShellScriptBin "power-menu" ''
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
    '')
  ];
}

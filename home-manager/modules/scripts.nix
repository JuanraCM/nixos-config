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
    (writeShellApplication {
      name = "ns";
      runtimeInputs = with pkgs; [ nix-search-tv ];
      excludeShellChecks = [ "SC2016" ];
      text = builtins.readFile "${pkgs.nix-search-tv.src}/nixpkgs.sh";
    })
  ];
}

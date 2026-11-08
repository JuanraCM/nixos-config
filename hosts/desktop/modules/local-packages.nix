{ pkgs, ... }:

let
  # Steam launch option: run-game [--lsfg-profile NAME] -- %command%
  # Inside a Sunshine session (streaming) only gamemoderun is applied.
  runGame = pkgs.writeShellApplication {
    name = "run-game";
    text = ''
      lsfg_profile=""

      while [ $# -gt 0 ]; do
        case "$1" in
          --lsfg-profile)
            lsfg_profile="''${2:?--lsfg-profile requires a value}"
            shift 2
            ;;
          --)
            shift
            break
            ;;
          *)
            echo "run-game: unknown option '$1'" >&2
            exit 2
            ;;
        esac
      done

      if [ $# -eq 0 ]; then
        echo "usage: run-game [--lsfg-profile NAME] -- COMMAND..." >&2
        exit 2
      fi

      if [ -z "''${SUNSHINE_CLIENT_WIDTH:-}" ] && [ -n "$lsfg_profile" ]; then
        export LSFGVK_PROFILE="$lsfg_profile"
      fi

      exec mangohud gamemoderun "$@"
    '';
  };
in
{
  environment.systemPackages = with pkgs; [
    lsfg-vk
    lsfg-vk-ui
    prismlauncher
    runGame
  ];
}

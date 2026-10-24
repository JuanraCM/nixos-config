{ pkgs, ... }:

let
  dmemcg-booster = pkgs.rustPlatform.buildRustPackage rec {
    pname = "dmemcg-booster";
    version = "0.1.3";
    src = pkgs.fetchFromGitLab {
      domain = "gitlab.steamos.cloud";
      owner = "holo";
      repo = "dmemcg-booster";
      rev = version;
      hash = "sha256-JDT+JKxgaETinIHiP0Pqb7fPNrvcI6AQu90nmoA/YuI=";
    };
    cargoHash = "sha256-NHK4734Jvi4RJieGn0RjYU0PzQFqaE4exHG77dmukig=";
    nativeBuildInputs = [ pkgs.pkg-config ];
    buildInputs = [ pkgs.dbus ];
  };

  hyprland-focused-booster = pkgs.rustPlatform.buildRustPackage rec {
    pname = "hyprland-focused-booster";
    version = "0.1.6";
    src = pkgs.fetchFromGitHub {
      owner = "tumrin";
      repo = "hyprland-focused-booster";
      rev = version;
      hash = "sha256-CrGSE3R9d4MQ6INWC33NT496WGzaByf7oZmdIQSHFSo=";
    };
    cargoHash = "sha256-aFV9uzcp9XCLD5zzfLBt5ypJ9LsvqcuIDuuMr2c38Vc=";
    nativeBuildInputs = [ pkgs.pkg-config ];
    buildInputs = [ pkgs.systemd ];
  };
in
{
  systemd.services.dmemcg-booster = {
    description = "dmem cgroup limits for boosting foreground apps (system)";
    wantedBy = [ "multi-user.target" ];
    serviceConfig.ExecStart = "${dmemcg-booster}/bin/dmemcg-booster --use-system-bus";
  };

  systemd.user.services.dmemcg-booster = {
    description = "dmem cgroup limits for boosting foreground apps (user)";
    wantedBy = [ "graphical-session-pre.target" ];
    serviceConfig.ExecStart = "${dmemcg-booster}/bin/dmemcg-booster";
  };

  systemd.user.services.hyprland-focused-booster = {
    description = "Prioritize VRAM for the focused Hyprland window";
    wantedBy = [ "graphical-session.target" ];
    after = [
      "dmemcg-booster.service"
      "graphical-session.target"
    ];
    # niri is also installed; only run inside Hyprland sessions
    unitConfig.ConditionEnvironment = "HYPRLAND_INSTANCE_SIGNATURE";
    serviceConfig.ExecStart = "${hyprland-focused-booster}/bin/hyprland-focused-booster";
  };
}

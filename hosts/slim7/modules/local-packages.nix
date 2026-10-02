{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    alsa-tools
    impala
    moonlight-qt
  ];
}

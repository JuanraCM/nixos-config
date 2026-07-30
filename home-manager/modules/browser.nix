{ pkgs, ... }:

{
  programs.chromium = {
    enable = true;
    package = pkgs.chromium.override { enableWideVine = true; };
    extensions = [
      # Bitwarden
      { id = "nngceckbapebfimnlniiiahkandclblb"; }
      # YouTube Adblock
      { id = "cmedhionkhpnakcndndgjdbohmhepckk"; }
      # Lighthouse
      { id = "blipmdconlkpinefehnmjammfjpmpbjk"; }
      # Core Web Vitals
      { id = "aaldphpndekiaclbcmfgbghngcmeeeaf"; }
    ];
  };
}

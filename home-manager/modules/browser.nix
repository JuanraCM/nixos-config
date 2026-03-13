{ pkgs, ... }:

{
  programs.chromium = {
    enable = true;
    package = pkgs.chromium.override { enableWideVine = true; };
    extensions = [
      # LastPass
      { id = "hdokiejnpimakedhajhdlcegeplioahd"; }
      # YouTube Adblock
      { id = "cmedhionkhpnakcndndgjdbohmhepckk"; }
      # Lighthouse
      { id = "blipmdconlkpinefehnmjammfjpmpbjk"; }
      # Core Web Vitals
      { id = "aaldphpndekiaclbcmfgbghngcmeeeaf"; }
    ];
  };
}

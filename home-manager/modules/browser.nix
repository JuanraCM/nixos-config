{ pkgs, ... }:

{
  programs.chromium = {
    enable = true;
    package = pkgs.chromium.override { enableWideVine = true; };
    extensions = [
      # LastPass
      { id = "hdokiejnpimakedhajhdlcegeplioahd"; }
      # Adblock Plus
      { id = "cfhdojbkjhnklbpkdaibdccddilifddb"; }
    ];
  };
}

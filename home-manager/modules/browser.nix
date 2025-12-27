{
  programs.chromium = {
    enable = true;
    extensions = [
      # LastPass
      { id = "hdokiejnpimakedhajhdlcegeplioahd"; }
      # Adblock Plus
      { id = "cfhdojbkjhnklbpkdaibdccddilifddb"; }
    ];
  };
}

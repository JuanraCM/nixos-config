{ ... }:

{
  boot.extraModprobeConfig = ''
    options mt7925e disable_aspm=1
  '';
}

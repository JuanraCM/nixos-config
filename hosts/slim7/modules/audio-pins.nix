{ pkgs, ... }:

{
  hardware.firmware = [
    (pkgs.writeTextDir "/lib/firmware/hda-jack-retask.fw" ''
      [codec]
      0x10ec0287 0x17aa391a 0

      [pincfg]
      0x12 0x40000000
      0x13 0x411111f0
      0x14 0x90170110
      0x17 0x90170151
      0x18 0x411111f0
      0x19 0x03a11030
      0x1a 0x411111f0
      0x1b 0x411111f0
      0x1d 0x40471a6d
      0x1e 0x411111f0
      0x21 0x03211020
    '')
  ];

  boot.extraModprobeConfig = ''
    options snd-hda-intel patch=hda-jack-retask.fw
  '';
}

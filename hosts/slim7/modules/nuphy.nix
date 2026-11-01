{ pkgs, ... }:

{
  # Let browser (WebHID) access NuPhy hidraw nodes for web configurator.
  # Must sort before 73-seat-late.rules, so not services.udev.extraRules (99-local).
  services.udev.packages = [
    (pkgs.writeTextDir "lib/udev/rules.d/70-nuphy.rules" ''
      KERNEL=="hidraw*", ATTRS{idVendor}=="19f5", TAG+="uaccess"
    '')
  ];
}

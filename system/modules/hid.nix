{ pkgs, ... }:

{
  # Let browser (WebHID) access keyboard hidraw nodes for their web configurators.
  # Must sort before 73-seat-late.rules, so not services.udev.extraRules (99-local).
  services.udev.packages = [
    (pkgs.writeTextDir "lib/udev/rules.d/70-hidraw.rules" ''
      # NuPhy
      KERNEL=="hidraw*", ATTRS{idVendor}=="19f5", TAG+="uaccess"
      # M1 V5 VIA
      KERNEL=="hidraw*", ATTRS{idVendor}=="342d", TAG+="uaccess"
    '')
  ];
}

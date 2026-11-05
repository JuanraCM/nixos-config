{ pkgs, ... }:

{
  # Let the logged-in seat user (browser WebHID) access any hidraw node, e.g. for
  # VIA/NuPhy web configurators. Must sort before 73-seat-late.rules, so not
  # services.udev.extraRules (99-local).
  services.udev.packages = [
    (pkgs.writeTextDir "lib/udev/rules.d/70-hidraw.rules" ''
      KERNEL=="hidraw*", TAG+="uaccess"
    '')
  ];
}

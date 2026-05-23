{ pkgs, ... }:

{
  # boot.kernelPackages = pkgs.linuxPackages_latest;

  # TEMP: Pin to 7.0.6 until newer version fixes BT issue
  boot.kernelPackages = pkgs.linuxPackagesFor (
    pkgs.linux_7_0.override {
      argsOverride = rec {
        src = pkgs.fetchurl {
          url = "mirror://kernel/linux/kernel/v7.x/linux-${version}.tar.xz";
          sha256 = "sha256-y6REQKpXr/18ISQdxbwjSw31PEmfj/w+vCkN0zkKdSM=";
        };
        version = "7.0.6";
        modDirVersion = "7.0.6";
      };
    }
  );
}

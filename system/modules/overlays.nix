{
  nixpkgs.overlays = [
    # TEMPORARY WORKAROUND — remove once nixos-unstable includes nixpkgs commit 1e544d5f3944 ("python3Packages.nanoemoji: fix hash", 2026-08-13).
    (final: prev: {
      pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [
        (pyfinal: pyprev: {
          nanoemoji = pyprev.nanoemoji.overrideAttrs (old: {
            src = old.src.overrideAttrs (_: {
              outputHash = "sha256-FysyKC01XBnRiur5RR9fcsTxQqE8x0JJHSoe3q6JtKc=";
            });
          });
        })
      ];
    })
  ];
}

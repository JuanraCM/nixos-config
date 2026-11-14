{ ... }:

{
  nixpkgs.overlays = [
    # TODO: drop once nixpkgs' localsend includes zlib in its RUNPATH
    # (1.18.0 fails with "libz.so.1: cannot open shared object file").
    (final: prev: {
      localsend = prev.localsend.overrideAttrs (old: {
        nativeBuildInputs = (old.nativeBuildInputs or [ ]) ++ [ final.patchelf ];
        postFixup = (old.postFixup or "") + ''
          patchelf --add-rpath ${final.zlib}/lib $out/app/localsend/localsend_app
        '';
      });
    })
  ];
}

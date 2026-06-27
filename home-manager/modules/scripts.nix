{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (writeShellApplication {
      name = "ns";
      runtimeInputs = with pkgs; [ nix-search-tv ];
      excludeShellChecks = [ "SC2016" ];
      text = builtins.readFile "${pkgs.nix-search-tv.src}/nixpkgs.sh";
    })
  ];
}

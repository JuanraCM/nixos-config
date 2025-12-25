{
  description = "My system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      stateVersion = "25.11";
      username = "juanrita";
    in
    {
      nixosConfigurations.slim7 = nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit stateVersion;
          hostname = "slim7";
        };

        modules = [ ./hosts/slim7/configuration.nix ];
      };

      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = {
          inherit stateVersion username;
        };

        modules = [ ./home-manager/home.nix ];
      };
    };
}

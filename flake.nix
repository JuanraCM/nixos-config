{
  description = "My system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    jovian-nixos = {
      url = "github:Jovian-Experiments/Jovian-NixOS";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nix-index-database,
      jovian-nixos,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      stateVersion = "26.05";
      username = "juanrita";

      hostnames = [
        "desktop"
        "slim7"
      ];

      makeSystem =
        hostname:
        nixpkgs.lib.nixosSystem {
          inherit system;

          specialArgs = {
            inherit
              inputs
              stateVersion
              hostname
              username
              ;
          };

          modules = [
            ./hosts/${hostname}/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${username} = ./home-manager/home.nix;
              home-manager.backupFileExtension = "backup";
              home-manager.extraSpecialArgs = {
                inherit inputs stateVersion username;
              };
            }
            nix-index-database.nixosModules.default
            jovian-nixos.nixosModules.default
          ];
        };
    in
    {
      nixosConfigurations = nixpkgs.lib.genAttrs hostnames makeSystem;
    };
}

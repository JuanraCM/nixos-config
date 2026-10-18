{
  description = "My system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-26.05";

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

    noctalia = {
      url = "github:noctalia-dev/noctalia/cachix";
    };

    nix-amd-ai.url = "github:noamsto/nix-amd-ai";
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-stable,
      home-manager,
      nix-index-database,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      stateVersion = "26.11";
      username = "juanrita";

      pkgsStable = import nixpkgs-stable {
        inherit system;
        config.allowUnfree = true;
      };

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
              pkgsStable
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
                inherit
                  inputs
                  stateVersion
                  username
                  pkgsStable
                  ;
              };
            }
            nix-index-database.nixosModules.default
          ];
        };
    in
    {
      nixosConfigurations = nixpkgs.lib.genAttrs hostnames makeSystem;
    };
}

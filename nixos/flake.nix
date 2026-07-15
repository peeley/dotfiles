{
  description = "the dawn of a new day";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    darwin.url = "github:lnl7/nix-darwin/nix-darwin-25.11";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    agenix.url = "github:ryantm/agenix";

    nixos-hardware.url = "github:nixos/nixos-hardware";

    disko.url = "github:nix-community/disko";
  };

  outputs = { self, home-manager, darwin, nixpkgs, nixos-hardware, agenix, disko, ... }@inputs:
    let
      nixosHosts = [
        {
          name = "mammon";
          system = "x86_64-linux";
          user = "bodo";
        }
        {
          name = "lepidoptera";
          system = "x86_64-linux";
          user = "bodo";
          extraModules = [ nixos-hardware.nixosModules.lenovo-thinkpad-x230 ];
        }
        {
          name = "heracles";
          system = "aarch64-linux";
          user = "admin";
        }
        {
          name = "ixion";
          system = "aarch64-linux";
          user = "admin";
        }
        {
          name = "athena";
          system = "aarch64-linux";
          user = "admin";
        }
        {
          name = "thoth";
          system = "x86_64-linux";
          user = "admin";
        }
        {
          name = "anubis";
          system = "x86_64-linux";
          user = "admin";
        }
        {
          name = "osiris";
          system = "x86_64-linux";
          user = "admin";
        }
        {
          name = "seth";
          system = "x86_64-linux";
          user = "admin";
          extraModules = [ disko.nixosModules.disko ];
        }
      ];

      mkNixosHost = { name, system, user, extraModules ? [] }: {
        inherit name;
        value = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            (./. + "/hosts/${name}/configuration.nix")
            home-manager.nixosModules.home-manager
            agenix.nixosModules.default
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${user} = import (./. + "/hosts/${name}/home.nix");
            }
          ] ++ extraModules;
        };
      };
    in
    rec {
      darwinConfigurations."fission" = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        inputs = { inherit darwin nixpkgs; };
        modules = [
          ./hosts/fission/darwin-configuration.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.bodo = import ./hosts/fission/home.nix;
          }
        ];
      };

      nixosConfigurations = builtins.listToAttrs (map mkNixosHost nixosHosts);
    };
}

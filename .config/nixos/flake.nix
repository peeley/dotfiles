{
  description = "the dawn of a new day";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    agenix.url = "github:ryantm/agenix";

    nixos-hardware.url = "github:nixos/nixos-hardware";
  };

  outputs = { self, home-manager, darwin, nixpkgs, nixos-hardware, agenix, ... }@inputs: rec {
    darwinConfigurations."fission" = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      inputs = { inherit darwin nixpkgs; };
      modules = [
        ./hosts/fission/darwin-configuration.nix
        home-manager.darwinModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.bodo = import ./hosts/fission/home.nix;
        }
      ];
    };

    nixosConfigurations."mammon" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/mammon/configuration.nix
        # should probably make this more DRY
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.bodo = import ./hosts/mammon/home.nix;
        }

        agenix.nixosModules.default
      ];
    };

    nixosConfigurations."lepidoptera" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/lepidoptera/configuration.nix

        nixos-hardware.nixosModules.lenovo-thinkpad-x230
        # should probably make this more DRY
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.bodo = import ./hosts/lepidoptera/home.nix;
        }
      ];
    };

    nixosConfigurations."heracles" = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      modules = [
        ./hosts/heracles/configuration.nix

        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.admin = import ./hosts/heracles/home.nix;
        }

        agenix.nixosModules.default
      ];
    };

    nixosConfigurations."ixion" = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      modules = [
        ./hosts/ixion/configuration.nix

        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.admin = import ./hosts/ixion/home.nix;
        }

        agenix.nixosModules.default
      ];
    };

    nixosConfigurations."athena" = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      modules = [
        ./hosts/athena/configuration.nix

        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.admin = import ./hosts/athena/home.nix;
        }

        agenix.nixosModules.default
      ];
    };
  };
}

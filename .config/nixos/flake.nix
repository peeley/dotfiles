{
  description = "the dawn of a new day";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixos-hardware.url = "github:nixos/nixos-hardware";
  };

  outputs = { self, home-manager, darwin, nixpkgs, nixos-hardware, ... }@inputs: rec {
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

        nixos-hardware.nixosModules.raspberry-pi-4
        # home-manager.nixosModules.home-manager {
        #   home-manager.useGlobalPkgs = true;
        #   home-manager.useUserPackages = true;
        #   home-manager.users.bodo = import ./hosts/heracles/home.nix;
        # }
      ];
    };

    nixosConfigurations."ixion" = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      modules = [
        ./hosts/heracles/configuration.nix

        nixos-hardware.nixosModules.raspberry-pi-4
        # home-manager.nixosModules.home-manager {
        #   home-manager.useGlobalPkgs = true;
        #   home-manager.useUserPackages = true;
        #   home-manager.users.bodo = import ./hosts/heracles/home.nix;
        # }
      ];
    };
  };
}

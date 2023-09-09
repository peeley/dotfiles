{
  description = "the dawn of a new day";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/22.11";

    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/release-22.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, home-manager, darwin, nixpkgs, ... }@inputs: {
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
  };
}

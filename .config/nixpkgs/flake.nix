{
  description = "the dawn of a new day";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-21.11-darwin";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";
  };

  outputs = { self, home-manager, darwin, nixpkgs, nixpkgs-unstable, ... }@inputs: {
    darwinConfigurations."fission" = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      inputs = { inherit darwin nixpkgs nixpkgs-unstable; };
      modules = [
        ./hosts/fission/darwin-configuration.nix
        home-manager.darwinModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.bodo = import ./hosts/fission/home.nix;
        }
      ];
    };
  };
}

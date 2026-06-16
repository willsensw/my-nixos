{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hermes-agent = {
	  url = "github:NousResearch/hermes-agent";
	};
  };

  outputs = { self, nixpkgs, hermes-agent, lanzaboote, home-manager, ... }@inputs: {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      
      # Pass inputs to your configuration.nix
      specialArgs = { inherit inputs; };

      modules = [
        lanzaboote.nixosModules.lanzaboote
		hermes-agent.nixosModules.default
        ./configuration.nix

	      home-manager.nixosModules.home-manager
	      {
	        home-manager = {
	        useGlobalPkgs = true;
	        useUserPackages = true;
	        users.beimao = import ./home.nix;
	        backupFileExtension = "backup";
	        };
	      }
      ];
    };
  };
}

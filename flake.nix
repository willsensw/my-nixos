{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    noctalia = {
      url = "github:noctalia-dev/noctalia/cachix";
    };

    qylock = {
      url = "github:Darkkal44/qylock";
    };

	  mikuPlymouth = {
      url = "github:Thang1191/MikuPlymouth";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, lanzaboote, home-manager, mikuPlymouth, noctalia, qylock, ... }@inputs: {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      
      # Pass inputs to your configuration.nix
      specialArgs = { inherit inputs; };

      modules = [
        lanzaboote.nixosModules.lanzaboote
        mikuPlymouth.nixosModules.default
		    qylock.nixosModules.default
        ./configuration.nix

	      home-manager.nixosModules.home-manager
	      {
	        home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.beimao = {
              imports = [ 
                ./home.nix
                inputs.noctalia.homeModules.default 
              ];
            };
            backupFileExtension = "backup";
	        };
	      }
      ];
    };
  };
}

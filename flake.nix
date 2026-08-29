{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      
      # Pass inputs to your configuration.nix
      specialArgs = { inherit inputs; };

      modules = [
        ./configuration.nix

	      home-manager.nixosModules.home-manager
	      {
	        home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.beimao = {
              imports = [ 
                ./home.nix
              ];
            };
            backupFileExtension = "backup";
	      };
	    }
      ];
    };
  };
}

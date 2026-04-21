{ config, lib, pkgs, ... }:

{
  	imports =
    	[
      		./hardware-configuration.nix
		      ./xdgportal.nix
		      ./services.nix
		      ./flatpak.nix
      		./package.nix
      		./printer.nix
      		./blender.nix
      		./nvidia.nix
      		./ollama.nix
      		./python.nix
		      ./thunar.nix
      		./stm32.nix
          ./game.nix
		      ./boot.nix
      		./sddm.nix
      		./nvim.nix
		      ./niri.nix
      		./font.nix
      		./user.nix
		      ./zsh.nix
		      ./zen.nix
    	];

  boot = {
    loader = {
      systemd-boot.enable = lib.mkForce false;
      efi.canTouchEfiVariables = true;
    };
    lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
    };
  };

  networking = {
		networkmanager.enable = true;
		hostName = "willsw";
	};

	#services.getty.autologinUser = "beimao";

  	time.timeZone = "Asia/Pontianak";

  	i18n.defaultLocale = "en_US.UTF-8";
  
	security.rtkit.enable = true;
  	
	hardware.bluetooth.enable = true;

	nixpkgs.config.allowUnfree = true;

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

  	system.stateVersion = "25.11";
}


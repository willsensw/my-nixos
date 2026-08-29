{ config, lib, pkgs, ... }:

{
  imports =
    [
      # Core Files
      ./hardware-configuration.nix
      ./user.nix
      ./vm.nix

      # Desktop
      ./modules/desktop/xfce.nix
      ./modules/desktop/zsh.nix

      # Hardware
      ./modules/hardware/nvidia.nix
      ./modules/hardware/printer.nix

      # Software
      ./modules/software/blender.nix
	  ./modules/software/obs.nix
	  ./modules/software/game.nix
      ./modules/software/nvim.nix
      ./modules/software/package.nix
      ./modules/software/kicad.nix
      ./modules/software/scrcpy.nix

      # Others
      ./modules/others/flatpak.nix
      ./modules/others/font.nix
      ./modules/others/services.nix
    ];

  boot.loader = {
    systemd-boot = {
	  enable = false;
    };
	limine = {
	  enable = true;
      secureBoot.enable = true;
	  enrollConfig = true;
	  panicOnChecksumMismatch = true;
	  maxGenerations = 3;
	  extraEntries = ''
    	/Windows 11
          protocol: efi
          path: boot():/EFI/Microsoft/Boot/bootmgfw.efi
  	  '';
    };
	efi.canTouchEfiVariables = true;
  };

  fileSystems = {
    "/".options = [ "compress=zstd" ];
    "/home".options = [ "compress=zstd" ];
    "/nix".options = [ "compress=zstd" "noatime" ];
  };

  services.btrfs.autoScrub = {
    enable = true;
    interval = "monthly";
    fileSystems = [ "/" ]; 
  };

  zramSwap.enable = true;

  networking = {
		networkmanager.enable = true;
		hostName = "nixos";
	};
  
  nix.settings.trusted-users = [
    "root"
    "beimao"
  ];

  time.timeZone = "Asia/Pontianak";

  i18n.defaultLocale = "en_US.UTF-8";

  security.rtkit.enable = true;

  hardware.bluetooth.enable = true;

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "26.05";
}


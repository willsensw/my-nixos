{ config, lib, pkgs, ... }:

{
  imports =
    [
      # Core Files
      ./hardware-configuration.nix
      ./user.nix
	    ./vm.nix

      # Desktop
      ./modules/desktop/boot.nix
      ./modules/desktop/sddm.nix
      ./modules/desktop/zsh.nix
      ./modules/desktop/noctalia.nix
      ./modules/desktop/niri.nix

      # Hardware
      ./modules/hardware/nvidia.nix
      ./modules/hardware/printer.nix

      # Software
      ./modules/software/blender.nix
      ./modules/software/game.nix
      ./modules/software/nvim.nix
      ./modules/software/ollama.nix
      ./modules/software/package.nix
      ./modules/software/zen.nix
      ./modules/software/kicad.nix
      ./modules/software/thunar.nix

      # Others
      ./modules/others/flatpak.nix
      ./modules/others/font.nix
      ./modules/others/python.nix
      ./modules/others/services.nix
      ./modules/others/stm32.nix
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
		hostName = "nixos";
	};
  
  nix.settings.trusted-users = [
    "root"
    "beimao"
  ];

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      # Optional: Niri's specific portal for screen sharing/casting
      xdg-desktop-portal-gnome 
    ];
  };

  time.timeZone = "Asia/Pontianak";

  i18n.defaultLocale = "en_US.UTF-8";

  security.rtkit.enable = true;

  hardware.bluetooth.enable = true;

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.11";
}


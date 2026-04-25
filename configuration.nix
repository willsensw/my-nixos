{ config, lib, pkgs, ... }:

{
  imports =
    [
      # Core Files
      ./hardware-configuration.nix
      ./user.nix

      # Desktop
      ./modules/desktop/boot.nix
      ./modules/desktop/lightdm.nix
      ./modules/desktop/thunar.nix
      ./modules/desktop/xfce.nix
      ./modules/desktop/zsh.nix

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

  time.timeZone = "Asia/Pontianak";

  i18n.defaultLocale = "en_US.UTF-8";

	security.rtkit.enable = true;

	hardware.bluetooth.enable = true;

	nixpkgs.config.allowUnfree = true;

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.11";
}


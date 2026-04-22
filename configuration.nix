{ config, lib, pkgs, ... }:

{
  imports =
  [
    ./hardware-configuration.nix
		./services.nix
		./flatpak.nix
    ./package.nix
    ./printer.nix
    ./blender.nix
    ./lightdm.nix
    ./nvidia.nix
    ./ollama.nix
    ./python.nix
		./thunar.nix
    ./stm32.nix
    ./xfce.nix
    ./game.nix
		./boot.nix
    ./nvim.nix
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

  time.timeZone = "Asia/Pontianak";

  i18n.defaultLocale = "en_US.UTF-8";

	security.rtkit.enable = true;

	hardware.bluetooth.enable = true;

	nixpkgs.config.allowUnfree = true;

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.11";
}


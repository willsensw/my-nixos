{ config, lib, pkgs, inputs, ... }:

{
	# https://search.nixos.org/
	environment.systemPackages = let
		kde = pkgs.kdePackages;
	in
	with pkgs; [
		#Mix
		vim
		neovim
		git
		btop
    	exfatprogs
    	sbctl
    	lon
    	# openboard
		zoom-us

		#BROWSER
		inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
	
		#TERMINAL SHOWCASE
		kitty
		fastfetch
		cmatrix

		#ARCHIVER
		unzip
		unrar
		xarchiver

		#PARTITIONING
		gparted

		#Electronics
		thonny
		arduino-ide
    	fritzing

		#3D Slicer
		cura-appimage
		orca-slicer

		#Design
		blender
		freecad

		#Office
		libreoffice-fresh

		#Communication
		vesktop
		telegram-desktop

		#Media
		vlc
		obs-studio

		#KDE-Apps
		kde.kdenlive

		#C Compiler
		gcc
		clang
	];
}

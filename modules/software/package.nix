{ config, lib, pkgs, ... }:

{
	# https://search.nixos.org/
	environment.systemPackages = let
		kde = pkgs.kdePackages;
		py = pkgs.python313;
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
    	openboard
	
		#TERMINAL SHOWCASE
    	alacritty
		fastfetch
		cmatrix
		cava
		sl

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

		#KICAD
		kicad

		#Design
		gimp3
		blender

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

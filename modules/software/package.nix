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
		brightnessctl
		orca
    	lon
    	# openboard
		zoom-us
	
		#TERMINAL SHOWCASE
    	alacritty
		fastfetch
		cmatrix
		ranger
		chafa

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
		cura-appiamge
		orca-slicer

		#Design
		gimp3
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

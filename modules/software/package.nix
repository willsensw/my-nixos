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
		htop
		btop
    	exfatprogs
    	sbctl
    	lon
		zoom-us

		#TERMINAL SHOWCASE
		kitty
		fastfetch
		cmatrix

		#ARCHIVER
		zip
		gzip
		xz
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
		inkscape
		blender
		freecad

		#Office
		libreoffice

		#Communication
		vesktop
		telegram-desktop

		#Media
		vlc

		#C Compiler
		gcc
		clang

		#MUSIC
		folia-major

		#YT
		ytdownloader
	];
}

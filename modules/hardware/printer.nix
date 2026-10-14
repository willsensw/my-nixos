
{ config, pkgs, ... }:

{
	services.printing = {
		enable = true;
		drivers = with pkgs; [
			epson_201207w
			hplipWithPlugin
		];
	};

	environment.systemPackages = with pkgs; [
		hplip
		cups-pdf-to-pdf
	];

	hardware.sane.enable = true;
}


{ config, pkgs, ... }:

{
	services.printing = {
		enable = true;
		drivers = with pkgs; [
			cups-filters
    		cups-browsed
			epson-escpr
			epson_201207w
			hplipWithPlugin
		];
	};

	environment.systemPackages = with pkgs; [
		hplip
		epson-escpr
		epson_201207w
		cups-pdf-to-pdf
	];

	hardware.sane.enable = true;
}

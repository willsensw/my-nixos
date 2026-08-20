{ pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
  		gcc-arm-embedded  # The compiler for STM32
  		stlink            # For flashing via ST-Link
		gnumake
  		openocd           # The "Universal" debugger/flasher
	];

	services.udev.packages = with pkgs; [ 
		stlink 
	];
}

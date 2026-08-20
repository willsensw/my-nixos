{ config, pkgs, ... }:

{
	services = {
		pulseaudio = {
			enable = false;
		};
		pipewire = {
			enable = true;
			alsa.enable = true;
  			alsa.support32Bit = true;
  			pulse.enable = true;
		};
		blueman.enable = true;
		printing.enable = true;
		libinput.enable = true;
		
		# STM32
		udev.packages = with pkgs; [ 
			stlink 
		];
	};
}

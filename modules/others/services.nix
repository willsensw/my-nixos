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
		libinput.enable = true;
		
		udev.packages = with pkgs; [ 
			stlink	# STM32
		];
	};
}

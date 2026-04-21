{ config, ... }:

{
	services = {
		pipewire = {
     			enable = true;
			alsa.enable = true;
  			alsa.support32Bit = true;
  			pulse.enable = true;
		};
		blueman.enable = true;
		printing.enable = true;
		libinput.enable = true;
		xserver.enable = false;
	};
}

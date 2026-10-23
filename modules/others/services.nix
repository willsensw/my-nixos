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
		
		udev.packages =  [ 
			pkgs.stlink	# STM32
			(pkgs.writeTextFile {
				name = "usbasp-udev-rules";
				text = ''
				  SUBSYSTEM=="usb", ATTRS{idVendor}=="16c0", ATTRS{idProduct}=="05dc", MODE="0666", TAG+="uaccess"
				'';
				destination = "/etc/udev/rules.d/99-usbasp.rules";
			})
		];
	};
}

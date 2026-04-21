{ config, pkgs, ... }:

{
	programs = {
    		niri.enable = true;
    		uwsm.enable = true; 
    		xwayland.enable = true; 
  	};

	environment.systemPackages = with pkgs; [	
    		xwayland-satellite
    		wl-clipboard cliphist libnotify
    		kitty thunar ranger fuzzel waybar
    		swww matugen swaynotificationcenter swayosd
    		grim slurp grimblast satty
    		hyprlock hypridle wlogout
    		playerctl pwvucontrol networkmanagerapplet brightnessctl wireplumber
  	];
}

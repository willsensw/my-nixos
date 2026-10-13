{ config, pkgs, ... }:

{
    boot.loader = {
        systemd-boot = {
	        enable = false;
        };
        limine = {
            enable = true;
            secureBoot.enable = true;
            enrollConfig = true;
            panicOnChecksumMismatch = true;
            maxGenerations = 3;
            extraEntries = ''
                /WIN 11
                    protocol: efi
                    path: boot():/EFI/Microsoft/Boot/bootmgfw.efi
            '';
			style = {
				wallpapers = [
					/home/beimao/Pictures/wpp1.jpg
				];
				wallpaperStyle = "stretched";
			};
        };
        efi.canTouchEfiVariables = true;
    };
}

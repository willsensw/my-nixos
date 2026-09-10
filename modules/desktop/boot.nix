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
                /Windows 11
                    protocol: efi
                    path: boot():/EFI/Microsoft/Boot/bootmgfw.efi
            '';
        };
        efi.canTouchEfiVariables = true;
    };
}
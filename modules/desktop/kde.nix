{ config, pkgs, ... }:

{
    services.xserver.enable = true;
    services.desktopManager.plasma6.enable = true;

    environment.plasma6.excludePackages = with pkgs.kdePackages; [
        konsole
        kate
        elisa
        discover
        plasma-browser-integration
    ];
}
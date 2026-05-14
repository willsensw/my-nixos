{ config, lib, pkgs, ... }:

{
    services = {
        displayManager.gdm.enable = true;
        desktopManager.gnome.enable = true;
    };

    environment.gnome.excludePackages = (with pkgs; [
        gnome-photos
        gnome-tour
        cheese
        epiphany
        geary
        evince
        totem
        tali
        iagno
        hitori
        atomix
    ]);

    environment.systemPackages = with pkgs; [
        gnome-tweaks
        gnomeExtensions.user-themes
        gnomeExtensions.appindicator
        gnomeExtensions.dash-to-dock
    ];

    environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
    };
}

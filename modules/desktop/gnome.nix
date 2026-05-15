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

    environment.systemPackages = let
        gE = pkgs.gnomeExtensions;
    in
    with pkgs; [
        gnome-tweaks
        gE.user-themes
        gE.appindicator
        gE.dash-to-dock
        gE.blur-my-shell
    ];

    environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
    };
}

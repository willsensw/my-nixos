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
        gst = pkgs.gst_all_1;
    in
    with pkgs; [
        gnome-tweaks
        gE.user-themes
        gE.appindicator
        gE.dash-to-dock
        gE.blur-my-shell
        
        (pkgs.callPackage ../software/hanabi.nix {})
            gst.gstreamer
            gst.gst-plugins-base
            gst.gst-plugins-good
            gst.gst-plugins-bad
            gst.gst-libav
    ];

    environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
    };
}

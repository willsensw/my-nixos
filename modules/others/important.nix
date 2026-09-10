{ config, pkgs, lib, ... }:

{
    networking = {
        networkmanager.enable = true;
        hostName = "nixos";
    };

    nix.settings.trusted-users = [
        "root"
        "beimao"
    ];

    time.timeZone = "Asia/Pontianak";

    i18n.defaultLocale = "en_US.UTF-8";

    security.rtkit.enable = true;

    nixpkgs.config.allowUnfree = true;

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    system.stateVersion = "26.05";
}
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

    programs.nix-ld = {
        enable = true;
        libraries = with pkgs; [
            stdenv.cc.cc.lib # Provides libstdc++.so.6
            zlib             # Provides libz.so.1
            ncurses5         # Provides libtinfo.so.5
        ];
    };

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    system.stateVersion = "26.05";
}

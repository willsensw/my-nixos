{ config, ... }:

{
    fileSystems = {
        "/".options = [ "compress=zstd" ];
        "/home".options = [ "compress=zstd" ];
        "/nix".options = [ "compress=zstd" "noatime" ];
        "/swap".options = [ "noatime" ];
    };

    swapDevices = [{
        device = "/swap/swapfile";
        size = 8*1024;
    }];

    services.btrfs.autoScrub = {
        enable = true;
        interval = "monthly";
        fileSystems = [ "/" ];
    };
}
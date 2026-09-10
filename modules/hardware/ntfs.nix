{ config, ... }:

{
    boot.supportedFilesystems = [ "ntfs3" ];

    fileSystems."/run/media/beimao/DATA" = {
        device = "/dev/nvme0n1p5";
        fsType = "ntfs3";
        options = [ 
            "rw" 
            "users" 
            "nofail" 
            "exec" 
        ];
    };
}
{ config, lib, ... }:

{
    boot.supportedFilesystems = [ "ntfs" ];

    fileSystems."/run/media/beimao/DATA" = {
        device = "/dev/nvme0n1p5";
        fsType = "ntfs3";
        options = [ 
            "rw"
            "uid=1000"
            "gid=100"
            "dmask=022"
            "fmask=022"
            "users"
            "nofail"
            "exec"
        ];
    };
}

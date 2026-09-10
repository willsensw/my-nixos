{ config, pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver # Enables VAAPI and QSV for modern Intel CPUs
      vpl-gpu-rt         # Provides modern Quick Sync Video runtime for OBS
    ];
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = true;
    # RTX 2050, 'false' = proprietary
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };

      intelBusId = "PCI:0:2:0"; 
      nvidiaBusId = "PCI:1:0:0"; 
    };
  };
}

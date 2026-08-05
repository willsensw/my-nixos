{ config, pkgs, ... }:

{
  # --- Cinematic Boot Animation ---
  boot.plymouth = {
    enable = true;
    theme = "MikuPlymouth";  
    themePackages = [ (pkgs.mkMikuPlymouth [ 0 1 2 ]) ]; 
    
    # Note: If you have lots of RAM (16GB+) and want ALL 37 animations 
    # rotating instead of just 10, use this line instead:
    # themePackages = [ pkgs.mikuPlymouthFull ];
  };

  # --- Silent Boot (Keep all of this exactly as it was) ---
  boot.consoleLogLevel = 0;
  boot.initrd.verbose = false;
  boot.initrd.kernelModules = [ "i915" "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
  
  boot.kernelParams = [
    "quiet"
    "splash"
    "boot.shell_on_fail"
    "loglevel=3"
    "rd.systemd.show_status=false"
    "rd.udev.log_level=3"
    "udev.log_priority=3"
  ];    
}

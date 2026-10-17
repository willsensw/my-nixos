{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
      xfce.enable = true;
    };
  };
  services.displayManager.defaultSession = "xfce";
  services.xserver.desktopManager.xfce.enableWaylandSession = false;

  environment.xfce.excludePackages = with pkgs.xfce; [
    mousepad
    parole
    # ristretto
    xfce4-appfinder
    # xfce4-notifyd
    xfce4-screenshooter
    # xfce4-session
    # xfce4-settings
    # xfce4-taskmanager
    xfce4-terminal 
  ];
  
  services.picom.enable = true; # Highly recommended for preventing screen tearing
}

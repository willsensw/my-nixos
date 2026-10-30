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

  environment.xfce.excludePackages = with pkgs; [
    mousepad
    parole
    # ristretto
    xfce4-appfinder
    # xfce4-notifyd
    # xfce4-screenshooter
    # xfce4-session
    # xfce4-settings
    # xfce4-taskmanager
    xfce4-terminal 
  ];

  environment.systemPackages = with pkgs; [
    # flameshot
    # gradia
  ];
  
  services.picom.enable = true;
}

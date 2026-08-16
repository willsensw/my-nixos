{ config, pkgs, ... }:

{
    services.displayManager.sddm = {
        enable = true;
        wayland.enable = true;
    };
  
    programs.qylock = {
        enable = true;
        theme = "wuwa"; 
    };
}

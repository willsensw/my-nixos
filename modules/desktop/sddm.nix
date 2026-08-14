{ config, pkgs, ... }:

{
    services.displayManager.sddm = {
        enable = true;
        wayland.enable = true;

        theme = "sddm-astronaut-theme";
        extraPackages = [ pkgs.sddm-astronaut ];
    };
  
    environment.systemPackages = with pkgs; [
        sddm-astronaut
    ];
}
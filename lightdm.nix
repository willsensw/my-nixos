{ config, ... }:

{
  services.xserver.displayManager.lightdm = {
    enable = true;
    greeters.slick = {
      enable = true;
      theme.name = "Orchis-Dark";
      # background = "/home/beimao/Pictures/wallpaper/1.jpg"; 
    };
  };
}

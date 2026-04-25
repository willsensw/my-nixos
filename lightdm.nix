{ config, ... }:

{
  services.xserver.displayManager.lightdm = {
    enable = true;
    background = ./wpp.jpg;
  
      greeters.slick = {
      enable = true;
      theme.name = "Orchis-Dark-Compact";
      iconTheme.name = "Papirus-Dark";
      cursorTheme.name = "Bibata-Modern-Classic";
      cursorTheme.size = 24;
      font.name = "Inter 10";
      draw-user-backgrounds = true; # Shows the user's specific wallpaper if set
    };
  };
}

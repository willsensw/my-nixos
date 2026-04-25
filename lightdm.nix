{ config, pkgs, ... }:

{
  services.xserver.displayManager.lightdm = {
    enable = true;
    background = pkgs.nixos-artwork.wallpapers.nineish-dark-gray.gnomeFilePath; # Or your custom wallpaper path
  
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

{ config, pkgs, ... }:

{
  services = {
    gvfs.enable = true; 
    tumbler.enable = true;
    xserver = {
      enable = true;
      desktopManager = {
        xterm.enable = false;
        xfce.enable = true;
      };
    };
    displayManager.defaultSession = "xfce";
  };

  environment.systemPackages = with pkgs; [
    ffmpegthumbnailer
    poppler
    freetype
    xfce.thunar-archive-plugin
  ];
}
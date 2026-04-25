{ config, pkgs, ... }:

{
  # 1. Enable dconf (CRITICAL for GTK themes to save/apply on Wayland)
  programs.dconf.enable = true;

  # 2. Enable GVFS (Highly recommended for Thunar so Trash and USB mounting work)
  services.gvfs.enable = true; 

  services.tumbler.enable = true;

  environment.systemPackages = with pkgs; [
    nwg-look

    tumbler              # Core thumbnailer service
    ffmpegthumbnailer    # For video previews (mp4, mkv, etc.)
    freetype             # For font previews
    libgsf               # For ODF file previews
    poppler 

    orchis-theme
    papirus-icon-theme
    bibata-cursors
  ]; 
}

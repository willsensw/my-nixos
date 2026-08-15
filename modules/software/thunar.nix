{ config, pkgs, ... }:

{
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-volman
      thunar-archive-plugin # extract zip/tar files
    ];
  };

  # Enable the settings daemon so Thunar remembers "Show hidden files"
  programs.xfconf.enable = true;

  # Enable the virtual file system so external drives appear in the sidebar
  services.gvfs.enable = true;

  # Enable thumbnail support for images and PDFs in Thunar
  services.tumbler.enable = true;
}
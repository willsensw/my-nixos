{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = true;
    desktopManager.xfce.enable = true;
  };

  services.displayManager.defaultSession = "xfce";

  environment.xfce.excludePackages = with pkgs.xfce; [
    mousepad            # Default text editor
    parole              # Default media player
    ristretto           # Default image viewer
    xfce4-appfinder     # Application search tool
    # xfce4-notifyd     # Notification daemon (keep excluded if using Dunst)
    xfce4-screenshooter # Screenshot tool (keep excluded if using Flameshot)
    xfce4-taskmanager   # GUI process viewer (htop/btop in terminal is lighter)
    xfce4-terminal      # Default terminal (keep excluded if using Alacritty/Kitty)
  ];

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    flameshot
  ];

  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };

  services.gvfs.enable = true; 
  
  services.tumbler.enable = true; 

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.lightdm.enableGnomeKeyring = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "*";
  };
}
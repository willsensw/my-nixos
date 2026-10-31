{ config, pkgs, ... }:

{
  services = {
    picom.enable = true;
    displayManager.defaultSession = "xfce";
    
    xserver = {
      enable = true;
      desktopManager = {
        xterm.enable = false;
        xfce = {
          enable = true;
          enableWaylandSession = false;
        };
      };
      
      displayManager.lightdm = {
        enable = true;
        autoLogin = {
          enable = true;
          user = "beimao";
        };
      };
    };
  };

  environment = {
    xfce.excludePackages = with pkgs; [
      mousepad
      parole
      xfce4-appfinder
      xfce4-terminal
    ];

    systemPackages = with pkgs; [
      xfce4-whiskermenu-plugin
      plank
    ];

    sessionVariables = {
      GDK_BACKEND = "x11"; # For GTK based app
      QT_QPA_PLATFORM = "xcb"; # For Qt based app 
      SDL_VIDEODRIVER = "x11"; # For SDL2/OpenGL based app
      CLUTTER_BACKEND = "x11"; # For Clutter library
      WAYLAND_DISPLAY = ""; # Fully disable wayland
    };
  };
}

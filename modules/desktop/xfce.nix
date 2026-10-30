{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
      xfce.enable = true;
    };
  };
  services.displayManager.defaultSession = "xfce";
  services.xserver.desktopManager.xfce.enableWaylandSession = false;

  environment.xfce.excludePackages = with pkgs; [
    mousepad
    parole
    # ristretto
    xfce4-appfinder
    # xfce4-notifyd
    # xfce4-screenshooter
    # xfce4-session
    # xfce4-settings
    # xfce4-taskmanager
    xfce4-terminal 
  ];

  environment.systemPackages = with pkgs; [
    xfce4-whiskermenu-plugin
    plank
    # flameshot
    # gradia
  ];
  
  services.picom.enable = true;

  environment.sessionVariables = {
    # Memaksa aplikasi berbasis GTK (seperti Arduino IDE baru, GIMP, dll) menggunakan X11
    GDK_BACKEND = "x11";
  
    # Memaksa aplikasi berbasis Qt (seperti KiCad, OBS Studio, VLC) menggunakan X11
    QT_QPA_PLATFORM = "xcb";
  
    # Memaksa aplikasi berbasis SDL2/OpenGL (seperti Blender dan beberapa game) menggunakan X11
    SDL_VIDEODRIVER = "x11";
  
    # Memaksa pustaka Clutter untuk menggunakan backend X11
    CLUTTER_BACKEND = "x11";
  
    # Mengosongkan variabel Wayland untuk aplikasi yang keras kepala agar mendeteksi X11 sebagai satu-satunya opsi
    WAYLAND_DISPLAY = "";
  };
}

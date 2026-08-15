{ config, ... }:

{
  programs.niri.enable = true;

  programs.appimage.binfmt = true;

  # swaylock
  security.pam.services.swaylock = {};

  environment.sessionVariables = {
    # Force Electron applications (Arduino IDE, Discord, VSCode) to use native Wayland
    NIXOS_OZONE_WL = "1";
    
    # Tell Qt applications (Cura) to try Wayland first, but safely fall back to X11 (xcb) if they panic
    QT_QPA_PLATFORM = "wayland;xcb";
  };
}

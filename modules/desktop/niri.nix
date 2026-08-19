{ config, pkgs, ... }:

{
  programs = {
    niri.enable = true;
    appimage.binfmt = true;
    xwayland.enable = true;
  };

  services.power-profiles-daemon.enable = true;

  environment.systemPackages = with pkgs; [
    xwayland-satellite
    pywal
    rofi
    waybar
    ranger
    hyprlock
    hypridle
    wlogout
    swaynotificationcenter
  ];
}

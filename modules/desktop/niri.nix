{ config, pkgs, ... }:

{
  programs = {
    niri.enable = true;
    appimage.binfmt = true;
    xwayland.enable = true;
    pywal.enable = true;
  };

  environment.systemPackages = with pkgs; [
    xwayland-satellite
    rofi
    waybar
    ranger
    hyprlock
    hypridle
    wlogout
    swaynotificationcenter
  ];
}

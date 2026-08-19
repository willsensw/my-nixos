{ config, pkgs, ... }:

{
  programs.niri.enable = true;

  programs.appimage.binfmt = true;

  programs.xwayland.enable = true;

  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];
}

{ config, ... }:

{
  programs.niri.enable = true;

  programs.appimage.binfmt = true;

  # swaylock
  security.pam.services.swaylock = {};
}

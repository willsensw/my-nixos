{ config, ... }:

{
  programs.niri.enable = true;

  # swaylock
  security.pam.services.swaylock = {};
}
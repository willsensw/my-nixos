{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # (kicad.override {
      # addons = with pkgs.kicadAddons; [
        # kikit
        # freerouting
      # ];
    # })
    kicad
    gerbv
    librecad
  ];
}
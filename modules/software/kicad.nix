{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (kicad.override {
      addons = with pkgs.kicadAddons; [
        kikit
        # freerouting
      ];
    })
    gerbv # Excellent gerber viewer to double-check your files before ordering
  ];
}
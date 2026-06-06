{ config, pkgs, ... }:

{
  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
    gamemode.enable = true;
  };

  environment.systemPackages = with pkgs; [
    mangohud
    protonup-qt
    heroic
    lutris

    (pvzge.overrideAttrs (oldAttrs: rec {
      version = "0.9.0";
      src = fetchurl {
        url = "https://github.com/Gzh0821/pvzg_site/releases/download/0.9.0/pvzge-0.9.0.zip"; 
        sha256 = "d19e2fba24c650cdf581809add17934c5483f31d47ec20d13b78c725e4905087"; 
      };
    }))
  ];
}

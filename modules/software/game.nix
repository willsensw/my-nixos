{ config, lib, pkgs, ... }:

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
      src = fetchzip {
        url = "https://github.com/Gzh0821/pvzg_site/releases/download/0.9.0/pvzge-0.9.0.zip"; 
        hash = lib.fakeHash; 
      };
    }))
  ];
}

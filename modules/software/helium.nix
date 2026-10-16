{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = [
    (pkgs.symlinkJoin {
      name = "helium-x11-wrapped";
      paths = [ inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.default ];
      buildInputs = [ pkgs.makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/helium \
        --unset WAYLAND_DISPLAY \
        --add-flags "--ozone-platform=x11"
      '';
    })
  ];
}

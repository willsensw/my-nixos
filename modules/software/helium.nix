{ config, pkgs, inputs, ... }:

{
  (pkgs.symlinkJoin {
    name = "helium-x11-wrapped";
    paths = [ inputs.helium.packages.${system}.default ];
    buildInputs = [ makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/helium \
      --unset WAYLAND_DISPLAY \
      --add-flags "--ozone-platform=x11"
    '';
  })
}

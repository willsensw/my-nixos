{ config, pkgs, ... }:

{
  programs.obs-studio = {
    enable = true;
    package = pkgs.obs-studio.override {
      cudaSupport = true;
    };
    plugins = with pkgs.obs-studio-plugins; [
      obs-pipewire-audio-capture
      obs-move-transition
      advanced-scene-switcher
      obs-multi-rtmp
      obs-scale-to-sound
      obs-composite-blur
      obs-vertical-canvas
      obs-aitum-multistream
    ];
  };
}

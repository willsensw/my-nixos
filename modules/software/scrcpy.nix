{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    scrcpy
    android-tools
  ];
}

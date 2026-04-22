{ config, pkgs, ... }:

{
  # --- Cinematic Boot Animation ---
  boot.plymouth = {
    enable = true;
    theme = "lone"; 
    themePackages = with pkgs; [
      # By default, this package installs dozens of themes. 
      # We use an override to only compile the exact one we want, saving build time and space.
      (adi1090x-plymouth-themes.override {
        selected_themes = [ "lone" ];
      })
    ];
  };

  # --- Silent Boot (Required so text doesn't ruin the animation) ---
  boot.consoleLogLevel = 0;
  boot.initrd.verbose = false;
  
  boot.kernelParams = [
    "quiet"
    "splash"
    "boot.shell_on_fail"
    "loglevel=3"
    "rd.systemd.show_status=false"
    "rd.udev.log_level=3"
    "udev.log_priority=3"
  ];	
}

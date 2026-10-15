{ config, pkgs, ... }:

{
  services = {
    desktopManager.cosmic.enable = true;
    displayManager = {
      cosmic-greeter.enable = true;
      autoLogin = {
        enable = true;
        user = "beimao";
      };
    };
    system76-scheduler.enable = true;
  };

  environment = {
    cosmic.excludePackages = with pkgs; [
      cosmic-edit
    ];
    sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;
  };
}

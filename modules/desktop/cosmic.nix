{
  # Enable the COSMIC login manager
  services.displayManager.cosmic-greeter.enable = true;

  # Enable the COSMIC desktop environment
  services.desktopManager.cosmic.enable = true;

  services.displayManager.autoLogin = {
    enable = true;
    user = "beimao";
  };

  environment.cosmic.excludePackages = with pkgs; [
    cosmic-edit
  ];

  services.system76-scheduler.enable = true;

  environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;
}

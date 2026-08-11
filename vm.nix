{ config, ... }:

{
  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };
  
  programs.virt-manager.enable = true;
  
  services = {
    qemuGuest.enable = true;
    spice-vdagentd.enable = true;
  };
}

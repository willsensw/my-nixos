{ config, lib, pkgs, ... }:

{
	services.ollama = {
  		enable = true;
		package = pkgs.ollama-cuda;
	};
  	
	# This prevents the service from starting automatically on boot
  	systemd.services.ollama.wantedBy = lib.mkForce [ ];
}

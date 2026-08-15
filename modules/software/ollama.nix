{ config, lib, pkgs, ... }:

{
	services.ollama = {
  		enable = true;
		package = pkgs.ollama-cuda;
	};

	services.open-webui = {
    	enable = true;
  	};

	# This prevents the service from starting automatically on boot
  	systemd.services.ollama.wantedBy = lib.mkForce [ ];
}

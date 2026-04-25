
{ config, lib, pkgs, ... }:

{
	users.users.beimao = {
		isNormalUser = true;
		shell = pkgs.zsh;
		description = "Electronics Engineer";
		extraGroups = [
			"wheel"
			"dialout"
			"networkmanager"
			"plugdev"
			"adbusers"
		];
		packages = with pkgs; [
			tree
		];
	};
}

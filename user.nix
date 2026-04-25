
{ config, lib, pkgs, ... }:

{
	programs.zsh = {
  		enable = true;
		autosuggestions.enable = true;	
		syntaxHighlighting.enable = true;
		enableCompletion = true;
		shellAliases = {
			btw = "echo I use NixOS with Hyprland btw";
				
			ollama-on = "sudo systemctl start ollama";
			ollama-off = "sudo systemctl stop ollama";
			llama = "ollama run llama3.1:8b";

			comfy = "cd ~/ai-ws && nix develop && cd ComfyUI && source venv/bin/activate && python main.py --lowvram";

			rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#default";
			garbage = "sudo nix-collect-garbage -d";
			optimise = "sudo nix-store --optimise";
		};
	};

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

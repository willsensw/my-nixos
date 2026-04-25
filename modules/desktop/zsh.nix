{ config, lib, pkgs, ... }:	

{
	programs.zsh = {
		enable = true;
		autosuggestions.enable = true;
		syntaxHighlighting.enable = true;
		enableCompletion = true;

    interactiveShellInit = ''
      fastfetch
    '';

		shellAliases = {
			ollama-on = "sudo systemctl start ollama";
			ollama-off = "sudo systemctl stop ollama";
			llama = "ollama run llama3.1:8b";

			garbage = "sudo nix-collect-garbage -d";
			optimise = "sudo nix-store --optimise";

      		cmatrix = "cmatrix -b -a -s -C blue";
		};
	};
	users.defaultUserShell = pkgs.zsh;
}

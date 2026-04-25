{ config, lib, pkgs, ... }:

{
	programs.neovim = {
		enable = true;
		defaultEditor = true;
		configure = {
			packages.myVimPackage = with pkgs.vimPlugins; {
				start = [ nvim-treesitter.withAllGrammars ];
			};
		};
	};

	programs.nix-ld = {
    		enable = true;
    		libraries = with pkgs; [
      			stdenv.cc.cc
      			zlib
      			openssl
      			curl
      			glib
      			util-linux
      			glibc
      			icu
    		];
  	};

	environment.systemPackages = with pkgs; [
    		ripgrep
    		fd
		gnumake
		nodejs_22
		cargo
  	];
}

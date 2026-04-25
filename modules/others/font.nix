
{ pkgs, ... }:

{
	fonts.packages = with pkgs; [
		noto-fonts
		noto-fonts-cjk-sans
		noto-fonts-color-emoji
		liberation_ttf
		fira-code
		fira-code-symbols
		nerd-fonts.jetbrains-mono
		times-newer-roman
		mplus-outline-fonts.githubRelease
		dina-font
  		proggyfonts
		inter
		inter-nerdfont
		font-awesome
		material-symbols
    	nerd-fonts.caskaydia-cove
	];
}

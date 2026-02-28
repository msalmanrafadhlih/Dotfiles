# System Zsh Configuration
{ pkgs, ... }:

{
	users.defaultUserShell = pkgs.zsh;
	
	programs.bash = {
		enable = true;
		shellAliases = import ./aliases.nix;
	};
	

	programs.zsh = {
	  enable = true;
	  shellAliases = import ./aliases.nix;
	  syntaxHighlighting.enable = true;
	};
}

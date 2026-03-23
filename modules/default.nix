# exported to ../flake.nix
{
	imports = [
	  ./scripts/01chat.nix
	  ./scripts/opencam.nix
	  ./scripts/battery.nix
	  ./scripts/bookmarks.nix
	  ./scripts/github-repos.nix
	  ./scripts/pandoc.nix
	  ./scripts/media.nix
	  ./scripts/run.nix
	  ./scripts/volume.nix
	  ./scripts/xyz.nix
	  ./scripts/tar.nix
	  ./scripts/background.nix
	  ./scripts/img-compress.nix
	  ./scripts/brightness.nix
	  ./scripts/colorscript.nix
  ];
}

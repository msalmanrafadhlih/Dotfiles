#./modules/default.nix
{ inputs, lib, pkgs, config, dotfiles, username, ... }:

let
  branch = dotfiles;
  home = config.home.homeDirectory;
  dotfiles_path = "${home}/.dotfiles/${branch}";
  repo_url = "https://github.com/msalmanrafadhlih/Dotfiles.git";
in

{
  home.username = username;
  home.homeDirectory = "/home/${username}";
  programs.git.enable = true;
  home.stateVersion = "25.11";

  home.activation = {
   	setupDotfiles = lib.hm.dag.entryAfter ["writeBoundary"] ''
		  # Buat folder .dotfiles jika belum ada
		  mkdir -p ${dotfiles_path}

		  if [ ! -d "${dotfiles_path}/.git" ]; then
				echo "--- Cloning Dotfiles dari GitHub (${branch}) ---"
				${pkgs.git}/bin/git clone -b ${branch} --single-branch --depth 1 ${repo_url} "${dotfiles_path}"
		  else
				echo "--- Dotfiles sudah ada, melakukan check update (safe) ---"
				cd "${dotfiles_path}"
				# Melakukan fetch saja agar tidak merusak kerjaan lokal
				${pkgs.git}/bin/git fetch origin ${branch}
				echo "Gunakan 'git pull --rebase' secara manual di folder dotfiles jika ingin sinkronisasi."
		  fi
		'';
   };

	imports = [
	  ./applications.nix
	  ./git.nix
	  ./xsession.nix
	  ./mpd.nix 
	  ./packages.nix

	  ./scripts/reddit.nix
	  ./scripts/opencam.nix
	  ./scripts/battery.nix
	  ./scripts/bookmarks.nix
	  ./scripts/github-repos.nix
	  ./scripts/pandoc.nix
	  ./scripts/media.nix
	  ./scripts/run.nix
	  ./scripts/volume.nix
	  ./scripts/01chat.nix
	  ./scripts/xyz.nix
	  ./scripts/youtube.nix
	  ./scripts/tar.nix
	  ./scripts/background.nix
	  ./scripts/img-compress.nix
	  ./scripts/brightness.nix
	  ./scripts/colorscript.nix

	  # ./suckless.nix
	  # ./git-prompt.nix
	  # ./xdg-home.nix # backup error make me sick!!
	  inputs.stylix.homeModules.stylix
  ];
}

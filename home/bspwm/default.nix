# ./bspwm/default.nix
 { config, dotfiles, ... }:

let
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  home = config.home.homeDirectory;
  dotfiles_path = "${home}/.dotfiles/${dotfiles}/home/bspwm";

  configs = {
		polybar = "polybar";
		picom = "picom";
		sxhkd = "sxhkd";
		dunst = "dunst";
		rofi = "rofi";
		eww = "eww";

		"bspwm/src" = "src";
		"bspwm/bspwmrc" = "bspwmrc";
  };
in

{
  # Symlink path to ~./config/*
  xdg.configFile = builtins.mapAttrs (name: subpath: {source =
    create_symlink "${dotfiles_path}/${subpath}";
    recursive = true;
  }) configs;
  
  #########################
  ### Polybar Integrations:
  # Hide - Unhide Polybar
  imports = [
    ./show-polybar.nix
    ./hide-polybar.nix
    ./picom.nix
  ];
}

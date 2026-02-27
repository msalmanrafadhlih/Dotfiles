{ config, dotfiles, ... }:

let
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  home = config.home.homeDirectory;
  dotfiles_path = "${home}/.dotfiles/${dotfiles}/home/com.kdocker";
  configs = {
		"com.kdocker/icons" = "icons";
		"com.kdocker/KDocker.conf" = "KDocker.conf";
  };
in

{
  xdg.configFile = builtins.mapAttrs (name: subpath: {source =
    create_symlink "${dotfiles_path}/${subpath}";
    recursive = true;
  }) configs;
}

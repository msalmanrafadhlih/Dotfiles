{ config, dotfiles, ... }:

let
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  home = config.home.homeDirectory;
  dotfiles_path = "${home}/.dotfiles/${dotfiles}/configs/zed-editor";

  configs = {
		"zed/themes" = "themes";
		"zed/keymap.json" = "keymap.json";
		"zed/settings.json" = "settings.json";
  };
in

{
  # Symlink path to ~./config/*
  xdg.configFile = builtins.mapAttrs (name: subpath: {source =
    create_symlink "${dotfiles_path}/${subpath}";
    recursive = true;
  }) configs;

  programs.zed-editor = {
    enable = true;
  };
}

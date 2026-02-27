{ config, dotfiles, ... }:

let
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  home = config.home.homeDirectory;
  dotfiles_path = "${home}/.dotfiles/${dotfiles}/home";
  configs = {
    "vesktop/themes" = "vesktop/themes";
  };
in

{
  xdg.configFile = builtins.mapAttrs (name: subpath: {source =
    create_symlink "${dotfiles_path}/${subpath}";
    recursive = true;
  }) configs;
}

{ config, pkgs, dotfiles, ... }:

let
  # Path absolut ke folder dotfiles kamu
  dotPath = "${config.home.homeDirectory}/.dotfiles/${dotfiles}/home/rmpc";
  
  # Helper biar tidak ngetik panjang-panjang
  link = path: config.lib.file.mkOutOfStoreSymlink "${dotPath}/${path}";
in
{
  # Langsung targetkan ke subfolder rmpc
  xdg.configFile = {
    "rmpc/themes".source = link "themes";
    "rmpc/utils".source = link "utils";
    "rmpc/config.ron".source = link "config.ron";
  };

  programs.rmpc = {
    enable = true;
    package = pkgs.rmpc;
  };

  imports = [
    ./playcount.nix
    ./inspect.nix
  ];
}

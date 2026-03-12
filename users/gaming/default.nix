# exported to ../flake.nix

{ username, ... }:

{
  home.username = username;
  home.homeDirectory = "/home/${username}";
  programs.git.enable = true;
  home.stateVersion = "25.11";

  imports = [
    
  ];
}

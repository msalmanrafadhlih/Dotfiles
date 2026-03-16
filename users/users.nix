{ username, }:

{
  home.username = username;
  home.homeDirectory = "/home/${username}";
  programs.git.enable = true;

  specialisation.gamemode.configuration = {
    home.username = "gamemode";
    home.homeDirectory = "/home/${username}";
    programs.git.enable = true;
  };
}

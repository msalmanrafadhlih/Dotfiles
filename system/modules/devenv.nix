{ pkgs, ... }:
{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;

    enableZshIntegration = true; # karena kamu pakai zsh
    enableBashIntegration = true; # karena kamu pakai zsh
  };

  environment.systemPackages = with pkgs; [
    devenv
  ];
}

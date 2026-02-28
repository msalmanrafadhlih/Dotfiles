# ./configuration.nix
{ system, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./audio.nix
    ./bluetooth.nix
    ./fileSystems.nix
    ./locale.nix
    ./network.nix
    ./hardware.nix
    ./system-packages.nix
    ./services.nix
    ./users.nix
    ./virtualisation.nix
    ./devenv.nix

    ./autoupdate.nix
    ./fonts.nix
    ./openssh.nix
    ./shell.nix
    ./sudo.nix
    ./touchpad.nix
    ./boot.nix
    ./settings.nix

    # ./kanata.nix
    # ./power.nix
    # ./acme.nix
    # ./nginx.nix
  ];


  nixpkgs.hostPlatform = system;
  system.stateVersion = "25.11";
  security.rtkit.enable = true;
}

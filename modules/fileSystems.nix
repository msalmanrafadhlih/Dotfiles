# ./modules/fileSystem.nix
{ config, username, lib, ... }:
let
  isVN = config.virtualisation.vmVariant != null;
in
{
  fileSystems."/home/${username}/.steam" =
    lib.mkIf (!isVN) {
      device = "/dev/disk/by-uuid/f2e16302-ca61-486c-96eb-16294ba9b3aa";
      fsType = "btrfs";
      options = [ "defaults" ];
    };
}

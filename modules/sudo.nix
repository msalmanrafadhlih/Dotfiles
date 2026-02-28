# ./modules/sudo.nix
{ username, ... }:

{
  security.sudo = {
    enable = true;
    wheelNeedsPassword = true;

    extraRules = [
      {
        ## Main User
        ####################
        users = [ username ];
        commands = [
          {
            command = "/run/current-system/sw/bin/nixos-rebuild";
            options = [ "NOPASSWD" "SETENV" ];
          }
          {
            command = "/run/current-system/sw/bin/systemctl";
            options = [ "NOPASSWD" ];
          }
        ];
      }
    ];
  };
}

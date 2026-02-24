# ./modules/users.nix
{ pkgs, username, ... }:

{
  users.mutableUsers = false;
  users.users.${username} = {
    isNormalUser = true;
    description = "Tquilla - Deleveloper";
    shell = pkgs.zsh;

    #######################
    # 'mkpasswd -m sha-512'
    # or 'openssl passwd -6'
    hashedPassword = "$6$TG4zdr62ukT/bMui$7wMXJRJeLFI2f7LhwnXqiqCWepV6Akq0F6Y91I.QY7z4xrZwVfz8vdhjQ3SUyrMfb/hCeSJBpIQQvZJlzGuXO0";

    extraGroups = [
      "wheel"
      "networkmanager"
      "libvirtd"
      "kvm"
      "adbusers"
      "docker"
      "i2c"
    ];
  };
  # services.getty.autologinUser = "tquilla";
}

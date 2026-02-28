# ./modules/users.nix
{ pkgs, username, ... }:

{
  users.mutableUsers = true;
  users.users.${username} = {
    isNormalUser = true;
    description = "Tquilla - Deleveloper";
    shell = pkgs.zsh;

    #######################
    # 'mkpasswd -m sha-512'
    # or 'openssl passwd -6'
    hashedPassword = "$6$4y45xddEerGmBn10$syHxREmf4Ky37ra6ULFwar.I9a/Bts/5k/OxztP3XWhDT.BQ3yEP0z3BUfLXeft4FJERy3RZo.AcaoL6L/H7i0";

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

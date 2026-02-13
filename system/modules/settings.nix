###################################
## ⚡ Nix Daemon & Build Optimization
###################################
{
  nix.settings = {
    extra-experimental-features = ["nix-command" "flakes"];
    # pastikan sama seperti di nixConfig
    extra-substituters = [
      "https://cache.nixos.org"
      "https://nix-community.cachix.org"
    ];

    extra-trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];

    auto-optimise-store = true;
    warn-dirty = false;
    
    # disable keep-derivations kecuali memang butuh debugging source
    # Enable 'keep-outputs=true' u/ Setiap hasil build derivation disimpan
    # tidak terhapus walau di garbage-collection
    keep-derivations = false;
    # keep-outputs = true;
  };

  # optimize nix-daemon resource usage
  systemd.services.nix-daemon.serviceConfig = {
    CPUQuota = "80%";
    IOSchedulingClass = "best-effort";
    IOSchedulingPriority = 4;
  };
}

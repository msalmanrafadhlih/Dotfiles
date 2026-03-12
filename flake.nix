{
  description = "A declarative Users configuration built with intention.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  }
  // import ./inputs {};

  outputs = { home-manager, ... }@inputs:
  let
    mkUser = user: extraModules: home-manager.lib.homeManagerConfiguration {
      extraSpecialArgs = { inherit inputs; username = user; };
      modules = [ ./configs ./scripts ] ++ extraModules;
    };
  in
  {
    # a NixOS module that root flake can import in mkHost
    nixosModules.default = { hostname, system, nixpkgs, ... }:
    {
      imports = [ home-manager.nixosModules.home-manager ];
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = { inherit inputs system hostname; };
        backupFileExtension = "backup";
        pkgs = nixpkgs.legacyPackages.${system};
      };
    };

    # keep standalone homeConfigurations
    # for `home-manager switch --flake .#dev / gamin / server / work`
    homeConfigurations = {
      dev     = mkUser "dev"    [ ./users/dev.nix ];
      mode    = mkUser "gaming" [ ./users/gaming.nix ];
      service = mkUser "server" [ ./users/server.nix ];
      default = mkUser "work"   [ ./users/work.nix ];
    };
  };
}

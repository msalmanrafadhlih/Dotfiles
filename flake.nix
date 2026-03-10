{
  description = "nixos config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stable.url = "github:nixos/nixpkgs/nixos-25.11";

    bspwm = {
      # url = "github:msalmanrafadhlih/Dotfiles/bspwm";
      url = "path:./bspwm"; # for testing
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # niri = {
    #   url = "github:msalmanrafadhlih/Dotfiles/niri";
    #   # url = "path:./niri"; # for testing
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # hyprland = {
    #   url = "github:msalmanrafadhlih/Dotfiles/hyprland";
    #   # url = "path:./hprland"; # for testing
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    ############################
    # - Set your System, Username and Hostname here!!
    system = "x86_64-linux";
    username = "tquilla";
    flakePath = self.outPath;
    stable = import inputs.stable {
      inherit system;
      config.allowUnfree = true;
    };
  in
  {
    nixosConfigurations = { 
    # BSPWM `sudo nixos-rebuild switch --flake ~/.dotfiles/system#bspwm`
      bspwm = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs username flakePath system stable; };
        modules = [
          ########################
          ## SYSTEM CONFIGURATIONS
          ./modules/configuration.nix

          ########################
          ## Dotfiles CONFIGURATIONS
          inputs.bspwm.nixosModules.default
        ];
      };

      # # NIRI `sudo nixos-rebuild switch --flake ~/.dotfiles/system#niri`
      # niri = nixpkgs.lib.nixosSystem {
      #   inherit system;
      #   specialArgs = { inherit inputs username flakePath system stable; };
      #   modules = [
      #     ########################
      #     ## SYSTEM CONFIGURATIONS
      #     ./modules/configuration.nix

      #     ########################
      #     ## Dotfiles CONFIGURATIONS
      #     inputs.niri.nixosModules.default
      #   ];
      # };

      # # HYPRLAND `sudo nixos-rebuild switch --flake ~/.dotfiles/system#hyprland`
      # hyprland = nixpkgs.lib.nixosSystem {
      #   inherit system;
      #   specialArgs = { inherit inputs username flakePath system stable; };
      #   modules = [
      #     ########################
      #     ## SYSTEM CONFIGURATIONS
      #     ./modules/configuration.nix

      #     ########################
      #     ## Dotfiles CONFIGURATIONS
      #     inputs.hyprland.nixosModules.default
      #   ];
      # };
    };
  };
}

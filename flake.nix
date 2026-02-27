{
  description = "BSPWM - NixOS Home Configuration ";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stable.url = "github:nixos/nixpkgs/nixos-25.11";

    zjstatus = {
      url = "github:dj95/zjstatus";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    textfox = {
      url = "github:adriankarlen/textfox";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    yazi-flavors = {
      url = "github:yazi-rs/flavors";
      flake = false;
    };

    yazi-compress = {
      url = "github:KKV9/compress.yazi";
      flake = false;
    };
  };

  outputs = { home-manager, ... }@inputs:
  let
    dotfiles = "bspwm";
  in
  {
    # Output untuk Standalone (command: home-manager switch)
    # homeConfigurations."tquilla" = home-manager.lib.homeManagerConfiguration {
    #   inherit pkgs;
    #   extraSpecialArgs = { inherit inputs; };
    #   modules = modulesList;
    # };

    # Output Baru: Module untuk di-import oleh Flake Utama (NixOS)
    nixosModules.default = { username, hostname, system, ... }:
    let
      stable = import inputs.stable { inherit system; };
    in {
      imports = [
      home-manager.nixosModules.home-manager
      ###################################
      ## 🧩 Overlays & External Modules
      ###################################
        { nixpkgs.overlays = [
            inputs.nur.overlays.default
          ];
        }

      ###################################
      ## 🧱 System Modules - BSPWM
      ###################################
        ./modules/bspwm.nix
      ];


      ###############################
      #### 🧱 Home-Manager Modules
      ###############################
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        users = {
          # ./modules/default.nix ./home/default.nix
          tquilla = { imports = [ ./modules ./home ]; };
        };
        extraSpecialArgs = {
          inherit inputs system dotfiles username hostname stable;
        };
        backupFileExtension = "backup";
      };
    };
  };
}

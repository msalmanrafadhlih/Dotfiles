{ }:
{
  home-manager = {
    url = "github:nix-community/home-manager";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  ## ---- System Packages
  xytz = {
    url = "github:TQ-See/xytz";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  rip = {
    url = "github:TQ-See/process-manager";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  st-nix = {
    url = "github:TQ-See/st-flexipatch";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  ## ---- Home-Manager Packages
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

  yazi-flavors = {
    url = "github:yazi-rs/flavors";
    flake = false;
  };

  yazi-compress = {
    url = "github:KKV9/compress.yazi";
    flake = false;
  };
}

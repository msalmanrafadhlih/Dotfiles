{ inputs, ... }:
{
  imports = [ inputs.xytz.homeManagerModules.default ];
  programs.xytz = {
    enable = true;
  };
}

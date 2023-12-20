{ pkgs, ... }:

{
  nix.package = pkgs.nixFlakes;
  nixpkgs.config = {
    allowUnfree = true;
    allowUnsupportedSystem = true;
  };


  programs.zsh.enable = true;

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
      dina-font
      proggyfonts
      julia-mono
      gohufont
    ];
  };

  environment.variables = {
    SHELL = "zsh";
    EDITOR = "neovim";
  };
}

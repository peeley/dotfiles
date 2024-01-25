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
    packages = with pkgs; [
      dina-font
      proggyfonts
      julia-mono
      gohufont
    ];
  };

  nix.extraOptions = ''
    keep-outputs = true
    keep-derivations = true
    experimental-features = nix-command flakes
  '';

  nix.settings.trusted-users = [ "bodo" "admin" ];

  environment.variables = {
    SHELL = "zsh";
    EDITOR = "neovim";
  };
}

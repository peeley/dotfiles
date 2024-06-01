{ pkgs, ... }:

{
  nix.package = pkgs.nixFlakes;
  nixpkgs.config = {
    allowUnfree = true;
    allowUnsupportedSystem = true;
    permittedInsecurePackages = [
      "electron-25.9.0" # required for obsidian
    ];
  };

  programs.zsh.enable = true;

  # nix-darwin still uses `fonts.fonts` instead of `fonts.packages`
  fonts = if pkgs.stdenv.isLinux then {
    fontDir.enable = true;
    packages = with pkgs; [
      dina-font
      proggyfonts
      julia-mono
      gohufont
      font-awesome
    ];
  } else {
    fontDir.enable = true;
    fonts = with pkgs; [
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

  time.timeZone = "America/Los_Angeles";
}

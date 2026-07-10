{ pkgs, ... }:

{
  nix.package = pkgs.nixVersions.stable;
  nixpkgs.config = {
    allowUnfree = true;
    allowUnsupportedSystem = true;
    permittedInsecurePackages = [
      "electron-25.9.0" # required for obsidian
      "dotnet-sdk-6.0.428" # required until upgrades to .NET 8 are done
      "dotnet-runtime-6.0.36"
    ];
  };

  programs.zsh.enable = true;

  fonts = {
    packages = with pkgs; [
      dina-font
      proggyfonts
      julia-mono
      gohufont
      font-awesome
      nerd-fonts.symbols-only
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

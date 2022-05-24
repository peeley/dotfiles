{ config, lib, pkgs, ... }:

{
  home.username = "bodo";
  home.homeDirectory = "/home/bodo";

  programs.starship = {
      enable = true;
      enableZshIntegration = true;
  };

  programs.git = {
      enable = true;
      userName = "Noah Snelson";
      userEmail = "noah.snelson@proton.me";
  };

  programs.neovim.enable = true;
  programs.bat = {
      enable = true;
      config = {
          theme = "ansi";
          style = "changes";
      };
  };

  programs.htop.enable = true;

  home.packages = with pkgs; [
    ripgrep
    exa
    unzip
    minecraft
    paper-icon-theme
    arc-theme
    nordic
    lutris
    deluge
    mullvad-vpn
    kitty
  ];
}

{ config, lib, pkgs, ... }:

(import ../../common/home.nix {
    config = config;
    lib = lib;
    pkgs = pkgs;
}) //
{
  home.username = "bodo";
  home.homeDirectory = "/home/bodo";

  home.stateVersion = "22.11";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    paper-icon-theme
    arc-theme
    nordic
    mullvad-vpn
    kitty
    zathura
    calibre
    sqlite
    (retroarch.override {
      cores = with libretro; [
        beetle-psx-hw
        pcsx2
        dolphin
        bsnes
        mgba
      ];
    })
    rpcs3
    obsidian
    lutris
    xfce.thunar-archive-plugin
  ];
}

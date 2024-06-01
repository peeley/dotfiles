{ config, lib, pkgs, ... }:

{
  imports = [
    ../../common/home.nix
  ];

  home.username = "bodo";
  home.homeDirectory = "/home/bodo";

  home.stateVersion = "22.11";

  home.packages = with pkgs; [
    paper-icon-theme
    arc-theme
    nordic
    mullvad-vpn
    kitty
    zathura
    calibre
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
    am2rlauncher
  ];
}

{ config, lib, pkgs, ... }:

{
  imports = [
    ../../common/home.nix
  ];

  home.username = "bodo";
  home.homeDirectory = "/home/bodo";

  home.stateVersion = "23.05";

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
      ];
    })
    obsidian
    lutris
    feh
  ];

  services.polybar = {
    enable = true;
    package = pkgs.polybar.override {
        i3Support = true;
        pulseSupport = true;
    };
    script = "";
  };

  services.playerctld.enable = true;
}

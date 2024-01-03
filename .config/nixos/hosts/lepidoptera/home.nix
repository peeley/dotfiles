{ config, lib, pkgs, ... }:

let
  utils = import ../../common/utils.nix {
    lib = lib;
  };
in
utils.recursiveMerge [
  (import ../../common/home.nix {
    config = config;
    lib = lib;
    pkgs = pkgs;
  })
  {
    home.username = "bodo";
    home.homeDirectory = "/home/bodo";

    home.stateVersion = "23.05";

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
]

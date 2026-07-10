{ config, lib, pkgs, ... }:

{
  imports = [
    ../../common/home.nix
  ];

  home.username = "admin";
  home.homeDirectory = "/home/admin";

  home.stateVersion = "24.05";
}

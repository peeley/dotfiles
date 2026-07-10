{ config, lib, pkgs, ... }:

{
  imports = [
    ../../common/home.nix
  ];

  home.stateVersion = "22.05";

  home.packages = with pkgs; [
    clojure
    clj-kondo
    leiningen

    go
  ];
}

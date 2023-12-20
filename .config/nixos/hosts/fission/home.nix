{ config, lib, pkgs, ... }:

(import ../../common/home.nix {
    config = config;
    lib = lib;
    pkgs = pkgs;
}) //
{
  home.stateVersion = "22.05";

  home.packages = with pkgs; [
    clojure
    clj-kondo
    # clojure-lsp
    leiningen

    go
  ];
}

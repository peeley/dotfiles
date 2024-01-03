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
    home.stateVersion = "22.05";

    home.packages = with pkgs; [
      clojure
      clj-kondo
      # clojure-lsp
      leiningen

      go
    ];
  }
]

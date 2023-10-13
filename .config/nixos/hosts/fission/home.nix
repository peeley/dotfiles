{ config, lib, pkgs, ... }:

{
    programs.starship = {
        enable = true;
        enableZshIntegration = true;
    };

    home.stateVersion = "22.05";

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

    programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
    };

    home.packages = with pkgs; [
        ripgrep
        exa

        clojure
        clj-kondo
        clojure-lsp
        leiningen

        go
    ];
}

{ config, lib, pkgs, ... }:

{
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

        clojure
        clj-kondo
        clojure-lsp
        leiningen
        tailscale
    ];
}

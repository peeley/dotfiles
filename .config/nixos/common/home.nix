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

    programs.neovim = {
      enable = true;
      vimAlias = true;
      viAlias = true;
    };

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

    programs.fzf = {
        enable = true;
        enableZshIntegration = true;
    };

    home.packages = with pkgs; [
        ripgrep
        eza
        fd
        unzip
        bind
        vale
    ];
}

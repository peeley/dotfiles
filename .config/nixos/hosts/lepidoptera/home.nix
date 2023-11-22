{ config, lib, pkgs, ... }:

{
  home.username = "bodo";
  home.homeDirectory = "/home/bodo";

  home.stateVersion = "23.05";

  programs.starship = {
      enable = true;
      enableZshIntegration = true;
  };

  programs.git = {
      enable = true;
      userName = "Noah Snelson";
      userEmail = "noah.snelson@proton.me";
  };

  programs.bat = {
      enable = true;
      config = {
          theme = "ansi";
          style = "changes";
      };
  };

  programs.home-manager.enable = true;

  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    extraConfig = ''
      " sets vim to Vi IMproved
      set nocompatible
      set noswapfile

      " sets color of text and line no.'s according to dark background/syntax
      set background=dark
      syntax enable
      set number

      " sets proper formatting for tabs:
      " auto-indents to current indentation on new line
      " sets width of tabs = 4 spaces
      set autoindent
      set shiftwidth=4
      set tabstop=4
      set softtabstop=4
      set expandtab

      " shows matching parenthesis/brackets
      set showmatch

      " shows current mode and statusline
      set showmode
      set laststatus=2

      " highlight current row
      set cursorline
      hi CursorLine cterm=None ctermbg=darkgrey

      " faster redrawing, only when necessary
      set ttyfast
      set lazyredraw

      " renders unicode
      set encoding=utf-8

      " searches and highlights as characters are entered
      set incsearch
      set hlsearch

      " adds colored line and auto-breaks at char 80 to encourage short lines
      set colorcolumn=80
      set tw=79
      set linebreak

      " automatically reads file changes
      set autoread

      " sets cursor to vertical line if tmux is active
      if exists('$TMUX')
          let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
          let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
      else
          let &t_SI = "\<Esc>]50;CursorShape=1\x7"
              let &t_EI = "\<Esc>]50;CursorShape=0\x7"
      endif

      " i don't know how many god damn times i hit :W instead of :w or :X not :x
      :command W w
      :cnoreabbrev X x
    '';
  };

  programs.htop.enable = true;

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  home.packages = with pkgs; [
    ripgrep
    eza
    unzip
    paper-icon-theme
    arc-theme
    nordic
    mullvad-vpn
    kitty
    zathura
    calibre
    sqlite
    bind
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
}

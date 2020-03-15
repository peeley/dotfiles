#!/usr/bin/env bash
# script to install all vim plugins into ~/.vim/bundle
cd bundle/

# NERDTree - file explorer
git clone https://github.com/preservim/nerdtree.git
# Syntastic - syntax highlighting & syntax checking
git clone https://github.com/vim-syntastic/syntastic.git
# YouCompleteMe - auto-complete
git clone https://github.com/ycm-core/YouCompleteMe.git
# rust.vim - rust language Syntastic integration, syntax highlighting, etc.
git clone https://github.com/rust-lang/rust.vim.git
# vimtex - compile & view LaTeX automatically
git clone https://github.com/lervag/vimtex.git
# vim-vue - syntax highlighting for .vue files
git clone https://github.com/posva/vim-vue.git

# additional YCM language support for Go, JS, Rust, etc. need to be installed
cd YouCompleteMe
git submodule update --init --recursive
python3 install.py --all

cd ../
echo "\n Done! Enjoy Vim :)"

" sets vim to Vi IMproved
set nocompatible

" sets color of text and line no.'s according to dark background/syntax
set background=dark
syntax enable
set number

" sets proper formatting for tabs
set autoindent
set tabstop=4
set softtabstop=4

" shows matching parenthesis/brackets
set showmatch

" searches and highlights as characters are entered
set incsearch
set hlsearch

" sets cursor to vertical line if tmux is active
if exists('$TMUX')
	let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
	let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
	let &t_SI = "\<Esc>]50;CursorShape=1\x7"
        let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif


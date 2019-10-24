" sets vim to Vi IMproved
set nocompatible
set noswapfile

" sets color of text and line no.'s according to dark background/syntax
set background=dark
syntax enable
set number

" sets proper formatting for tabs:
"	auto-indents to current indentation on new line
"	sets width of tabs = 4 spaces
set autoindent
set shiftwidth	=4
set tabstop		=4
set softtabstop	=4
set expandtab

" shows matching parenthesis/brackets
set showmatch

" shows current mode and statusline
set showmode
set laststatus	=2

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

" package managment through pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

" allows creation or deletion of files within NERDTREE plugin
set modifiable

" adds matching angle brackets to highlighting
set matchpairs+=<:>

" keybinding to toggle NERDtree plugin
map <C-n> :NERDTreeToggle<CR>

" vimtex customisation for writing LaTeX
let g:vimtex_view_method ='mupdf'
let g:tex_flavor = 'latex'
let g:polyglot_disabled = ['latex']

" syntax checking with Syntastic
let g:ycm_show_diagnostics_ui=0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" set individual prog langs linters
let g:syntastic_haskell_checkers = ['hlint']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_pylint_rcfile='/home/bodo/.pylintrc'
let g:syntastic_tex_checkers = []

let g:syntastic_always_populate_loc_list =1
let g:syntastic_auto_loc_list =1
let g:syntastic_check_on_open =1
let g:syntastic_check_on_wq = 0


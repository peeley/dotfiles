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

" faster redrawing, only when necessary
set ttyfast
set lazyredraw

" searches and highlights as characters are entered
set incsearch
set hlsearch

" adds line at char 80 to encourage short lines
set colorcolumn=80
set tw=79

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
" replaces symbols in JavaScript files for readability
"let g:javascript_conceal_function = "ƒ"
"let g:javascript_conceal_arrow_function = "⇒"
"set conceallevel =1
"map <leader>l :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>

" keybinding to toggle NERDtree plugin
map <C-n> :NERDTreeToggle<CR>
let g:vimtex_view_method ='mupdf'

" syntax checking with Syntastic
let g:ycm_show_diagnostics_ui=0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_haskell_checkers = ['hlint']
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_always_populate_loc_list =1
let g:syntastic_auto_loc_list =1
let g:syntastic_check_on_open =1
let g:syntastic_check_on_wq = 0

" Vim-Plug
call plug#begin(stdpath('data') . '/plugged')

" Editing
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'
Plug 'justinmk/vim-sneak'

" Interface
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'fxn/vim-monochrome'

call plug#end()

" Airline Config
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail_improved'

" General editing config
filetype plugin indent on
syntax enable
set backspace=indent,eol,start
set autoindent
set smarttab
set number
set incsearch
set hlsearch
set scrolloff=1

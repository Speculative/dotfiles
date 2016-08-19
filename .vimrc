" Vundle stuff
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
" Linux
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Windows
" set rtp+=$HOME/vimfiles/bundle/Vundle.vim
" call vundle#begin('$HOME/vimfiles/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" General QoL
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-sleuth'
Plugin 'kshenoy/vim-signature'
Plugin 'justinmk/vim-sneak'
Plugin 'chrisbra/nrrwrgn'
Plugin 'unblevable/quick-scope'
Plugin 'jiangmiao/auto-pairs'

" Interface improvements
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'mhinz/vim-startify'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mkitt/tabline.vim'

" Aesthetic/Color Schemes
Plugin 'vim-airline/vim-airline-themes'
Plugin 'github-theme'
Plugin 'molokai'

" Based Ultisnips
Plugin 'sirver/ultisnips'

" Autocomplete
Plugin 'shougo/neocomplete.vim'

" Language-specific
Plugin 'sheerun/vim-polyglot'

call vundle#end()
filetype plugin indent on

" Airline config
let g:airline_theme='powerlineish'
let g:airline_left_sep=''
let g:airline_right_sep=''

" Nerd Commenter
let g:NERDSpaceDelims=1

" Indent Guides
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2

" Startify
let g:startify_bookmarks = [
    \ { 'v': '~/.vimrc' },
    \ { 'x': '~/.Xresources' },
    \ { 'b': '~/.config/bspwm/bspwmrc' },
    \ { 's': '~/.config/sxhkd/sxhkdrc' },
    \ { 'c': '~/code/structured-conversation/sc.vim' }
    \ ]
let g:startify_session_autoload = 1
let g:startify_list_order = ['bookmarks', 'files']

" Neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 2

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"

" Regular vimrc config
set number
set relativenumber
set laststatus=2
set cursorline

syntax on
set autoindent
" set smartindent

set ignorecase
set incsearch
set hlsearch

set mouse=a

" set columns=80
" set tw=80

set guifont=Consolas:h11
set t_Co=256
colorscheme molokai
let g:molokai_original = 1
set background=dark
set guioptions-=T
set guitablabel=\[%N\]\ %t\ %M

" Automatic comments are annoying
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Keybinds
nnoremap <Space> <Nop>
let mapleader=' '
set backspace=2
map <Leader>o :NERDTreeToggle<CR>
map <Leader>t :TlistToggle<CR>
autocmd BufEnter * lcd %:p:h

inoremap <expr><C-L> neocomplete#start_manual_complete()
inoremap <expr><C-L> neocomplete#complete_common_string()

" let g:pencil#textwidth = 80
" augroup pencil
"     autocmd!
"     autocmd FileType markdown,mkd,md,text call pencil#init({'wrap': 'hard'})
" augroup end

autocmd FileType ts,json,js setlocal sw=4 ts=4 sts=4 et

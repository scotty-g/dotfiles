" use vim instead of vi. should be first
set nocompatible

" syntax highlighting stuff
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'wting/rust.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

filetype plugin on
syntax enable
" uncomment to provide file name and line number in grep searches
" grepprg=grep\ -nH\ $*

" spaces over tabs
set expandtab

" 4 space tabs
set shiftwidth=4
set softtabstop=4

" auto indent!
set autoindent

" line number, omg a must have
set number

" mouse support in console, yes please
set mouse=a

" tab completion in command line
set wildmenu
set wildmode=list:longest,full

" remap jj to Esc
inoremap jj <Esc>
nnoremap JJJJ <Nop>

" incremental search and highlight things we find during search
" use :noh to remove highlight after a search
set incsearch
set hlsearch

" add cursor line
set cursorline

set laststatus=2

let g:airline_powerline_fonts = 1
" displays buffername on tabline when only one tab. disable for now in favor
" of vim-bufferline
" let g:airline#extensions#tabline#enabled = 1

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

colorscheme desert

map <C-n> :NERDTreeToggle<CR>

set hidden

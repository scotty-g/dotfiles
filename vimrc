" use vim instead of vi. should be first
set nocompatible

" syntax highlighting stuff
filetype on
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

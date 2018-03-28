set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

Plugin 'w0rp/ale'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jiangmiao/auto-pairs'
Plugin 'airblade/vim-gitgutter'
"Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix

set showmatch " show the matching part of the pair for [] {} and ()
set ruler "Position number at bottom right 
set guifont=Anonymous\ Pro\ for\ Powerline:h15

" Set encoding
set encoding=utf-8

" Use system clipboard
set clipboard=unnamed

" Jedi completion
let g:jedi#use_tabs_not_buffers = 1

" tabs in Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1 

" Airline theme
let g:airline_theme='minimalist'

" Close window if last remaining window is NerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" open Nerdtree at start
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" relative linenumbers
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" enable all Python syntax highlighting features
let python_highlight_all = 1

syntax on
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅
"set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\
"\ [%l/%L\ (%p%%)
filetype plugin indent on
au FileType py set autoindent
au FileType py set smartindent
au FileType py set textwidth=79 " PEP-8 Friendly

" Colour Theme
colors smyck

" NERDTree configuration
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']

" Gitgutter
set updatetime=250

" Linters for Python
let g:ale_linters = {
\   'python': ['flake8', 'pycodestyle', 'isort'],
\}

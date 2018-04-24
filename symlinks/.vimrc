" Autoinstall vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/bundle')

" Declare the list of plugins.
Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'ervandew/supertab'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

set scrolloff=5         " Leave 5 lines of buffer when scrolling
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
filetype plugin indent on
set fileformat=unix

set showmatch           " show the matching part of the pair for [] {} and ()
set ruler               " Position number at bottom right
set guifont=Anonymous\ Pro\ for\ Powerline:h15

" F9 for saving and executing python
autocmd FileType python nnoremap <buffer> <F9> :exec '!python3' shellescape(@%, 1)<cr>

" visual autocomplete for command menu
set wildmenu

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
filetype plugin indent on
syntax on
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅
au FileType py set autoindent
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

" add fzf support
set rtp+=/usr/local/opt/fzf

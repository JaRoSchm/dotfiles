" Autoinstall vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/bundle')

" Declare the list of plugins.
Plug 'w0rp/ale'             " linting
Plug 'tpope/vim-commentary'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/vim-gitbranch'
Plug 'bling/vim-bufferline'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/goyo.vim'
Plug 'vimwiki/vimwiki'
Plug 'donRaphaco/neotex'    " latex preview
Plug 'ludovicchabant/vim-gutentags'

" Completion plugin and snippets
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'zchee/deoplete-jedi'
Plug 'Shougo/neosnippet.vim'    " until deoppet.nvim is released
Plug 'Shougo/neosnippet-snippets'

" Check if fzf is installed and install it if not
if !empty(glob("/usr/local/opt/fzf"))
    Plug '/usr/local/opt/fzf'
else
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
endif
Plug 'junegunn/fzf.vim'

" Color schemes
Plug 'morhetz/gruvbox'
Plug 'romainl/Apprentice'
Plug 'JarrodCTaylor/spartan'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" set leader key to space
let mapleader=" "

" mappings
map <leader>h :History<cr>      " History with fzf
map <leader>b :Buffers<cr>      " Buffers with fzf
map <leader>f :Files<cr>        " Files with fzf
map <leader>ta :ALEToggle<cr>   " Toggle linting with ALE
map <leader>t :Tags<cr>
map / :BLines<cr>               " fuzzy search
command! W w                    " Save with :W
command! Q q                    " quite with :Q

set t_Co=256            " Activate 256 colors
set scrolloff=5         " Leave 5 lines of buffer when scrolling

" indention configuration
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
filetype plugin indent on

set fileformat=unix

set nobackup             " No backups left after done editing
set nowritebackup        " No backups made while editing

set incsearch            " Search as you type

" enable backspace
set backspace=indent,eol,start

set showmatch            " show the matching part of the pair for [] {} and ()
set ruler                " Position number at bottom right
set guifont=Anonymous\ Pro\ for\ Powerline:h15
set wildmenu             " visual autocomplete for command menu
set encoding=utf-8       " Set encoding
set clipboard=unnamed    " Use system clipboard

set autoread
set autowrite
set hidden

set foldmethod=indent    " Folding for Python
set foldlevel=99

" remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" F9 for saving and executing python
autocmd FileType python nnoremap <buffer> <F9> :exec '!python3' shellescape(@%, 1)<cr>

" lightline configuration
set laststatus=2

let g:lightline = {
\ 'colorscheme': 'jellybeans',
\ 'active': {
\   'left': [['mode', 'paste'], ['gitbranch'], ['bufferline']],
\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
\ },
\ 'component_function': {
\   'gitbranch': 'gitbranch#name'
\ },
\ 'component': {
\   'bufferline': '%{bufferline#refresh_status()}%{g:bufferline_status_info.before .
\                  g:bufferline_status_info.current .
\                  g:bufferline_status_info.after}'
\ },
\ 'component_expand': {
\   'linter_checking': 'lightline#ale#checking',
\   'linter_warnings': 'lightline#ale#warning',
\   'linter_errors': 'lightline#ale#errors',
\   'linter_ok': 'lightline#ale#ok'
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_checking': 'left',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error',
\   'linter_ok': 'left'
\ },
\ 'mode_map': {
\   'n' : 'N',
\   'i' : 'I',
\   'R' : 'R',
\   'v' : 'V',
\   'V' : 'V',
\   "\<C-v>": 'V',
\   's' : 'S',
\   'S' : 'S',
\   "\<C-s>": 'S'
\ },
\ }

let g:lightline#ale#indicator_warnings = "◆ "
let g:lightline#ale#indicator_errors = "✗ "
let g:lightline#ale#indicator_ok = "✓ "

" faster mode switching
set timeoutlen=1000 ttimeoutlen=0

" Don't show mode
set noshowmode

" Don't show bufferline
let g:bufferline_echo = 0
autocmd VimEnter *
  \ let &statusline='%{bufferline#refresh_status()}'
    \ .bufferline#get_status_string()

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

" Colour scheme
colorscheme spartan

" Gitgutter
set updatetime=250
let g:gitgutter_sign_added = '∙'
let gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

" ALE configuration
" Linters for Python
let g:ale_linters = {
\   'python': ['flake8', 'pycodestyle', 'isort'],
\}

let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'

" show preview for :Files command
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" settings for completion with tap
let g:deoplete#enable_at_startup = 1
let g:deoplete#disable_auto_complete = 1
let g:neosnippet#enable_snipmate_compatibility = 1

function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()

set completeopt-=preview

" snippet selection with ctrl k
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

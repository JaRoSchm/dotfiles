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
Plug 'tpope/vim-commentary'
" Plug 'scrooloose/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'bling/vim-bufferline'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'ajh17/VimCompletesMe'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'vimwiki/vimwiki'

" Color schemes
Plug 'morhetz/gruvbox'
Plug 'romainl/Apprentice'
Plug 'JarrodCTaylor/spartan'
Plug 'ewilazarus/preto'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Activate 256 colors
set t_Co=256

set scrolloff=5         " Leave 5 lines of buffer when scrolling
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
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'linter_ok': 'LightlineLinterOK'
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
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

" faster mode switching
set timeoutlen=1000 ttimeoutlen=0

" Don't show mode
set noshowmode

" Don't show bufferline
let g:bufferline_echo = 0
autocmd VimEnter *
  \ let &statusline='%{bufferline#refresh_status()}'
    \ .bufferline#get_status_string()

" Functions for Ale in Lightline
function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓' : ''
endfunction

autocmd User ALELint call s:MaybeUpdateLightline()

" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction

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
" colorscheme apprentice
colorscheme spartan
" colorscheme preto
" colorscheme smyck
" colorscheme gruvbox
" set background=dark    " Setting dark mode

" NERDTree configuration
" let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']

" Gitgutter
set updatetime=250
let g:gitgutter_sign_added = '∙'
let gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

" Linters for Python
let g:ale_linters = {
\   'python': ['flake8', 'pycodestyle', 'isort'],
\}

let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'

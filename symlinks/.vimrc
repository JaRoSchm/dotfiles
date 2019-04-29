" Autoinstall vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/bundle')

" Declare the list of plugins.
Plug 'tpope/vim-apathy'     " set path variable for different file types
Plug 'w0rp/ale'             " linting
Plug 'tpope/vim-commentary'
Plug 'https://git.danielmoch.com/vim-makejob.git'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/vim-gitbranch'
Plug 'bling/vim-bufferline'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'vimwiki/vimwiki'

Plug 'lifepillar/vim-mucomplete'
Plug 'davidhalter/jedi-vim/'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Check if fzf is installed and install it if not
if !empty(glob("/usr/local/opt/fzf"))
    Plug '/usr/local/opt/fzf'
else
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
endif
Plug 'junegunn/fzf.vim'

" Color schemes
Plug 'JarrodCTaylor/spartan'
Plug 'ewilazarus/preto'
Plug 'owickstrom/vim-colors-paramount'
Plug 'bruth/vim-newsprint-theme'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" set leader key to space
let mapleader=" "

" mappings
nnoremap <leader>h :History<cr>      " History with fzf
nnoremap <leader>b :Buffers<cr>      " Buffers with fzf
nnoremap <leader>f :Files<cr>        " Files with fzf
nnoremap <leader>ta :ALEToggle<cr>   " Toggle linting with ALE
nnoremap <leader>af :ALEFix<cr>
nnoremap <leader>t :Tags<cr>
nnoremap <leader>/ :BLines<cr>       " fuzzy search
" German spellchecking
nnoremap <leader>sg :setlocal spell spelllang=de_de<cr>
" English spellcheking
nnoremap <leader>se :setlocal spell spelllang=en_gb<cr>
command! W w                    " Save with :W
command! Q q                    " quite with :Q
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>   " jump to directory of file

set keywordprg=:help    " documentation for .vimrc with K
set t_Co=256
set scrolloff=5

" indention configuration
set expandtab
set autoindent
filetype plugin indent on

set fileformat=unix

set nobackup
set nowritebackup

syntax on

set incsearch

" enable backspace
set backspace=indent,eol,start

set showmatch
set ruler
set guifont=Anonymous\ Pro\ for\ Powerline:h15
set wildmenu
set encoding=utf-8
set clipboard=unnamed

set autoread
set autowrite
set hidden

set foldmethod=indent
set foldlevel=99

" remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" relative linenumbers
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Colour scheme
set background=dark
" colorscheme jaroschm " dark
" colorscheme paramount " light and dark
colorscheme paramount_mod " light and dark
" colorscheme newsprint
" colorscheme preto

"""""""""""""""
" Configuration of lightline

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
\   'v' : 'v',
\   'V' : 'V',
\   "\<C-v>": 'C-v',
\   's' : 's',
\   'S' : 'S',
\   "\<C-s>": 'C-s'
\ },
\ }

let g:lightline#ale#indicator_warnings = "◆ "
let g:lightline#ale#indicator_errors = "✗ "
let g:lightline#ale#indicator_ok = "✓ "

set timeoutlen=1000 ttimeoutlen=0

set noshowmode

" Don't show bufferline
let g:bufferline_echo = 0
autocmd VimEnter *
  \ let &statusline='%{bufferline#refresh_status()}'
    \ .bufferline#get_status_string()


"""""""""""""""
" Configuration of gitgutter

set updatetime=250
let g:gitgutter_sign_added = '∙'
let gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

"""""""""""""""
" Configuration of ALE

" Linters for Python
let g:ale_linters = {
\   'python': ['flake8', 'isort'],
\   'latex': ['chktex', 'lacheck'],
\}

let g:ale_fixers = {'python': ['black']}
let g:ale_python_black_options = '-l 79'

let g:ale_python_mypy_options = '--ignore-missing-imports'

let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'

"""""""""""""""
" Configuration of fzf

" show preview for :Files command
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)


"""""""""""""""
" Configuration of completion and snippets

set completeopt=noinsert,menuone,noselect,longest
set shortmess+=c
set belloff+=ctrlg
let g:jedi#popup_on_dot=0

let g:mucomplete#chains={}
let g:mucomplete#chains.default=['path', 'ulti',  'omni', 'keyn', 'tags']

let g:AutoPairsMapCR=0

" Expand snippet with enter
inoremap <silent> <expr> <plug>MyCR
    \ mucomplete#ultisnips#expand_snippet("\<cr>")
imap <cr> <plug>MyCR

let g:UltiSnipsExpandTrigger="<F4>"
let g:UltiSnipsJumpForwardTrigger="<C-k>"
let g:UltiSnipsJumpBackwardTrigger="<C-b>"
let g:UltiSnipsRemoveSelectModeMappings = 0

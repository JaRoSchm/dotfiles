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
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/vim-gitbranch'
Plug 'bling/vim-bufferline'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'vimwiki/vimwiki'
Plug 'donRaphaco/neotex'    " latex preview
Plug 'ludovicchabant/vim-gutentags'

" Completion
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-tagprefix'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-ultisnips'

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
nnoremap <leader>h :History<cr>      " History with fzf
nnoremap <leader>b :Buffers<cr>      " Buffers with fzf
nnoremap <leader>f :Files<cr>        " Files with fzf
nnoremap <leader>ta :ALEToggle<cr>   " Toggle linting with ALE
nnoremap <leader>t :Tags<cr>
nnoremap / :BLines<cr>               " fuzzy search
command! W w                    " Save with :W
command! Q q                    " quite with :Q
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>   " jump to directory of file

set keywordprg=:help    " documentation for .vimrc with K
set t_Co=256
set scrolloff=5

" indention configuration
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
filetype plugin indent on

set fileformat=unix

set nobackup
set nowritebackup

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

set timeoutlen=1000 ttimeoutlen=0

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


"""""""""""""""
" Configuration of NCM and snippets

" Use tab oder <C-x> for completion
let g:ncm2#auto_popup = 0
imap <C-x> <Plug>(ncm2_manual_trigger)

function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ ncm2#_on_complete(1)

set completeopt=noinsert,menuone,noselect

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
let g:UltiSnipsExpandTrigger="<F4>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0

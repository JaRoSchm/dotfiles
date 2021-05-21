" Autoinstall vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Find used operating system
function! Config_setEnv() abort
    if exists('g:env')
        return
    endif
    if has('win64') || has('win32') || has('win16')
        let g:env = 'WINDOWS'
    else
       let g:env = toupper(substitute(system('uname'), '\n', '', ''))
    endif
endfunction

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/bundle')

" Declare the list of plugins.
Plug 'tpope/vim-apathy'     " set path variable for different file types
Plug 'tpope/vim-fugitive'
Plug 'dense-analysis/ale'   " linting
Plug 'tpope/vim-commentary'
Plug 'git://git.danielmoch.com/vim-makejob.git'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/vim-gitbranch'
Plug 'bling/vim-bufferline'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'vimwiki/vimwiki'
Plug 'lervag/vimtex'
Plug 'neovimhaskell/haskell-vim'
Plug 'majutsushi/tagbar'

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'rhysd/vim-lsp-ale'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-ultisnips.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
Plug 'prabirshrestha/asyncomplete-buffer.vim'
Plug 'JuliaEditorSupport/julia-vim'

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
Plug 'wolverian/minimal'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" set leader key to space
let mapleader=" "

" mappings for fzf
" History with fzf
nnoremap <leader>h :History<cr>
" Buffers with fzf
nnoremap <leader>b :Buffers<cr>
" Files with fzf
nnoremap <leader>f :Files<cr>
nnoremap <leader>t :Tags<cr>
nnoremap <leader>bt :BTags<cr>
nnoremap <leader>/ :BLines<cr>       " fuzzy search

" mappings for ALE
nnoremap <leader>ta :ALEToggle<cr>   " Toggle linting with ALE
nnoremap <leader>af :ALEFix<cr>

" German spellchecking
nnoremap <leader>sg :setlocal spell spelllang=de_de<cr>
" English spellcheking
nnoremap <leader>se :setlocal spell spelllang=en_gb<cr>

" more mappings
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

set backupdir=$HOME/.vim/backupfiles//,/tmp//
set directory=$HOME/.vim/swapfiles//,/tmp//
set undodir=$HOME/.vim/undofiles//,/tmp//

syntax on

" search options
set incsearch
set ignorecase
set smartcase

" enable backspace in insert mode
set backspace=indent,eol,start

set showmatch
set ruler
set guifont=Anonymous\ Pro\ for\ Powerline:h15
set wildmenu
set encoding=utf-8

call Config_setEnv()
if (g:env =~# 'LINUX')
    set clipboard=unnamedplus
endif
if (g:env =~# 'DARWIN')
    set clipboard=unnamed
endif

set autoread
set autowrite
set hidden

" fold settings
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

" colour scheme
colorscheme minimal_mod
" colorscheme jaroschm " dark
" colorscheme paramount " light and dark
" colorscheme newsprint
" colorscheme preto

"""""""""""""""
" Configuration of lightline

set laststatus=2

let g:lightline = {
\ 'colorscheme': 'ayu_light',
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

" Linters for Python and Latex
let g:ale_linters = {
\   'python': ['vim-lsp'],
\   'latex': ['vim-lsp'],
\   'julia': ['vim-lsp'],
\   'java': ['javac'],
\   'haskell': ['ghc'],
\}

let g:ale_fixers = {
\   'python': ['black'],
\   'java': ['google_java_format'],
\   'haskell': ['stylish-haskell'],
\}

let g:ale_python_mypy_options = '--ignore-missing-imports'

let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'

"""""""""""""""
" Configuration of fzf

" show preview for :Files command
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)


"""""""""""""""
" Configuration of vimtex
"
let g:tex_flavor = 'latex'

"""""""""""""""
" Configuration of completion and snippets

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'whitelist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))

call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
    \ 'name': 'buffer',
    \ 'allowlist': ['*'],
    \ 'blocklist': ['go'],
    \ 'completor': function('asyncomplete#sources#buffer#completor'),
    \ 'config': {
    \    'max_buffer_size': 5000000,
    \  },
    \ }))

call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
\ 'name': 'ultisnips',
\ 'whitelist': ['*'],
\ 'completor': function('asyncomplete#sources#ultisnips#completor'),
\ }))

if executable('pylsp')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pylsp',
        \ 'cmd': {server_info->['pylsp']},
        \ 'allowlist': ['python'],
        \ })
endif

if executable('texlab')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'texlab',
        \ 'cmd': {server_info->['texlab']},
        \ 'allowlist': ['tex', 'latex', 'bib'],
        \ })
endif

if executable('julia')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'LanguageServer.jl',
        \ 'cmd': {server_info->['julia', '--startup-file=no', '--history-file=no', '-e', '
                \       using LanguageServer;
                \       using Pkg;
                \       import StaticLint;
                \       import SymbolServer;
                \       env_path = dirname(Pkg.Types.Context().env.project_file);
                \
                \       server = LanguageServer.LanguageServerInstance(stdin, stdout, env_path, "");
                \       server.runlinter = true;
                \       run(server);
                \   ']},
        \ 'allowlist': ['julia'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    imap <buffer> <expr><c-f> lsp#scroll(+4)
    imap <buffer> <expr><c-d> lsp#scroll(-4)
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
imap <c-space> <Plug>(asyncomplete_force_refresh)

let g:asyncomplete_auto_popup = 0
let g:lsp_diagnostics_enabled = 0

function! Check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ Check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

if has('python3')
    let g:UltiSnipsExpandTrigger="<c-e>"
    let g:UltiSnipsJumpForwardTrigger="<C-k>"
    let g:UltiSnipsJumpBackwardTrigger="<C-b>"
endif

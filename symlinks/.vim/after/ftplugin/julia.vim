set tabstop=4
set softtabstop=4
set shiftwidth=4

" F9 for saving and executing
nnoremap <buffer> <F9> :exec '!julia' shellescape(@%, 1)<cr>

set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅

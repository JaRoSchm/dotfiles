set tabstop=4
set softtabstop=4
set shiftwidth=4

" F9 for saving and executing
if executable('ipython')
  nnoremap <buffer> <F9> :exec '!ipython --pdb' shellescape(@%, 1)<cr>
else
  nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
endif

" enable all Python syntax highlighting features
let python_highlight_all = 1
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅
set textwidth=79

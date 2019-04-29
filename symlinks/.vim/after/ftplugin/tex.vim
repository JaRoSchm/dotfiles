set textwidth=80
set tabstop=4
set softtabstop=4
set shiftwidth=4

let g:makejob_hide_preview_window = 1
autocmd BufWritePost *.tex MakeJob!

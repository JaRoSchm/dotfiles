set textwidth=80

let g:makejob_hide_preview_window = 1
autocmd BufWritePost *.tex MakeJob!

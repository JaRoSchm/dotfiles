set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "minimal_mod"

hi Normal		guifg=#424242	ctermfg=black           guibg=#F4F3F1
hi NonText		guifg=#424242	ctermfg=black
hi comment		guifg=darkgray  ctermfg=darkgray	gui=italic
hi constant		guifg=#424242	ctermfg=black
hi string               guifg=darkgray  ctermfg=darkgray
hi identifier	        guifg=#424242   ctermfg=black
hi statement	        guifg=#424242	ctermfg=black	        gui=bold cterm=bold
hi define                                                       gui=bold cterm=bold
hi preproc		guifg=#424242	ctermfg=black
hi type			guifg=#424242	ctermfg=black	        gui=bold cterm=bold
hi special		guifg=#424242	ctermfg=black
hi Underlined	        guifg=#424242	ctermfg=black	        gui=underline	cterm=underline
hi label		guifg=#424242	ctermfg=black
hi operator		guifg=#424242	ctermfg=black
hi delimiter            guifg=darkgray  ctermfg=darkgray        gui=NONE cterm=NONE

hi ErrorMsg		guifg=#424242	ctermfg=black
hi WarningMsg	        guifg=#424242	ctermfg=black	        gui=bold cterm=bold
hi ModeMsg		guifg=#424242	ctermfg=black           gui=NONE
hi MoreMsg		guifg=#424242	ctermfg=black           gui=NONE
hi Error		guifg=#424242	ctermfg=black           gui=underline

hi SignColumn                                                   ctermbg=White guibg=#FFFFFF

hi Todo			guifg=#424242	ctermfg=black   ctermbg=grey
hi Cursor		guifg=#424242	ctermfg=black
hi Search		guifg=#424242	ctermfg=black
hi IncSearch	        guifg=#424242	ctermfg=black
hi LineNr		guifg=#424242	ctermfg=black
hi title		guifg=#424242	                        gui=bold        cterm=bold

hi StatusLine           guifg=#000000     ctermfg=black           cterm=none gui=none  guibg=black   ctermbg=black
hi StatusLineNC         guifg=#000000        ctermfg=black              cterm=none gui=none  guibg=#cccbca ctermbg=white
hi VertSplit            guifg=#424242   ctermfg=black           gui=none

hi Visual		guifg=#424242   ctermfg=black           term=reverse  ctermfg=black

hi DiffChange	        guifg=#424242   ctermfg=black
hi DiffText		guifg=#424242	ctermfg=black
hi DiffAdd		guifg=#424242   ctermfg=black
hi DiffDelete           guifg=#424242	ctermfg=black

hi Folded		guifg=#424242   ctermfg=black
hi FoldColumn	        guifg=#424242   ctermfg=black
hi cIf0			guifg=#424242	ctermfg=black

hi TagbarHighlight      ctermbg=grey    ctermfg=black
hi TagbarScope          ctermbg=white   ctermfg=black   cterm=bold
hi TagbarSignature      ctermbg=white   ctermfg=black

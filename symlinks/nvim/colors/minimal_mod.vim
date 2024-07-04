set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "minimal_mod"

hi Normal		guifg=black	ctermfg=black           guibg=white ctermbg=white
hi NonText		guifg=black	ctermfg=black
hi comment		guifg=gray40    ctermfg=darkgray
hi constant		guifg=black	ctermfg=black
hi string               guifg=gray40    ctermfg=darkgray
hi identifier	        guifg=black     ctermfg=black
hi statement	        guifg=gray40	ctermfg=darkgray	gui=bold cterm=bold
hi define                                                       gui=bold cterm=bold
hi preproc		guifg=black	ctermfg=black
hi type			guifg=black	ctermfg=black	        gui=bold cterm=bold
hi special		guifg=black	ctermfg=black
hi Underlined	        guifg=black	ctermfg=black	        gui=underline	cterm=underline
hi label		guifg=black	ctermfg=black
hi operator		guifg=black	ctermfg=black
hi delimiter            guifg=gray40    ctermfg=darkgray        gui=NONE cterm=NONE

hi ErrorMsg		guifg=black	ctermfg=black
hi WarningMsg	        guifg=black	ctermfg=black	        gui=bold cterm=bold
hi ModeMsg		guifg=black	ctermfg=black
hi MoreMsg		guifg=black	ctermfg=black
hi Error		guifg=black	ctermfg=black

hi SignColumn                                                   ctermbg=White guibg=White

hi Todo			guifg=black	ctermfg=black           ctermbg=grey guibg=grey
hi Cursor		guifg=black	ctermfg=black
hi Search		guifg=black	ctermfg=black
hi IncSearch	        guifg=black	ctermfg=black
hi LineNr		guifg=black	ctermfg=black
hi title		                                        gui=bold        cterm=bold

hi StatusLine           guifg=black     ctermfg=black           cterm=none gui=none  guibg=white   ctermbg=white
hi StatusLineNC         guifg=black     ctermfg=black           cterm=none gui=none  guibg=white   ctermbg=white
hi VertSplit            guifg=black     ctermfg=black           gui=none

hi Visual		guifg=black     ctermfg=black           term=reverse  ctermfg=black

hi DiffChange	        guifg=black     ctermfg=black
hi DiffText		guifg=black	ctermfg=black
hi DiffAdd		guifg=black     ctermfg=black
hi DiffDelete           guifg=black	ctermfg=black

hi Folded		guifg=black     ctermfg=black
hi FoldColumn	        guifg=black     ctermfg=black
hi cIf0			guifg=black  	ctermfg=black

hi TagbarHighlight      guibg=grey      ctermbg=grey            guifg=black     ctermfg=black
hi TagbarScope          ctermbg=white   ctermfg=black           cterm=bold      gui=bold
hi TagbarSignature      ctermbg=white   ctermfg=black           guibg=white     guifg=black

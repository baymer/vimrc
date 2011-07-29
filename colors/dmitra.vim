" Vim color file
" Maintainer:  Dmitra
" Last Change:  
" URL:          

set background=light	
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="dmitra"

hi Normal	guifg=Black		guibg=grey90
hi Visual		term=reverse cterm=reverse gui=reverse

hi Comment		gui=italic		guifg=gray20		guibg=NONE
hi Constant		gui=NONE		guifg=darkGreen			guibg=NONE
hi Identifier	gui=bold		guifg=#C73A5D		guibg=NONE
hi Statement 	gui=bold		guifg=black			guibg=NONE
hi PreProc		gui=NONE		guifg=RoyalBlue4	guibg=NONE	
hi Type			gui=bold		guifg=brown		guibg=NONE
hi Special		gui=NONE		guifg=darkGreen	guibg=NONE
hi Underlined	gui=bold		guifg=blue		guibg=NONE
"hi Ignore		
"hi Error		
"hi Todo		


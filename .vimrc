" based on http://code.google.com/p/myvim/

"-------------------------
" Common settings
"-------------------------
set nocompatible                         "don't need to keep compatibility with Vi

set background=dark                      "make vim use colors that look good on a dark background
set showcmd                              "show incomplete cmds down the bottom
set showmode                             "show current mode down the bottom
" set foldenable                           "enable folding
set showmatch                            "set show matching parenthesis

" set noexrc                    " don't use the local config

set virtualedit=all                      "allow the cursor to go in to "invalid" places

set incsearch                            "find the next match as we type the search
set hlsearch                             "highlight searches by default
set ignorecase                           "ignore case when searching

" New leader key
let mapleader = ","

" More suitable mapping
function SMap(key, action, ...)
    let modes = " vi"
    if (a:0 > 0)
        let modes = a:{1}
    endif
    if (match(modes, '\Ii') != -1)
        execute 'imap ' . a:key . ' <Esc>' . a:action
    endif
    if (match(modes, '\Nn') != -1)
        execute 'nmap ' . a:key . ' <Esc>' . a:action
    endif
    if (match(modes, ' ') != -1)
        execute 'map ' . a:key . ' <Esc>' . a:action
    endif
    if (match(modes, '\Vv') != -1)
        execute 'vmap ' . a:key . ' <Esc>' . a:action
    endif
endfunction

filetype plugin indent on       " enable detection, plugins and indenting in one step

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Keep 50 lines of command line history
set history=50		

" Show the cursor position all the time
set ruler		

" Turn on number vertical line
set number

" I don't like backups
set nobackup
set nowritebackup
set noswapfile

" Switch off folds
set nofoldenable
set foldmethod=indent

" Jump 5 lines when running out of the screen
set scrolljump=7

" Indicate jump out of the screen when 10 lines before end of the screen
set scrolloff=7

" Write all tmp files to /tmp
"set dir=/tmp

" Turn off any bells
set novisualbell
set t_vb=   

" Enable mouse
set mouse=a
set mousemodel=popup

" Default encoding
set termencoding=utf-8
set fileencodings=utf-8,cp1251,cp866,koi8-r

" Do NOT unload buffer when switch to another one
" this allows to edit several files in the same time without having to save
" them each time you switch between them
set hidden

" Hide the mouse when typing text
set mousehide

" Turn on autoindent
set autoindent

" Auto indent after a {
set smartindent

syntax on                                "Turn on syntax highlighting

" Expand tab to spaces ?
set expandtab

" Default tab size
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smarttab

" change working directory
set autochdir

" Status line format
set statusline=%<%f%h%m%r\ %b\ %{&encoding}\ 0x\ \ %l,%c%V\ %P 

" Fix <Enter> for comment
set fo+=cr

" Session options
set sessionoptions=curdir,buffers,tabpages
set foldcolumn=2

"-------------------------
" Useful functions
"-------------------------

function MoveTabLeft()
    let current_tab = tabpagenr()
   if current_tab > 1
       let current_tab = current_tab - 2
       execute 'tabmove' current_tab
    endif
endfunction

function MoveTabRight()
    let current_tab = tabpagenr()
    execute 'tabmove' current_tab
endfunction


"-------------------------
" Bindings
"-------------------------

" Make <Backspace> act as <Delete> in Visual mode?
vmap <BS> x

" Wrap selected text to 80 symbols per line
vmap <C-b> <esc>:'<,'>!fold -w 120 -s<cr>

" CTRL-C and CTRL-Insert are Copy
vmap <C-C> "+yi
imap <C-V> <esc>"+gPi

" Make shift-insert work like in Xterm
imap <S-Insert> <MiddleMouse>

" Use CTRL-F for omni completion
imap <C-F> <C-X><C-O>

" Search & replace the word under the cursor
nmap ; :%s/\<<c-r>=expand("<cword>")<cr>\>/

" F2 to quick save
call SMap("<F2>", ":w<cr>")

" F4 - Project toogle
call SMap("<silent><F4>", "<Plug>ToggleProject")

" F5 - show buffers
call SMap("<F5>", ":ls<cr>:b")

" F6 - prev buffer
call SMap("<F6>", ":bp<cr>")

" F7 - newxt buffer
call SMap("<F7>", ":bn<cr>")

" F8 - Marks
call SMap("<F8>", ":MarksBrowser<cr>")

" F10 kill buffer
call SMap("<F10>", ":bd<cr>")

" F11 - Tlist
call SMap("<F11>", ":TlistToggle<cr>")

" F12 to quick explorer
call SMap("<F12>", ":Explore<cr>")

" < & > to indent blocks
" vmap < <gv
" vmap > >gv

" Switch off fucked 'Replace mode'
imap <Ins> <Esc>wq

" C-T - new tab
call SMap("<C-t>", ":tabnew<cr>")

" Open tag under cursor in new tab
map <C-W>] <C-W>]:tab split<CR>gT:q<CR>gt 

map <F3> :vimgrep /fixme\\|todo/j *.[py,c,cc,pl]<CR>:cw<CR>

" Dublicate current line
imap <C-d> <esc>yypi

" Tab autocompletion
function InsertTabWrapper()
     let col = col('.') - 1
     if !col || getline('.')[col - 1] !~ '\k'
         return "\<tab>"
     else
         return "\<c-p>"
     endif
endfunction

imap <tab> <c-r>=InsertTabWrapper()<cr>

set complete=""
set complete+=.
set complete+=k
set complete+=b
set completeopt-=preview
set completeopt+=longest

map <Leader>tl :call MoveTabLeft()<CR>
map <Leader>tr :call MoveTabRight()<CR>

" Useful newline bindings for normal mode
map <S-Enter> O<Esc>
map <CR> o<Esc>
"-------------------------
" Colors
"-------------------------

set t_Co=256
colorscheme xoria256

"-------------------------
" Advanced Settings
"-------------------------
" Russian support 
set keymap=russian-jcukenwin 
" по умолчанию - латинская раскладка 
set iminsert=0 
" по умолчанию - латинская раскладка при поиске 
set imsearch=0 


set mps-=[:]

" Encoding menu
set wildmenu
set wcm=<Tab> 
menu Encoding.&koi8-r :e ++enc=koi8-r<CR>
menu Encoding.&windows-1251 :e ++enc=cp1251<CR>
menu Encoding.&cp866 :e ++enc=cp866<CR>
menu Encoding.&utf-8 :e ++enc=utf8 <CR>

" For 'view' mode
if &readonly == 1
	set nonumber
	set nofoldenable
	set foldcolumn=10

	nmap <F10> :qa<cr>
	nmap <Space> <PageDown>
endif

highlight TooLongLine term=reverse ctermfg=Yellow ctermbg=Red
match TooLongLine /.\%>81v/

"-------------------------
" Plugins Settings
"-------------------------

let g:SessionMgr_AutoManage = 0
let g:SessionMgr_DefaultName = "mysession"

let g:Tlist_Show_One_File = 1
let g:Tlist_GainFocus_On_ToggleOpen = 1

let Tlist_Ctags_Cmd = '/usr/bin/ctags'

let g:snippetsEmu_key = "<C-l>"

nmap <Leader>va <Plug>VCSAdd
nmap <Leader>vn <Plug>VCSAnnotate
nmap <Leader>vc <Plug>VCSCommit
nmap <Leader>vd <Plug>VCSDiff
nmap <Leader>vg <Plug>VCSGotoOriginal
nmap <Leader>vG <Plug>VCSGotoOriginal!
nmap <Leader>vl <Plug>VCSLog
nmap <Leader>vL <Plug>VCSLock
nmap <Leader>vr <Plug>VCSReview
nmap <Leader>vs <Plug>VCSStatus
nmap <Leader>vu <Plug>VCSUpdate
nmap <Leader>vU <Plug>VCSUnlock
nmap <Leader>vv <Plug>VCSVimDiff

let g:TranslateIt_Bin = "sdcv"
let g:proj_flags = "imstc"

let NERDShutUp=1

let html_use_css=1
"-------------------------
" Filetypes
"-------------------------
au BufRead,BufNewFile *.w3af set filetype=w3af
au BufRead,BufNewFile *.json set filetype=javascript

function! BufNewFile_PY()
0put = '#!/usr/bin/env python'
1put = '#-*- coding: utf-8 -*-'
normal G
endfunction
autocmd BufNewFile *.py call BufNewFile_PY()

function! BufNewFile_HTML()
0put = '<html>'
1put = '    <head>'
2put = '    </head>'
3put = '    <body>'
$put = '    </body>'
$put = '<html>'
normal 5
endfunction
autocmd BufNewFile *.html call BufNewFile_HTML()

set gdefault


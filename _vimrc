set nocompatible
colorscheme xoria256

set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab

set expandtab
set nu
"set guifont=Fixedsys:h11:::
set guifont=Monospace_821_BT:h11
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set nobackup
set nowritebackup
set noswapfile

set guioptions-=T "hide toolbar

"window size
set lines=35
set columns=110

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"braces autoclosing
imap [ []<LEFT>
imap ( ()<LEFT>
imap { {<ENTER><ENTER>}<UP><TAB>

inoremap " ""<LEFT>
inoremap ' ''<LEFT>
" inoremap < <><LEFT>

set gdefault

"inoremap <C-space> <C-x><C-o>

cmap T tabnew 

"au Filetype html,xml,xsl source ~/_vim/scripts/closetag.vim
au Filetype html,xml,xsl source $VIM/scripts/closetag.vim

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

autocmd BufNewFile *.py call BufNewFile_PY()
autocmd BufNewFile *.html call BufNewFile_HTML()

function! BufNewFile_PY()
    0put = '#!/usr/bin/env python'
    1put = '# -*- coding: utf-8 -*-'
    normal G
endfunction

function! BufNewFile_HTML()
    0put = '<html>'
    1put = '    <head>'
    2put = '    </head>'
    3put = '    <body>'
    4put = '        '
    5put = '    </body>'
    6put = '</html>'
    normal 5G
endfunction


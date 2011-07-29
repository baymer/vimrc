colorscheme xoria256

" set guifont=Monospace_821_BT:h10
set guifont=Monaco:h11          " windows
" set guifont=Inconsolata\ 12   " linux
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set encoding=utf8
set guioptions-=T
set guioptions-=m
map <silent> <F5> :if &guioptions =~# 'T' <Bar> 
                  \set guioptions-=T <Bar> 
                  \set guioptions-=m <Bar> 
                  \else <Bar> 
                  \set guioptions+=T <Bar> 
                  \set guioptions+=m <Bar> 
                  \endif<CR>

set fileformat=unix

set nobackup
set nowritebackup
set noswapfile

" window size
set lines=35
set columns=90

set autoindent
set smartindent
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set smarttab
set autochdir
set hidden
set diffopt=filler
set diffopt+=vertical
set diffopt+=iwhite
set iskeyword+=-

" braces autoclosing
imap [ []<LEFT>
imap ( ()<LEFT>
imap { {}<LEFT>

inoremap " ""<LEFT>
inoremap ' ''<LEFT>
snoremap ' ''<LEFT>

"inoremap <C-space> <C-x><C-o>

cnoremap <c-t> tabnew 

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

au BufRead,BufNewFile *.asp set filetype=asp.html

function! BufNewFile_PY()
0put = '#!/usr/bin/env python'
1put = '#-*- coding: utf-8 -*-'
normal G
endfunction
autocmd BufNewFile *.py call BufNewFile_PY()

imap <F2> <esc>:w<cr>
nmap <F2> :w<cr>
nmap <F3> :w<cr>:!launch.bat<cr>
" nmap <F4> yiw:new temp.js<cr>:r!findstr /n "<c-r>"" *.*
nmap <F6> :bp<cr>
nmap <F7> :bn<cr>
nmap <F9> :NERDTreeToggle<cr>
" new
nmap <F4> *:noautocmd vimgrep /<c-r>//j **/*.js <bar> :copen<cr>
nmap <F10> :NERDTreeFind<cr>

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

let g:user_zen_leader_key = ','

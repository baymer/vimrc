" following strings are required in .bashrc for proper work in terminal
" if [ "$COLORTERM" == "gnome-terminal" ]; then
"   export TERM=xterm-256color
" fi
" colorscheme xoria256
colorscheme railscasts


if has('gui_running')

  " window size
  " set lines=34
  " set columns=148
  set showtabline=2

  function! ToggleGuiOptions()
    if &guioptions =~# 'T'
      set guioptions-=T
      set guioptions-=m
    else
      set guioptions+=T
      set guioptions+=m
    endif
  endfunction

  set guioptions-=T
  set guioptions-=m
  set guioptions-=R
  set guioptions-=r
  set guioptions-=L

endif

if has('unix')
  set guifont=Inconsolata\ 13
else
  " set guifont=Monospace_821_BT:h10
  " set guifont=Monaco:h11          " windows
  " source $VIMRUNTIME/vimrc_example.vim
  " source $VIMRUNTIME/mswin.vim
  " behave mswin
endif

function! ToggleNu()
  if &number == 0
    set number
  else
    set nonumber
  endif
endfunction
nmap <silent> <F5> :call ToggleNu()<cr>

set encoding=utf8
set fileformat=unix

set nobackup
set nowritebackup
set noswapfile

set autoindent
" set smartindent
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set smarttab
set hlsearch
set incsearch
set hidden
set diffopt=filler
set diffopt+=vertical
set diffopt+=iwhite
" set updatetime=1000
set scrolloff=2
set wildmenu
set autoread

set iskeyword+=-

nnoremap <cr> :nohlsearch<cr><cr>

" braces autoclosing
imap [ []<left>
imap ( ()<left>
inoremap { {}<left>
inoremap {<space> {<space><space>}<left><left>
inoremap {<cr> {<cr>}<esc>O<tab>

inoremap " ""<left>
inoremap ' ''<left>
snoremap ' ''<left>

" inoremap <C-space> <C-x><C-o>

nnoremap <silent> <c-s-pagedown> :execute 'silent! tabmove ' . tabpagenr()<CR>
nnoremap <silent> <c-s-pageup> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

function! BufNewFile_PY()
  0put = '#!/usr/bin/env python'
  1put = '#-*- coding: utf-8 -*-'
  normal G
endfunction
autocmd BufNewFile *.py call BufNewFile_PY()

" au FileType javascript set syntax=jquery
au FileType htmldjango set ft=html.htmldjango
au FileType scss set ft=scss.css
au BufNewFile *.json set ft=javascript

nmap <F2> :w<cr>
imap <F2> <esc>:w<cr>
" nmap <F6> :bp<cr>
" nmap <F7> :bn<cr>
nmap <F9> :NERDTreeToggle<cr>
" new
" nmap <F4> *:noautocmd vimgrep /<c-r>//j **/* <bar> :copen<cr>
" nmap <F4> g*:noautocmd Ggrep '\W<c-r>/\W' <bar> :copen<cr>
nmap <F4> :Ggrep '\W<c-r>=expand("<cword>")<cr>\W'<cr> <bar> :copen<cr>
nmap g<F4> :Ggrep -l '\W<c-r>=expand("<cword>")<cr>\W'<cr> <bar> :copen<cr>
nmap <F10> :NERDTreeFind<cr>
nmap <F12> :copen<cr>

" OPTIMIZE: try to improve behavior
nmap Q <c-w>v:bp<cr><c-w>l:bd<cr>

filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype on
" let g:user_zen_leader_key = ','
filetype indent on

" open files
" do not set autochdir (working dir should be root)
nnoremap <m-t> :tabnew <c-r>=expand("%:h")<cr>/
nnoremap <m-e> :e <c-r>=expand("%:h")<cr>/
nnoremap <m-v> :tabnew ~/.vim/.vimrc<cr>

nnoremap <m-r> :!rm %<cr>Q

let g:fuf_file_exclude = '\v\~$|\.(o|exe|dll|bak|orig|swp|pyc|jpg|png|gif|svg)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
nnoremap <c-t> :<c-u>FufFile **/<cr>
nnoremap <c-b> :<c-u>FufBuffer<cr>


" Window operations
  " vertical resize by 2 lines
nmap <M-=> <C-W>2+
nmap <M--> <C-W>2-
  " horizontal resize by 2 digits
nmap <M-.> <C-w>2>
nmap <M-,> <C-w>2<

nmap <m-d> :diffsplit 

" fugitive
nmap <m-b> :.Gblame<cr>
vmap <m-b> :Gblame<cr>
nmap <m-c> :Gcommit<cr>
nmap <m-s> :Gstatus<cr>/modif<cr>:nohls<cr>
nmap <m-w> :Gwrite<cr>
nmap <m-p> :!git pull && git push<cr>
nmap <m-g> :Ggrep 
nmap <m-G> :Ggrep -l 
nmap <m-f> g*:Ggrep <c-r>/<cr>
nmap <m-o> <c-o>:copen<cr><c-w>T
" nmap <m-c> :Gcommit -am ''<left>
" nmap <m-p> :Git pull origin dev<cr>
" nmap <m-h> :Git push origin dev<cr>

""""""""""
set showcmd
set linebreak
set matchpairs+=<:>
" set browsedir

set foldmethod=indent
set foldlevel=1
" toggle folds with space
nmap <space> za

function! ToggleFoldMethod()
  if &foldmethod == 'diff'
    " echo 'diff'
    set foldmethod=indent
  else
    " echo 'nodiff'
    set foldmethod=diff
  endif
endfunction
nmap <silent> <F3> :call ToggleFoldMethod()<cr>

" some bash shortcuts
imap <c-f> <right>
cmap <m-f> <c-right>
cmap <m-b> <c-left>

" set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
" set keymap=russian-jcukenwin
" set iminsert=0
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

function! HighlightUnwantedSpaces()
  if &ft =~ 'help\|snippet'
    return
  endif
  syntax match ErrorMsg /\t/
  let w:m2=matchadd('ErrorMsg', '\s\+$', -1)
  let w:m3=matchadd('ErrorMsg', '\%80v.\+', -1)
endfunction
au BufWinEnter * call HighlightUnwantedSpaces()

let g:highlight_unwanted_spaces = 1
function! ToggleErrorMsg()
  if exists("g:highlight_unwanted_spaces")
    highlight ErrorMsg ctermfg=white ctermbg=red guifg=NONE guibg=NONE
    unlet g:highlight_unwanted_spaces
  else
    highlight ErrorMsg ctermfg=white ctermbg=red guifg=white guibg=#800000
    let g:highlight_unwanted_spaces = 1
  endif
endfunction
nmap <F6> :call ToggleErrorMsg()<cr>

command! KillWhitespace :normal :%s/ *$//g<cr><c-o><cr>

function! PyStyling()
  v:^\s*#\|'\|":s:\s*\([-+/*%]\)\(=\)\@!\s*: \1 :g
  v:^\s*#\|'\|":s:\s*\([-+/*%<>!=]=\)\s*: \1 :g
  " %s:\s*\(-[^=]\|+[^=]\)\s*:\1 \2 :ge
  " %s:\s\+$::ge
  " %s:\s\+$::ge
  " %s:\t:  :ge
  " %s:){:) {:e
  " %s:if\s*(\s*:if ( :e
  " %s:}\_\s*else\s*{:} else {:e
  " g:\<if\>:s:\s*) {$: ) {:e
endfunction

function! JsStyling()
  %s:\s\+$::ge
  %s:\t:  :ge
  %s:){:) {:e
  %s:\(if\|while\|for\)\s*(\s*:\1 ( :e
  %s:}\_\s*else\s*{:} else {:e
  g:\<if\>\|\<for\>:s:\s*) {$: ) {:e
  %s:\(\S\)\s*\(&&\|||\)\s*:\1 \2 :ge
endfunction

function! HamlStyling()
  %s:{{\(\w\+\)}}:{{ \1 }}:ge
  %s:\([^{]\){\s*\([^{]\):\1{ \2:ge
  %s:\([^}]\)\s*}$:\1 }:ge
  %s:\(\S\)\s*=>\s*\(\S\):\1 => \2:ge
endfunction

function! MergeSnippets()
  " merge.sh
  " for file in `ls .`
  " do
  "   echo $file >> ruby.snippets
  "   cat $file >> ruby.snippets
  " done
  " for file in `ls .`; do echo $file >> ruby.snippets; cat $file >> ruby.snippets; done
  v:snippet:s:^:\t:
  g:snippet:s:^\(\w\+\).*$:snippet \1:
endfunction

function! AutoGenSass()
  " autocmd BufWritePost *.sass !sass this.sass this.css
  " autocmd BufWritePost *.sass silent execute '!sass '.expand('%:t').' '.expand('%:t:r').'.css'
  set autochdir
  echo 'sass '.expand('%:t').' '.expand('%:t:r').'.css'
  autocmd BufWritePost *.sass call
          \ system('sass '.expand('%:t').' '.expand('%:t:r').'.css')
endfunction

" set virtualedit=block

set listchars=trail:$
" set list
set spell

" :redir @a>
" :history : -20,
" :redir END
" "ap

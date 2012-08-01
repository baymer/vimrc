set nocompatible

filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on


" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

set encoding=utf8
set fileencoding=utf8
set fileformat=unix

set backspace=indent,eol,start

set nobackup
set nowritebackup
set noswapfile

set wildmenu

set title
set ruler
set showcmd
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)

set scrolljump=5
set scrolloff=3

set incsearch
set hlsearch
set ignorecase
set smartcase
nnoremap <cr> :nohlsearch<cr><cr>

syntax on
" syntax enable " What the difference?
set autoindent
" set smartindent
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

" set pastetoggle=<leader>v
set smarttab

"  Solarized
set t_Co=256
let g:solarized_termcolors=256
set background=dark
colorscheme solarized
" call togglebg#map("<leader>b")

"FuzzyFinder
let g:fuf_file_exclude = '\v\~$|\.(o|exe|dll|bak|orig|swp|pyc|jpg|png|gif|svg)$|(^|[/\\])(\.(hg|git|bzr)|tmp)($|[/\\])'
" let g:fuf_dir_exclude = '\v(^|[/\\])(public)($|[/\\])'
" let g:fuf_file_exclude = '\v\~$|\.(o|exe|dll|bak|orig|swp|pyc|jpg|png|gif|svg)$|(^|[/\\])(\.(hg|git|bzr)|tmp|public)($|[/\\])'
nnoremap <silent> ffb :FufBuffer<CR>
nnoremap <silent> <leader>t :FufFile **/<CR>
nnoremap <silent> fff :FufFile<CR>
nnoremap <silent> ffd :FufDir<CR>
nnoremap <silent> ffj :FufJumpList<CR>
" nnoremap <c-t> :<c-u>FufFile **/<cr>
" nnoremap <c-b> :<c-u>FufBuffer<cr>
" nnoremap <m-F> :FufRenewCache<cr>


" NERDTree
nmap <leader>nf :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1

" fugitive
nmap <leader>b :.Gblame<cr>
vmap <leader>b :Gblame<cr>
nmap <leader>st :Gstatus<cr>/modif<cr>:nohls<cr>
nmap <leader>w :Gwrite<cr>
nmap <leader>p :!git pull && git push<cr>
" nmap <m-o> <c-o>:copen<cr><c-w>T
" nmap <m-p> :Git pull origin dev<cr>
" nmap <m-h> :Git push origin dev<cr>

set iskeyword+=-

" braces autoclosing
imap [ []<left>
imap ( ()<left>
inoremap { {}<left>
inoremap {<space> {<space><space>}<left><left>
inoremap {<cr> {<cr>}<esc>O

inoremap " ""<left>
inoremap ' ''<left>
snoremap ' ''<left>

set hidden
set diffopt=filler
set diffopt+=vertical
set diffopt+=iwhite
set autoread

" Python
autocmd FileType python setlocal sw=4
autocmd FileType python setlocal ts=4
autocmd FileType python setlocal sts=4
function! BufNewFile_PY()
  0put = '#!/usr/bin/env python'
  1put = '#-*- coding: utf-8 -*-'
  normal G
endfunction
autocmd BufNewFile *.py call BufNewFile_PY()
au FileType htmldjango set ft=html.htmldjango

" Sass
autocmd! FileType sass,scss syn cluster sassCssAttributes add=@cssColors
au FileType scss set ft=scss.css
au FileType less set ft=less.css

" au FileType javascript set syntax=jquery
au BufNewFile *.json set ft=javascript
au BufNewFile *.plaintex set ft=plaintex.tex

nmap <leader>s :w<cr>
imap <leader>s <esc>:w<cr>

" OPTIMIZE: try to improve behavior
" nnoremap Q <c-w>v:bp<cr><c-w>l:bd<cr>
nnoremap Q :bd<cr>

" let g:user_zen_leader_key = ','

" Open files
" Do not set autochdir (working dir should be root)
nnoremap <leader>e :e <c-r>=expand("%:h")<cr>/
nnoremap <leader>v :e ~/.vim/.vimrc<cr>
nnoremap <leader>d :diffsplit <c-r>=expand("%:h")<cr>/

" Some grep stuff
" let g:ackprg="ack-grep -H --nocolor --nogroup --column"
nmap <leader>a :Ack 
nmap <m-f> g*:Ack <c-r>/ app

" Slime-vim
"
" $ screen -S mysession
xmap gx <Plug>SlimeRegionSend
" nmap gx <Plug>SlimeParagraphSend

""""""""""
set linebreak
set wrap
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
  " let w:m3=matchadd('ErrorMsg', '\%81v.\+', -1)
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

function! SQLUpperCase()
  %s:\<analyze\>\|\<and\>\|\<as\>\|\<by\>\|\<desc\>\|\<exists\>\|\<explain\>\|\<from\>\|\<group\>\|\<in\>\|\<insert\>\|\<intersect\>\|\<into\>\|\<join\>\|\<limit\>\|\<not\>\|\<on\>\|\<order\>\|\<select\>\|\<set\>\|\<update\>\|\<where\>:\U&:gi
endfunction

function! Html2Haml()
  %g:^\s*<\/:d
  %s:<:%:
  %s:>::
endfunction

" set virtualedit=block

set listchars=trail:$
" set list
set spell

" :redir @a>
" :history : -20,
" :redir END
" "ap

" multiword search
" vnoremap * yq/p<cr>

function! ToggleNu()
  if &number == 0
    set number
  else
    set nonumber
  endif
endfunction
nmap <silent> <F5> :call ToggleNu()<cr>

imap <c-f> <right>

if has('unix')
  set guifont=Inconsolata:h18
else
  " set guifont=Monospace_821_BT:h10
  " set guifont=Monaco:h11          " windows
  " source $VIMRUNTIME/vimrc_example.vim
  " source $VIMRUNTIME/mswin.vim
  " behave mswin
endif

if has('gui_running')
  source ~/.vim/.gvimrc
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif


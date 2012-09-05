set nocompatible
filetype off

" Setting up Vundle - the vim plugin bundler
  let iCanHazVundle=1
  let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
  if !filereadable(vundle_readme)
    echo 'Installing Vundle..'
    echo ''
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
  endif
  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()
  Bundle 'gmarik/vundle'

  " Add your bundles here

  " Snipmate dependencies
  Bundle 'MarcWeber/vim-addon-mw-utils'
  Bundle 'tomtom/tlib_vim'
  " Bundle 'honza/snipmate-snippets'

  Bundle 'garbas/vim-snipmate'
  Bundle 'jpalardy/vim-slime'
  Bundle 'mileszs/ack.vim'
  Bundle 'Raimondi/delimitMate'
  Bundle 'scrooloose/nerdtree'
  Bundle 'tomtom/tcomment_vim'
  Bundle 'tpope/vim-fugitive'
  Bundle 'tpope/vim-endwise'
  Bundle 'tpope/vim-repeat'
  Bundle 'tpope/vim-surround'
  Bundle 'vim-scripts/FuzzyFinder'
  Bundle 'vim-scripts/L9'
  Bundle 'vim-scripts/vcscommand.vim'
  Bundle 'vim-scripts/tlib'

  Bundle 'othree/html5.vim'
  Bundle 'skammer/vim-css-color'
  Bundle 'hail2u/vim-css3-syntax'
  Bundle 'lukaszb/vim-web-indent'
  Bundle 'walm/jshint.vim'

  " HTML/HAML
  " Bundle 'hokaccha/vim-html5validator'
  " Bundle 'gregsexton/MatchTag'
  " CSS/LESS
  " Bundle 'miripiruni/vim-better-css-indent'
  " Bundle 'miripiruni/CSScomb-for-Vim'
  " JavaScript
  " Bundle 'pangloss/vim-javascript'
  " Bundle 'itspriddle/vim-jquery'
  " JSON
  " Bundle 'leshill/vim-json'

  " Bundle zencoding-vim
  " Bundle 'tpope/vim-rails'
  " Bundle 'tpope/vim-haml'
  " Bundle 'kchmck/vim-coffee-script'

  if iCanHazVundle == 0
    echo 'Installing Bundles, please ignore key map error messages'
    echo ''
    :BundleInstall
  endif
" Setting up Vundle - the vim plugin bundler end

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

" Solarized
set t_Co=256
let g:solarized_termcolors=256
set background=dark
colorscheme solarized
" call togglebg#map("<leader>b")

au VimEnter * if @% =~ '^_\(\w\+\.\)\+js' | syntax off | set ft=css.javascript | endif

" FuzzyFinder
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

" fugitive
nmap <leader>b :.Gblame<cr>
vmap <leader>b :Gblame<cr>
nmap <leader>g :Gstatus<cr>/modif<cr>:nohls<cr>
nmap <leader>w :Gwrite<cr>
nmap <leader>p :!git pull && git push<cr>
" nmap <m-o> <c-o>:copen<cr><c-w>T
" nmap <m-p> :Git pull origin dev<cr>
" nmap <m-h> :Git push origin dev<cr>

set iskeyword+=-

" delimitMate
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1

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
au BufRead,BufNewFile *.json set ft=javascript
au BufRead,BufNewFile *.bemhtml set ft=javascript
au BufRead,BufNewFile *.xjst set ft=javascript
au BufRead,BufNewFile *.tt2 set ft=tt2
au BufRead,BufNewFile *.plaintex set ft=plaintex.tex

au BufRead,BufNewFile *.html nmap <leader>o :!open %<cr>

nmap <leader>s :w<cr>
imap <leader>s <esc>:w<cr>

" OPTIMIZE: try to improve behavior
nnoremap Q <c-w>s:bp<cr><c-w>j:bd<cr>
" nnoremap Q :bd<cr>

nmap <leader>j :JSHint<cr>

" Open files
" Do not set autochdir (working dir should be root)
nnoremap <leader>e :e <c-r>=expand("%:h")<cr>/
nnoremap <leader>v :e ~/.vim/.vimrc<cr>
nnoremap <leader>d :diffsplit <c-r>=expand("%:h")<cr>/
cnoremap <leader>e <c-r>=expand("%:h")<cr>/

" Some grep stuff
" let g:ackprg="ack-grep -H --nocolor --nogroup --column"
nmap <leader>a :Ack 
nmap <m-f> g*:Ack <c-r>/ app

" Slime-vim
"
" $ screen -S mysession
xmap gx <Plug>SlimeRegionSend
" WARN: netrwPlugin has the same mapping
nmap gx <Plug>SlimeParagraphSend

nnoremap <leader>x 0y$:<c-r>"<cr>

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


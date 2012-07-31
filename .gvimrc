colorscheme railscasts
" window size
set lines=35
set columns=120
set showtabline=1

set shiftwidth=2
set tabstop=2
set softtabstop=2

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

nnoremap <silent> <c-t> :FufFile **/<CR>
nnoremap <silent> <c-b> :FufBuffer<CR>

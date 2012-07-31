nnoremap <silent> <c-s-pagedown> :execute 'silent! tabmove ' . tabpagenr()<CR>
nnoremap <silent> <c-s-pageup> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>

" nmap <F4> *:noautocmd vimgrep /<c-r>//j **/* <bar> :copen<cr>
" nmap <F4> g*:noautocmd Ggrep '\W<c-r>/\W' <bar> :copen<cr>
" nmap <F4> :Ggrep '\W<c-r>=expand("<cword>")<cr>\W'<cr> <bar> :copen<cr>
" nmap g<F4> :Ggrep -l '\W<c-r>=expand("<cword>")<cr>\W'<cr> <bar> :copen<cr>
" nmap <F12> :copen<cr>
" nmap <m-G> :Ggrep -l 
" nmap <m-f> g*:Ggrep <c-r>/<cr>
" nmap <m-f> g*:vimgrep /<c-r>// app/**/*<cr>

nnoremap <m-t> :tabnew <c-r>=expand("%:h")<cr>/
nnoremap <m-r> :!rm %<cr>:bd<cr>

" Window operations
" vertical resize by 2 lines
nmap <M-=> <C-W>2+
nmap <M--> <C-W>2-
" horizontal resize by 2 digits
nmap <M-.> <C-w>2>
nmap <M-,> <C-w>2<

" Some bash shortcuts
cmap <m-f> <c-right>
cmap <m-b> <c-left>

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

function! AutoGenSass()
  " autocmd BufWritePost *.sass !sass this.sass this.css
  " autocmd BufWritePost *.sass silent execute '!sass '.expand('%:t').' '.expand('%:t:r').'.css'
  set autochdir
  echo 'sass '.expand('%:t').' '.expand('%:t:r').'.css'
  autocmd BufWritePost *.sass call
          \ system('sass '.expand('%:t').' '.expand('%:t:r').'.css')
endfunction

" following strings are required in .bashrc for proper work in terminal
" if [ "$COLORTERM" == "gnome-terminal" ]; then
"   export TERM=xterm-256color
" fi


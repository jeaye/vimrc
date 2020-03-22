function! ConfigureTerminal()
  setlocal nonumber
  setlocal showtabline=0
  setlocal laststatus=0
  setlocal noruler
  inoremap jk <Nop>
  inoremap kj <Nop>
  let g:airline#extensions#tabline#enabled=0
  :terminal
  normal! i
endfunction

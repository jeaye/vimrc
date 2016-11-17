" Number formats, for incrementing
set nrformats=octal,hex

" Use a short timeout for incomplete mappings
set ttimeout
set ttimeoutlen=100

" Highlight the current line
set cursorline

" Go to file in a new tab
nnoremap gF <C-W>gF

" Cut lines into the paste buffer
noremap ,d "0d
noremap ,d "0d
noremap ,D "0D

" Allow Y to behave like C and D
nnoremap Y y$

" Paste from "0 by default
" https://stackoverflow.com/questions/54255/in-vim-is-there-a-way-to-delete-without-putting-text-in-the-register/32488853#32488853
noremap p "0p
noremap P "0P
for s:i in ['"','*','+','-','.',':','%','/','=','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
  execute 'noremap "'.s:i.'p "'.s:i.'p'
  execute 'noremap "'.s:i.'P "'.s:i.'P'
endfor

" Delete comment character(s) when joining commented lines
set formatoptions+=j

" Move based on display lines
noremap <buffer> <silent> k gk
noremap <buffer> <silent> j gj
noremap <buffer> <silent> 0 g0
noremap <buffer> <silent> $ g$

" Try not to use escape
"inoremap <Esc> <nop>
inoremap jk <Esc>
inoremap kj <Esc>

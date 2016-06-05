" Number formats, for incrementing
set nrformats=octal,hex

" Use a short timeout for incomplete mappings
set ttimeout
set ttimeoutlen=100

" Go to file in a new tab
nnoremap gF <C-W>gF

" Delete lines without adding them to the yank stack
nnoremap ,d "_d
vnoremap ,d "_d

nnoremap Y y$

" Delete comment character(s) when joining commented lines
set formatoptions+=j

" Move based on display lines
noremap <buffer> <silent> k gk
noremap <buffer> <silent> j gj
noremap <buffer> <silent> 0 g0
noremap <buffer> <silent> $ g$
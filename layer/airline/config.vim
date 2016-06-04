" Always show a helpful statusline
set laststatus=2
let g:airline_section_warning=''
let g:airline_theme='lucius'
let g:airline_exclude_preview=1
let g:airline_left_sep=''
let g:airline_right_sep=''

if !exists('g:airline_symbols')
  let g:airline_symbols={}
endif
let g:airline_symbols.linenr=''
let g:airline_symbols.branch=''
let g:airline_symbols.paste=''
let g:airline_symbols.whitespace=''

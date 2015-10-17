call neobundle#append()
  NeoBundle 'bling/vim-airline.git'
call neobundle#end()

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
let g:airline_symbols.linenr='\n'
let g:airline_symbols.branch='Branch:'
let g:airline_symbols.paste='ρ'
let g:airline_symbols.whitespace='Ξ'

" Always show a helpful statusline
set laststatus=2
let g:airline_section_warning = ''
let g:airline_theme = 'lucius'
let g:airline_exclude_preview = 1
let g:airline_detect_spelllang = 0

" Custom tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_close_button = 0

" Don't let just anyone take over the statusline
let g:airline_extensions = ['tabline', 'ctrlp', 'wordcount']

" CtrlP
let g:airline#extensions#ctrlp#show_adjacent_modes = 0

if !exists('g:airline_symbols')
  let g:airline_symbols={}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.paste = ''
let g:airline_symbols.whitespace = ''
let g:airline_symbols.spell = ''
let g:airline_symbols.notexists = ''

" Short form modes
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ }
